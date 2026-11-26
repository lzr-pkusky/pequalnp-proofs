#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <unordered_set>
#include <vector>

using Mask = uint32_t;
constexpr int rows = 4;
constexpr int columns = 5;
constexpr int inputs = rows + columns;
constexpr Mask claimedMask = 33918;

struct Gate {
    char operation;
    int left;
    int right;
};

class ReadOnce {
    std::vector<std::vector<Mask>> values;
    size_t all;

public:
    explicit ReadOnce(const std::vector<Mask>& leaves)
        : values(1u << leaves.size()), all(values.size() - 1) {
        for (size_t i = 0; i < leaves.size(); ++i) values[1u << i] = {leaves[i]};
    }

    const std::vector<Mask>& masks(size_t subset) const { return values[subset]; }
    size_t full() const { return all; }

    bool enumerate(Mask target) {
        for (size_t set = 1; set < values.size(); ++set) {
            if (!values[set].empty()) continue;
            std::unordered_set<Mask> seen;
            for (size_t left = (set - 1) & set; left; left = (left - 1) & set) {
                size_t right = set ^ left;
                if (left > right) continue;
                for (Mask a : values[left]) {
                    for (Mask b : values[right]) {
                        seen.insert(a & b);
                        seen.insert(a | b);
                    }
                }
            }
            values[set].assign(seen.begin(), seen.end());
            std::sort(values[set].begin(), values[set].end());
        }
        return !values[all].empty() && std::binary_search(values[all].begin(), values[all].end(), target);
    }

    int emit(size_t set, Mask mask, const std::vector<int>& leaves, std::vector<Gate>& gates) const {
        if ((set & (set - 1)) == 0) return leaves[__builtin_ctz(static_cast<unsigned>(set))];
        for (size_t left = (set - 1) & set; left; left = (left - 1) & set) {
            size_t right = set ^ left;
            if (left > right) continue;
            for (Mask a : values[left]) {
                for (Mask b : values[right]) {
                    char op = (a & b) == mask ? '&' : (a | b) == mask ? '|' : '\0';
                    if (!op) continue;
                    int firstWire = emit(left, a, leaves, gates);
                    int secondWire = emit(right, b, leaves, gates);
                    gates.push_back({op, firstWire, secondWire});
                    return inputs + static_cast<int>(gates.size()) - 1;
                }
            }
        }
        std::abort();
    }
};

std::vector<Mask> input_masks() {
    std::vector<Mask> result(inputs);
    for (int r = 0; r < rows; ++r) {
        for (int c = 0; c < columns; ++c) {
            Mask bit = 1u << (r * columns + c);
            result[r] |= bit;
            result[rows + c] |= bit;
        }
    }
    return result;
}

std::pair<Mask, Mask> required_inner_bits(size_t inside, Mask target) {
    std::vector<Mask> valuations;
    for (int r = 0; r < rows; ++r) {
        for (int c = 0; c < columns; ++c) {
            valuations.push_back(((1u << r) | (1u << (rows + c))) & ~inside);
        }
    }
    Mask mustAccept = 0;
    Mask mustReject = 0;
    for (unsigned p = 0; p < valuations.size(); ++p) {
        if ((target & (1u << p)) == 0) continue;
        for (unsigned q = 0; q < valuations.size(); ++q) {
            if ((target & (1u << q)) != 0) continue;
            if ((valuations[p] & ~valuations[q]) != 0) continue;
            mustAccept |= 1u << p;
            mustReject |= 1u << q;
        }
    }
    return {mustAccept, mustReject};
}

void print_witness(std::vector<Mask> values, const std::vector<Gate>& gates, int output, Mask target) {
    for (const Gate& gate : gates) {
        Mask left = values.at(gate.left);
        Mask right = values.at(gate.right);
        std::cout << values.size() << ' ' << gate.operation << ' ' << gate.left << ' ' << gate.right << '\n';
        values.push_back(gate.operation == '&' ? left & right : left | right);
    }
    if (values.at(output) != target || gates.size() > 9) std::abort();
    std::cout << "Verified output wire " << output << '\n';
}

int main(int argumentCount, char** arguments) {
    Mask target = claimedMask;
    if (argumentCount == 2) {
        char* end = nullptr;
        const auto value = std::strtoul(arguments[1], &end, 10);
        if (end == arguments[1] || *end != '\0' || value >= (1u << (rows * columns))) return 2;
        target = static_cast<Mask>(value);
    } else if (argumentCount != 1) {
        return 2;
    }
    std::vector<Mask> initial = input_masks();
    std::vector<int> originalWires;
    for (int i = 0; i < inputs; ++i) originalWires.push_back(i);
    ReadOnce base(initial);
    if (base.enumerate(target)) {
        std::vector<Gate> gates;
        int output = base.emit(base.full(), target, originalWires, gates);
        print_witness(initial, gates, output, target);
        return 0;
    }

    size_t innerMasksTried = 0;
    for (size_t inside = 1; inside <= base.full(); ++inside) {
        auto [mustAccept, mustReject] = required_inner_bits(inside, target);
        if (mustAccept & mustReject) continue;
        std::vector<int> outerWires;
        std::vector<Mask> outerLeaves;
        for (int i = 0; i < inputs; ++i) {
            if ((inside & (1u << i)) != 0) continue;
            outerWires.push_back(i);
            outerLeaves.push_back(initial[i]);
        }
        for (Mask sharedMask : base.masks(inside)) {
            if ((sharedMask & mustAccept) != mustAccept || (sharedMask & mustReject) != 0) continue;
            ++innerMasksTried;
            auto leaves = outerLeaves;
            leaves.push_back(sharedMask);
            leaves.push_back(sharedMask);
            ReadOnce expanded(leaves);
            if (!expanded.enumerate(target)) continue;
            std::vector<Gate> gates;
            int sharedWire = base.emit(inside, sharedMask, originalWires, gates);
            auto wires = outerWires;
            wires.push_back(sharedWire);
            wires.push_back(sharedWire);
            int output = expanded.emit(expanded.full(), target, wires, gates);
            print_witness(initial, gates, output, target);
            return 0;
        }
    }
    std::cout << "No solution after testing " << innerMasksTried << " possible shared functions.\n";
    return 20;
}
