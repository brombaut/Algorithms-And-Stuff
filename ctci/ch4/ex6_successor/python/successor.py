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


def successor(node):
    if node is None:
        return None
    # Found right children -> return leftmost node of the right subtree
    if node.right() is not None:
        return leftMostChild(node.right())
    else:
        q = node
        x = q.parent()
        # Go up until we are on the left instead of the right
        while x is not None and x.left() != q:
            q = x
            x = x.parent()
        return x


def leftMostChild(node):
    if node is None:
        return None
    while node.left() is not None:
        node = node.left()
    return node


class TestSuccessor(unittest.TestCase):

    def test_simple_successor(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(2)
        right = BinaryTreeNode(6)
        root.setLeft(left)
        root.setRight(right)
        self.assertEqual(successor(root), right)
        self.assertEqual(successor(left), root)
        self.assertEqual(successor(right), None)

    def test_complex_successor(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(5)
        right = BinaryTreeNode(6)
        left_left = BinaryTreeNode(10)
        left_right = BinaryTreeNode(12)
        right_right = BinaryTreeNode(2)
        right_left = BinaryTreeNode(13)
        root.setLeft(left)
        left.setLeft(left_left)
        left.setRight(left_right)
        root.setRight(right)
        right.setRight(right_right)
        right.setLeft(right_left)
        self.assertEqual(successor(left_left), left)
        self.assertEqual(successor(left), left_right)
        self.assertEqual(successor(left_right), root)
        self.assertEqual(successor(root), right_left)
        self.assertEqual(successor(right_left), right)
        self.assertEqual(successor(right), right_right)
        self.assertEqual(successor(right_right), None)


if __name__ == "__main__":
    unittest.main(verbosity=2)
