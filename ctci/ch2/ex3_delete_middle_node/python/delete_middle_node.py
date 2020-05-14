import unittest

class Node:
    def __init__(self, value):
        self.value = value
        self.nextNode = None

    @staticmethod
    def compare_lists(l1, l2):
        while l1 and l2:
            if l1.value != l2.value:
                return False
            l1 = l1.nextNode
            l2 = l2.nextNode
        if l1 is not None or l2 is not None:
            return False
        return True

    @staticmethod
    def create_list(array):
        if array is None or len(array) < 1:
            return None
        head = Node(array[0])
        prev = head
        i = 1;
        while i < len(array):
            curr = Node(array[i])
            prev.nextNode = curr
            prev = curr
            i += 1
        return head

    @staticmethod
    def print_list(currNode):
        string = ""
        while currNode is not None:
            string += str(currNode.value) + " -> "
            currNode = currNode.nextNode
        print(string)


def delete_middle_node(node):
    if node is None or node.nextNode is None:
        node = None
    node.value = node.nextNode.value
    node.nextNode = node.nextNode.nextNode
    return None


class TestDeleteMiddleNode(unittest.TestCase):

    def test_delete_middle_node(self):
        l = Node.create_list([1, 2, 3])
        nodeToDelete = l.nextNode
        delete_middle_node(nodeToDelete)
        expected = Node.create_list([1, 3])
        self.assertTrue(Node.compare_lists(l, expected))

        l = Node.create_list([1, 2, 3, 4, 5])
        nodeToDelete = l.nextNode.nextNode
        delete_middle_node(nodeToDelete)
        expected = Node.create_list([1, 2, 4, 5])
        self.assertTrue(Node.compare_lists(l, expected))

        l = Node.create_list([1, 2, 3, 4])
        nodeToDelete = l.nextNode.nextNode
        delete_middle_node(nodeToDelete)
        expected = Node.create_list([1, 2, 4])
        self.assertTrue(Node.compare_lists(l, expected))
    


if __name__== "__main__":
    unittest.main(verbosity=2)
