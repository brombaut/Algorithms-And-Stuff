import unittest


class BinaryTreeNode:
    def __init__(self, value):
        self._value = value
        self._left = None
        self._right = None

    def value(self):
        return self._value

    def left(self):
        return self._left

    def right(self):
        return self._right

    def setLeft(self, node):
        self._left = node

    def setRight(self, node):
        self._right = node

    def print(self):
        print(self._value)


def check_height(root):
    if root is None:
        return 0
    left_height = check_height(root.left())
    if left_height == -1:
        return -1
    right_height = check_height(root.right())
    if right_height == -1:
        return -1
    height_diff = left_height - right_height
    if abs(height_diff) > 1:
        return -1
    return max(left_height, right_height) + 1


def check_balanced(root):
    return check_height(root) is not -1


class TestCheckBalanced(unittest.TestCase):

    def test_balanced_single(self):
        root = BinaryTreeNode(4)
        self.assertTrue(check_balanced(root))

    def test_balanced_even(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(5)
        right = BinaryTreeNode(6)
        root.setLeft(left)
        root.setRight(right)
        self.assertTrue(check_balanced(root))

    def test_balanced_uneven(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(5)
        right = BinaryTreeNode(6)
        left_left = BinaryTreeNode(10)
        root.setLeft(left)
        root.setRight(right)
        left.setLeft(left_left)
        self.assertTrue(check_balanced(root))

    def test_unbalanced(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(5)
        left_left = BinaryTreeNode(10)
        root.setLeft(left)
        left.setLeft(left_left)
        self.assertFalse(check_balanced(root))


if __name__ == "__main__":
    unittest.main(verbosity=2)
