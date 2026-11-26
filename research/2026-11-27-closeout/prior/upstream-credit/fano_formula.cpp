#include <algorithm>
#include <cstdint>
#include <iostream>
#include <unordered_map>
#include <vector>

using Mask = uint64_t;

struct Expression {
    Mask a, b;
    unsigned cost;
    char op;
};

int main(int argc, char **) {
    unsigned n, positives, depth;
    if (!(std::cin >> n >> positives >> depth)) return 1;
    const Mask target = (Mask{1} << positives)-1;
    std::unordered_map<Mask,Expression> terms;
    std::vector<std::vector<Mask>> layers(depth+1);
    std::vector<std::pair<unsigned,Mask>> accepted;
    auto insert = [&](Mask x, Expression expr) {
        if (!terms.emplace(x,expr).second) return;
        layers[expr.cost].push_back(x);
        if (x && !(x & ~target)) accepted.emplace_back(expr.cost+1,x);
    };
    for (unsigned i=0;i<n;++i) {
        Mask a;
        std::cin >> a;
        insert(a,{i,0,0,'i'});
    }
    for (unsigned k=1;k<=depth;++k) {
        for (unsigned a=0;2*a<k;++a) {
            const auto b=k-1-a;
            for (auto x:layers[a]) for (auto y:layers[b]) {
                if (a==b && x>=y) continue;
                insert(x & y,{x,y,k,'A'});
                insert(x | y,{x,y,k,'O'});
            }
        }
        std::cerr << k << ' ' << layers[k].size() << ' ' << accepted.size() << '\n';
    }
    auto print = [&](auto &self, Mask x) -> void {
        const auto e=terms.at(x);
        if (e.op=='i') { std::cout << e.a; return; }
        std::cout << e.op << '(';
        self(self,e.a);
        std::cout << ',';
        self(self,e.b);
        std::cout << ')';
    };
    if (argc > 1) {
        for (const auto& [_,x]:accepted) {
            std::cout << x << ' ';
            print(print,x);
            std::cout << '\n';
        }
        return 0;
    }
    std::vector<unsigned> cost(target+1,100);
    std::vector<Mask> previous(target+1), last(target+1);
    cost[0]=0;
    for (Mask have=0;have<target;++have) {
        if (cost[have]>23) continue;
        for (auto [w,x]:accepted) {
            const auto next = have | x;
            if (cost[next]<=cost[have]+w) continue;
            cost[next]=cost[have]+w;
            previous[next]=have;
            last[next]=x;
        }
    }
    std::cout << "Best " << cost[target]-1 << '\n';
    for (auto left=target;left && cost[left]<100;left=previous[left]) {
        print(print,last[left]);
        std::cout << '\n';
    }
}
