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


def first_common_ancestor(root, p, q):
    # Check if either node is not in the tree, or if one covers the other
    if not covers(root, p) or not covers(root, q):
        return None
    elif covers(p, q):
        return p
    elif covers(q, p):
        return q
    # Travers upwards until you find a node that covers q
    sibling = get_sibling(p)
    parent = p.parent()
    while not covers(sibling, q):
        sibling = get_sibling(parent)
        parent = parent.parent()
    return parent


def covers(root, p):
    if root is None:
        return False
    if root == p:
        return True
    return covers(root.left(), p) or covers(root.right(), p)


def get_sibling(node):
    if node is None or node.parent() is None:
        return None
    parent = node.parent()
    return parent.right() if parent.left() == node else parent.left()


class TestFirstCommonAncestor(unittest.TestCase):

    def test_fca_simple(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(2)
        right = BinaryTreeNode(6)
        root.setLeft(left)
        root.setRight(right)
        self.assertEqual(first_common_ancestor(root, left, right), root)


if __name__ == "__main__":
    unittest.main(verbosity=2)
