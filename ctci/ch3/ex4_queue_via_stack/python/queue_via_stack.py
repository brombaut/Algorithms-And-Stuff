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


class MyQueue:
    def __init__(self):
        self.s1 = Stack()
        self.s2 = Stack()

    def enqueue(self, value):
        self.swap_s2_to_s1()
        self.s1.push(value)

    def dequeue(self):
        self.swap_s1_to_s2()
        return self.s2.pop()

    def swap_s1_to_s2(self):
        while self.s1.peek() is not None:
            self.s2.push(self.s1.pop())

    def swap_s2_to_s1(self):
        while self.s2.peek() is not None:
            self.s1.push(self.s2.pop())


def queue_via_stack():
    pass


class TestQueueViaStack(unittest.TestCase):

    def test_my_queue(self):
        q = MyQueue()
        q.enqueue(3)
        q.enqueue(4)
        result = q.dequeue()
        self.assertEqual(result, 3)
        result = q.dequeue()
        self.assertEqual(result, 4)
        result = q.dequeue()
        self.assertEqual(result, None)


if __name__ == "__main__":
    unittest.main(verbosity=2)
