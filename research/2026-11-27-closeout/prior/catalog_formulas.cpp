#include <algorithm>
#include <cstdint>
#include <iostream>
#include <map>
#include <unordered_map>
#include <vector>

struct Expr {
    uint32_t left;
    uint32_t right;
    char op;
};

int main(int argc, char **argv) {
    if (argc != 3) return 2;
    unsigned n = std::stoi(argv[1]);
    unsigned maxCost = std::stoi(argv[2]);
    const uint32_t full = (1u << (n*n)) - 1;
    std::map<uint32_t, std::vector<std::pair<std::string, unsigned>>> targets;
    std::string label;
    uint32_t mask;
    unsigned budget;
    while (std::cin >> label >> mask >> budget) targets[mask].emplace_back(label, budget);
    std::unordered_map<uint32_t, Expr> expr;
    std::vector<std::vector<uint32_t>> layers(maxCost + 1);
    auto print = [&](auto &self, uint32_t x) -> void {
        Expr e = expr.at(x);
        if (e.op == 'i') { std::cout << e.left; return; }
        std::cout << e.op << '(';
        if (e.op != 'T' && e.op != 'F') self(self, e.left);
        if (e.op == 'A' || e.op == 'O') { std::cout << ','; self(self, e.right); }
        std::cout << ')';
    };
    auto insert = [&](uint32_t x, Expr e, unsigned depth) {
        if (!expr.emplace(x,e).second) return;
        layers[depth].push_back(x);
        auto it = targets.find(x);
        if (it == targets.end()) return;
        for (const auto &step : it->second) {
            if (depth > step.second) continue;
            std::cout << step.first << ' ' << x << ' ' << depth << ' ';
            print(print, x);
            std::cout << std::endl;
        }
    };
    for (unsigned i = 0; i < n; ++i) {
        uint32_t rows = ((1u << n) - 1) << (n*i);
        uint32_t cols = 0;
        for (unsigned row = 0; row < n; ++row) cols |= 1u << (n*row + i);
        insert(rows, {i, 0, 'i'}, 0);
        insert(cols, {n+i, 0, 'i'}, 0);
    }
    for (unsigned d = 1; d <= maxCost; ++d) {
        if (d == 1) { insert(0, {0, 0, 'F'}, 1); insert(full, {0, 0, 'T'}, 1); }
        for (uint32_t u : layers[d-1]) insert(u ^ full, {u, 0, 'N'}, d);
        for (unsigned a = 0; 2*a < d; ++a) {
            for (uint32_t u : layers[a]) for (uint32_t v : layers[d-1-a]) {
                if (a == d-1-a && u >= v) continue;
                insert(u & v, {u,v,'A'}, d);
                insert(u | v, {u,v,'O'}, d);
            }
        }
        std::cerr << n << ' ' << d << ' ' << layers[d].size() << ' ' << expr.size() << '\n';
    }
}
