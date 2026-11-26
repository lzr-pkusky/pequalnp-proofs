#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <unordered_set>
#include <vector>

using Mask = uint32_t;
constexpr Mask target = 4276677288u;

struct Wire {
    Mask values;
    int index;
};

struct Gate {
    char operation;
    int left;
    int right;
};

using Key = std::array<Mask, 10>;

struct Hash {
    size_t operator()(const Key& values) const {
        size_t hash = 0;
        for (Mask value : values) {
            hash ^= value + 0x9e3779b97f4a7c15ull + (hash << 6) + (hash >> 2);
        }
        return hash;
    }
};

class Search {
    std::array<std::array<std::unordered_set<Key, Hash>, 2>, 10> misses;
    std::vector<Gate> gates;
    std::array<Mask, 32> different{};
    std::array<Mask, 32> lower{};
    int visited = 0;

    Mask rename(Mask value, int low, int high) const {
        const int distance = (1 << high) - (1 << low);
        Mask flip = (value ^ (value >> distance)) & (lower[low] & ~lower[high]);
        return value ^ flip ^ (flip << distance);
    }

    Key key(const std::vector<Wire>& wires) const {
        Key result{};
        for (int symmetry = 0; symmetry < 6; ++symmetry) {
            Key candidate{};
            for (size_t i = 0; i < wires.size(); ++i) {
                Mask value = wires[i].values;
                switch (symmetry) {
                    case 1: value = rename(value, 1, 2); break;
                    case 2: value = rename(value, 1, 3); break;
                    case 3: value = rename(value, 2, 3); break;
                    case 4: value = rename(rename(value, 1, 2), 2, 3); break;
                    case 5: value = rename(rename(value, 2, 3), 1, 2); break;
                    default: break;
                }
                candidate[i] = value;
            }
            std::sort(candidate.begin(), candidate.begin() + wires.size());
            if (symmetry == 0 || candidate < result) result = candidate;
        }
        return result;
    }

    bool distinguish(const std::vector<Wire>& wires) const {
        for (unsigned distance = 1; distance < different.size(); ++distance) {
            Mask uncovered = different[distance];
            for (Wire wire : wires) {
                uncovered &= ~(wire.values ^ (wire.values >> distance));
            }
            if (uncovered) return false;
        }
        return true;
    }

    bool monotone_distinguish(const std::vector<Wire>& wires) const {
        for (unsigned negative = 0; negative < 32; ++negative) {
            if ((target >> negative) & 1) continue;
            Mask uncovered = target;
            for (Wire wire : wires) {
                if (((wire.values >> negative) & 1) == 0) uncovered &= ~wire.values;
            }
            if (uncovered) return false;
        }
        return true;
    }

    bool child(const std::vector<Wire>& wires, char operation, size_t i, size_t j,
               bool keepI, bool keepJ, int left, bool needNot) {
        Mask a = wires[i].values;
        Mask b = wires[j].values;
        Mask result = operation == '&' ? a & b : operation == '|' ? a | b : ~a;
        if (!result || result == UINT32_MAX) return false;
        if (std::any_of(wires.begin(), wires.end(), [=](Wire wire) { return wire.values == result; })) {
            return false;
        }
        std::vector<Wire> next;
        for (size_t index = 0; index < wires.size(); ++index) {
            if ((index != i || keepI) && (index != j || keepJ)) next.push_back(wires[index]);
        }
        next.push_back({result, 5 + static_cast<int>(gates.size())});
        if (next.size() > static_cast<size_t>(left) || !distinguish(next)) return false;
        gates.push_back({operation, wires[i].index, wires[j].index});
        if (walk(next, left - 1, needNot && operation != '!')) return true;
        gates.pop_back();
        return false;
    }

    bool walk(const std::vector<Wire>& wires, int left, bool needNot) {
        if (wires.size() == 1 && wires.front().values == target) return !needNot;
        const int slack = left + 1 - static_cast<int>(wires.size());
        if (left == 0 || (slack == 0 && (needNot || !monotone_distinguish(wires)))) return false;
        Key canon = key(wires);
        if (!misses[left][needNot].insert(canon).second) return false;
        ++visited;
        for (size_t i = 0; i < wires.size(); ++i) {
            if (slack >= 1 && child(wires, '!', i, i, false, false, left, needNot)) return true;
            if (slack >= 2 && child(wires, '!', i, i, true, true, left, needNot)) return true;
            for (size_t j = i + 1; j < wires.size(); ++j) {
                for (char operation : {'&', '|'}) {
                    for (int keep = 0; keep < 4; ++keep) {
                        if (__builtin_popcount(static_cast<unsigned>(keep)) > slack) continue;
                        if (child(wires, operation, i, j, keep & 1, keep & 2, left, needNot)) return true;
                    }
                }
            }
        }
        return false;
    }

public:
    int run() {
        std::vector<Wire> wires;
        for (int variable = 0; variable < 5; ++variable) {
            Mask mask = 0;
            for (unsigned input = 0; input < 32; ++input) {
                if ((input >> variable) & 1) mask |= 1u << input;
            }
            lower[variable] = mask;
            wires.push_back({mask, variable});
        }
        for (unsigned distance = 1; distance < different.size(); ++distance) {
            different[distance] = (target ^ (target >> distance)) & (UINT32_MAX >> distance);
        }
        std::cout << "Frontier search starting" << std::endl;
        const bool found = walk(wires, 9, true);
        std::cout << visited << " canonical states, " << (found ? "SAT" : "UNSAT") << '\n';
        if (!found) return 20;
        std::vector<Mask> masks;
        for (Wire wire : wires) masks.push_back(wire.values);
        for (Gate gate : gates) {
            Mask a = masks.at(gate.left);
            Mask b = masks.at(gate.right);
            std::cout << masks.size() << ' ' << gate.operation << ' ' << gate.left << ' ' << gate.right << '\n';
            masks.push_back(gate.operation == '&' ? a & b : gate.operation == '|' ? a | b : ~a);
        }
        if (masks.back() != target || gates.size() != 9) std::abort();
        return 0;
    }
};

int main() {
    return Search().run();
}
