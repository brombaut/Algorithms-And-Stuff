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


def validate_bst_helper(root, min_val, max_val):
    if root is None:
        return True
    if min_val is not None and root.value() <= min_val:
        return False
    if max_val is not None and root.value() > max_val:
        return False
    return validate_bst_helper(root.left(), min_val, root.value()) \
        and validate_bst_helper(root.right(), root.value(), max_val)


def validate_bst(root):
    return validate_bst_helper(root, None, None)


def build_manual_bst():
    root_1 = BinaryTreeNode(5)
    left_1 = BinaryTreeNode(2)
    right_1 = BinaryTreeNode(7)
    left_left_1 = BinaryTreeNode(1)
    left_right_1 = BinaryTreeNode(4)
    right_left_1 = BinaryTreeNode(6)
    right_right_1 = BinaryTreeNode(8)
    left_right_left_1 = BinaryTreeNode(3)
    right_right_right_1 = BinaryTreeNode(9)

    root_1.setLeft(left_1)
    left_1.setLeft(left_left_1)
    left_1.setRight(left_right_1)
    left_right_1.setLeft(left_right_left_1)

    root_1.setRight(right_1)
    right_1.setLeft(right_left_1)
    right_1.setRight(right_right_1)
    right_right_1.setRight(right_right_right_1)

    return root_1


def build_manual_incorrect_bst():
    root_1 = BinaryTreeNode(5)
    left_1 = BinaryTreeNode(2)
    right_1 = BinaryTreeNode(7)
    left_left_1 = BinaryTreeNode(1)
    left_right_1 = BinaryTreeNode(4)
    right_left_1 = BinaryTreeNode(6)
    right_right_1 = BinaryTreeNode(8)
    left_right_left_1 = BinaryTreeNode(3)
    right_right_right_1 = BinaryTreeNode(9)

    root_1.setLeft(left_1)
    left_1.setLeft(left_left_1)
    left_1.setRight(left_right_1)
    left_right_1.setRight(left_right_left_1)

    root_1.setRight(right_1)
    right_1.setLeft(right_left_1)
    right_1.setRight(right_right_1)
    right_right_1.setRight(right_right_right_1)

    return root_1


class TestValidateBst(unittest.TestCase):

    def test_valid_bst(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(2)
        right = BinaryTreeNode(6)
        root.setLeft(left)
        root.setRight(right)
        self.assertTrue(validate_bst(root))

        root_complex = build_manual_bst()
        self.assertTrue(validate_bst(root_complex))

    def test_invalid_bst(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(5)
        right = BinaryTreeNode(6)
        root.setLeft(left)
        root.setRight(right)
        self.assertFalse(validate_bst(root))

        root_complex = build_manual_incorrect_bst()
        self.assertFalse(validate_bst(root_complex))


if __name__ == "__main__":
    unittest.main(verbosity=2)
