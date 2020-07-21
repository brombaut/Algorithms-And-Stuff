import unittest


class StackNode:
    def __init__(self, value, minimum):
        self.value = value
        self.minimum = minimum


class StackMin:
    def __init__(self):
        self.stack = []
        self.index = 0

    def push(self, value):
        currMin = self.minimum()
        if value < currMin:
            currMin = value
        node = StackNode(value, currMin)
        self.stack.insert(self.index, node)
        self.index += 1

    def pop(self):
        self.index -= 1
        return self.stack[self.index].value

    def peek(self):
        return self.stack[self.index - 1].value if self.index > 0 else 9999

    def minimum(self):
        return self.stack[self.index - 1].minimum if self.index > 0 else 9999


def stack_min():
    pass


class TestStackMin(unittest.TestCase):

    def test_stack_min(self):
        stack = StackMin()
        stack.push(4)
        stack.push(7)
        self.assertEqual(stack.minimum(), 4)
        stack.push(2)
        self.assertEqual(stack.minimum(), 2)
        stack.pop()
        self.assertEqual(stack.minimum(), 4)


if __name__ == "__main__":
    unittest.main(verbosity=2)
