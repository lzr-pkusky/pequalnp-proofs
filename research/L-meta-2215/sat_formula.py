import itertools


class Formula:
    def __init__(self):
        self.variables = 0
        self.clauses = []

    def new(self):
        self.variables += 1
        return self.variables

    def add(self, *clause):
        self.clauses.append(clause)

    def select(self, size):
        choices = [self.new() for _ in range(size)]
        self.add(*choices)
        for first, second in itertools.combinations(choices, 2):
            self.add(-first, -second)
        return choices
