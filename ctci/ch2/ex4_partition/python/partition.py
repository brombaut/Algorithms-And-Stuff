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
        i = 1
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


def partition(node, partition):
    head = node
    tail = node
    while node is not None:
        nextNode = node.nextNode
        if node.value < partition:
            node.nextNode = head
            head = node
        else:
            tail.nextNode = node
            tail = node
        node = nextNode
    tail.nextNode = None
    return head


class TestPartition(unittest.TestCase):

    def test_partition(self):
        l = Node.create_list([1, 2, 3])
        expected = Node.create_list([3, 2, 1])
        result = partition(l, 5)
        self.assertTrue(Node.compare_lists(result, expected))

        l = Node.create_list([5, 6, 7])
        expected = Node.create_list([5, 6, 7])
        result = partition(l, 2)
        self.assertTrue(Node.compare_lists(result, expected))

        l = Node.create_list([3, 5, 8, 5, 10, 2, 1])
        expected = Node.create_list([1, 2, 3, 5, 8, 5, 10])
        result = partition(l, 5)
        self.assertTrue(Node.compare_lists(result, expected))


if __name__ == "__main__":
    unittest.main(verbosity=2)
