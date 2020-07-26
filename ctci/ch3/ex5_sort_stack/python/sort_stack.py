import unittest


class Stack:
    def __init__(self):
        self.stack = []
        self.index = -1

    def push(self, value):
        self.index += 1
        self.stack.insert(self.index, value)

    def pop(self):
        if self.index < 0:
            return None
        result = self.stack[self.index]
        self.index -= 1
        return result

    def peek(self):
        return self.stack[self.index] if self.index >= 0 else None

    def print(self):
        print(self.stack)


class SortStack:
    def __init__(self):
        self.s1 = Stack()
        self.s2 = Stack()

    def push(self, value):
        while self.s1.peek() is not None and value > self.s1.peek():
            self.move_top_s1_to_s2()
        self.s1.push(value)
        self.move_all_s2_to_s1()

    def pop(self):
        return self.s1.pop()

    def peek(self):
        return self.s1.peek()

    def move_top_s1_to_s2(self):
        self.s2.push(self.s1.pop())

    def move_all_s2_to_s1(self):
        while self.s2.peek() is not None:
            self.s1.push(self.s2.pop())


def sort_stack():
    pass


class TestSortStack(unittest.TestCase):

    def test_sort_stack(self):
        ss = SortStack()
        ss.push(3)
        ss.push(1)
        ss.push(8)
        ss.push(5)
        ss.push(0)
        result = ss.pop()
        self.assertEqual(result, 0)
        result = ss.pop()
        self.assertEqual(result, 1)
        result = ss.pop()
        self.assertEqual(result, 3)
        result = ss.pop()
        self.assertEqual(result, 5)
        result = ss.pop()
        self.assertEqual(result, 8)
        result = ss.pop()
        self.assertEqual(result, None)


if __name__ == "__main__":
    unittest.main(verbosity=2)
