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


class BinaryTree:
    def __init__(self, root):
        self._root = root

    def root(self):
        return self._root

    def setRoot(self, root):
        self._root = root

    def in_order_traversal(self):
        BinaryTree.in_order_traversal_helper(self.root())

    def compare_to(self, tree_b):
        return BinaryTree.compare_nodes_rec(self.root(), tree_b.root())

    @staticmethod
    def in_order_traversal_helper(tree_node):
        if tree_node is None:
            return
        BinaryTree.in_order_traversal_helper(tree_node.left())
        tree_node.print()
        BinaryTree.in_order_traversal_helper(tree_node.right())

    @staticmethod
    def compare_nodes_rec(node_a, node_b):
        if node_a.value() != node_b.value():
            return False

        if node_a.left() is not None and node_b.left() is None:
            return False
        if node_a.left() is None and node_b.left() is not None:
            return False

        if node_b.right() is not None and node_b.right() is None:
            return False
        if node_b.right() is None and node_b.right() is not None:
            return False

        are_same = True
        if node_a.left() is not None:
            are_same = BinaryTree.compare_nodes_rec(
                node_a.left(), node_b.left())
        if node_a.right() is not None:
            are_same = are_same and BinaryTree.compare_nodes_rec(
                node_a.right(), node_b.right())
        return are_same


class BinarySearchTree(BinaryTree):

    def add_bst_node(self, node):
        if self.root() is None:
            self.setRoot(node)
            return
        BinarySearchTree.add(self.root(), node)

    @staticmethod
    def add(root, node):
        if node.value() < root.value():
            if root.left() is None:
                root.setLeft(node)
                return
            else:
                BinarySearchTree.add(root.left(), node)
        else:
            if root.right() is None:
                root.setRight(node)
                return
            else:
                BinarySearchTree.add(root.right(), node)


def minimal_tree(ordered_list):
    tree = BinarySearchTree(None)
    return minimal_tree_helper(0, len(ordered_list), ordered_list, tree)


def minimal_tree_helper(start, end, list, tree):
    middle = int((start + end) / 2)
    if start >= middle:
        return
    middle_node = BinaryTreeNode(list[middle])
    tree.add_bst_node(middle_node)
    minimal_tree_helper(start, middle, list, tree)
    minimal_tree_helper(middle + 1, end, list, tree)
    return tree


def build_simple_binary_tree(list):
    root = BinaryTreeNode(list[0])
    root.setLeft(BinaryTreeNode(list[1]))
    root.setRight(BinaryTreeNode(list[2]))
    tree = BinaryTree(root)
    return tree


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

    tree_1 = BinaryTree(root_1)
    return tree_1


class TestMinimalTree(unittest.TestCase):

    def test_binary_tree_compare(self):
        tree_1 = build_simple_binary_tree([2, 1, 3])
        tree_2 = build_simple_binary_tree([2, 1, 3])
        tree_3 = build_simple_binary_tree([2, 2, 3])
        self.assertTrue(tree_1.compare_to(tree_2))
        self.assertFalse(tree_1.compare_to(tree_3))

    def test_binary_search_tree_add(self):
        tree_1 = build_manual_bst()

        root_2 = BinaryTreeNode(5)
        left_2 = BinaryTreeNode(2)
        right_2 = BinaryTreeNode(7)
        left_left_2 = BinaryTreeNode(1)
        left_right_2 = BinaryTreeNode(4)
        right_left_2 = BinaryTreeNode(6)
        right_right_2 = BinaryTreeNode(8)
        left_right_left_2 = BinaryTreeNode(3)
        right_right_right_2 = BinaryTreeNode(9)

        tree_2 = BinarySearchTree(None)
        tree_2.add_bst_node(root_2)
        tree_2.add_bst_node(left_2)
        tree_2.add_bst_node(right_2)
        tree_2.add_bst_node(left_left_2)
        tree_2.add_bst_node(left_right_2)
        tree_2.add_bst_node(left_right_left_2)
        tree_2.add_bst_node(right_left_2)
        tree_2.add_bst_node(right_right_2)
        tree_2.add_bst_node(right_right_right_2)

        self.assertTrue(tree_1.compare_to(tree_2))

    def test_minimal_tree(self):
        tree_1 = build_manual_bst()
        tree_2 = minimal_tree([1, 2, 3, 4, 5, 6, 7, 8, 9])
        tree_2.in_order_traversal()
        self.assertTrue(tree_1.compare_to(tree_2))


if __name__ == "__main__":
    unittest.main(verbosity=2)
