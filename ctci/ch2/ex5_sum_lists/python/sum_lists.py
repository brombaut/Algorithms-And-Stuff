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


def sum_lists(node1, node2, carry=0):
    if node1 is None and node2 is None and carry == 0:
        return None
    value = carry
    if node1 is not None:
        value += node1.value
    if node2 is not None:
        value += node2.value
    result = Node(value % 10)
    if node1 is not None or node2 is not None:
        more = sum_lists(
            node1.nextNode if node1 is not None else None,
            node2.nextNode if node2 is not None else None,
            1 if value >= 10 else 0
        )
        result.nextNode = more
    return result


class TestSumLists(unittest.TestCase):

    def test_sum(self):
        l1 = Node.create_list([7, 1, 6])
        l2 = Node.create_list([5, 9, 2])
        expected = Node.create_list([2, 1, 9])
        result = sum_lists(l1, l2)
        self.assertTrue(Node.compare_lists(expected, result))

    def should_add_unbalanced_digits(self):
        l1 = Node.create_list([7])
        l2 = Node.create_list([5, 9, 2])
        expected = Node.create_list([2, 0, 3])
        result = sum_lists(l1, l2)
        self.assertTrue(Node.compare_lists(expected, result))


if __name__ == "__main__":
    unittest.main(verbosity=2)
