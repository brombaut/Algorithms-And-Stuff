import unittest

class Stack:
    def __init__(self):
        self.stack = []
        self.index = -1

    def push(self, value):
        self.index += 1
        self.stack.insert(self.index, value)

    def pop(self):
        result =  self.stack[self.index]
        self.index -= 1
        return result

    def peek(self):
        return self.stack[self.index] if self.index >= 0 else None
    

class SetOfStacks:
    def __init__(self):
        self.masterIndex = -1
        self.threshold = 3
        self.stacks = []

    def push(self, value):
        self.masterIndex += 1
        self._currStack().push(value)

    def pop(self):
        if self.masterIndex < 0:
            return None
        result = self._currStack().pop()
        if self._currStack().peek() is None:
            self._setTopStackToNone()
        self.masterIndex -= 1
        return result

    def peek(self):
        return self._currStack().peek()

    def _currStack(self):
        stackIndex = int(self.masterIndex / self.threshold)
        if len(self.stacks) <= stackIndex or self.stacks[stackIndex] is None:
            self.stacks.insert(stackIndex, Stack())
        return self.stacks[stackIndex]

    def _setTopStackToNone(self):
        stackIndex = int(self.masterIndex / self.threshold)
        self.stacks[stackIndex] = None
        

def stack_of_plates():
    pass


class TestStackOfPlates(unittest.TestCase):

    def test_set_of_stacks(self):
        sos = SetOfStacks()
        sos.push(1)
        sos.push(2)
        result = sos.pop()
        self.assertEqual(result, 2)
        sos.push(2)
        sos.push(3)
        sos.push(4)
        result = sos.peek()
        self.assertEqual(result, 4)
        result = sos.pop()
        self.assertEqual(result, 4)
        result = sos.pop()
        self.assertEqual(result, 3)
        sos.push(4)
        result = sos.peek()
        self.assertEqual(result, 4)


if __name__== "__main__":
    unittest.main(verbosity=2)
