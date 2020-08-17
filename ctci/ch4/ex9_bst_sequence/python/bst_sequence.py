import unittest


class BinaryTreeNode:
    def __init__(self, value):
        self._value = value
        self._left = None
        self._right = None
        self._parent = None

    def value(self):
        return self._value

    def left(self):
        return self._left

    def right(self):
        return self._right

    def parent(self):
        return self._parent

    def setLeft(self, node):
        self._left = node
        node.setParent(self)

    def setRight(self, node):
        self._right = node
        node.setParent(self)

    def setParent(self, node):
        self._parent = node

    def print(self):
        print(self._value)


def bst_sequence(root, list):
    pass


class TestBstSequence(unittest.TestCase):

    def test_simple_bst(self):
        self.assertTrue(1 == 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)
