import unittest


class BinaryTreeNode:
    def __init__(self, value):
        self._value = value
        self._left = None
        self._right = None
        self._next = None

    def value(self):
        return self._value

    def left(self):
        return self._left

    def right(self):
        return self._right

    def next(self):
        return self._next

    def setLeft(self, node):
        self._left = node

    def setRight(self, node):
        self._right = node

    def setNext(self, node):
        self._next = node

    def print(self):
        print(self._value)


def create_list_of_depths(root, map_of_level_lists, level_index):
    if root is None:
        return
    level_list = None
    if level_index not in map_of_level_lists.keys():
        map_of_level_lists[level_index] = root
    else:
        level_list_node = map_of_level_lists[level_index]
        while level_list_node.next() is not None:
            level_list_node = level_list_node.next()
        level_list_node.setNext(root)
    create_list_of_depths(root.left(), map_of_level_lists, level_index + 1)
    create_list_of_depths(root.right(), map_of_level_lists, level_index + 1)


def list_of_depths(root):
    map_of_lists = dict()
    create_list_of_depths(root, map_of_lists, 0)
    return map_of_lists


class TestListOfDepths(unittest.TestCase):

    def test_single_level(self):
        root = BinaryTreeNode(4)
        result = list_of_depths(root)
        self.assertTrue(len(result) == 1)
        self.assertTrue(result[0] is not None)
        self.assertEqual(result[0], root)
        self.assertEqual(result[0].next(), None)

    def test_multi_level(self):
        root = BinaryTreeNode(4)
        left = BinaryTreeNode(5)
        right = BinaryTreeNode(6)
        left_left = BinaryTreeNode(10)
        right_right = BinaryTreeNode(2)
        root.setLeft(left)
        left.setLeft(left_left)
        root.setRight(right)
        right.setRight(right_right)
        result = list_of_depths(root)
        self.assertTrue(len(result) == 3)
        self.assertTrue(result[0] is not None)
        self.assertTrue(result[1] is not None)
        self.assertTrue(result[2] is not None)
        self.assertEqual(result[0], root)
        self.assertEqual(result[0].next(), None)
        self.assertEqual(result[1], left)
        self.assertEqual(result[1].next(), right)
        self.assertEqual(result[1].next().next(), None)
        self.assertEqual(result[2], left_left)
        self.assertEqual(result[2].next(), right_right)
        self.assertEqual(result[2].next().next(), None)


if __name__ == "__main__":
    unittest.main(verbosity=2)
