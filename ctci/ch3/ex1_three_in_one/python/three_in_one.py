import unittest


class ThreeInOneStack:
    def __init__(self):
        self.stack = []
        self.index_1 = 0
        self.index_2 = 1
        self.index_3 = 2

    def push_one(self, value):
        self.stack.insert(self.index_1, value)
        self.index_1 += 3

    def pop_one(self):
        self.index_1 -= 3
        return self.stack[self.index_1]

    def push_two(self, value):
        self.stack.insert(self.index_2, value)
        self.index_2 += 3

    def pop_two(self):
        self.index_2 -= 3
        return self.stack[self.index_2]

    def push_three(self, value):
        self.stack.insert(self.index_3, value)
        self.index_3 += 3

    def pop_three(self):
        self.index_3 -= 3
        return self.stack[self.index_3]


def three_in_one():
    pass


class TestThreeInOne(unittest.TestCase):

    def test_three_in_one_stack(self):
        s = ThreeInOneStack()
        s.push_one(1)
        s.push_one(2)
        s.push_two(3)
        s.push_three(4)
        result = s.pop_one()
        self.assertEqual(result, 2)
        result = s.pop_two()
        self.assertEqual(result, 3)
        result = s.pop_three()
        self.assertEqual(result, 4)
        result = s.pop_one()
        self.assertEqual(result, 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)
