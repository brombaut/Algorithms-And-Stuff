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

def return_kth_to_last(head, k):
    if head is None:
        return None
    currNode = head
    runner = head
    i = 0
    while i < k:
        if runner.nextNode is None:
            return head.value
        runner = runner.nextNode
        i += 1
    while runner.nextNode is not None:
        currNode = currNode.nextNode
        runner = runner.nextNode
    return currNode.value
    


class TestReturnKthToLast(unittest.TestCase):

    def test_last(self):
        l = Node.create_list([1])
        k = 0
        result = return_kth_to_last(l, k)
        expected = 1
        self.assertEqual(result, expected)

        l = Node.create_list([1, 2, 3])
        k = 0
        result = return_kth_to_last(l, k)
        expected = 3
        self.assertEqual(result, expected)

    def test_first(self):
        l = Node.create_list([1, 2, 3])
        k = 2
        result = return_kth_to_last(l, k)
        expected = 1
        self.assertEqual(result, expected)

    def test_middle(self):
        l = Node.create_list([1, 2, 3])
        k = 1
        result = return_kth_to_last(l, k)
        expected = 2
        self.assertEqual(result, expected)

        l = Node.create_list([1, 2, 3, 4, 5])
        k = 1
        result = return_kth_to_last(l, k)
        expected = 4
        self.assertEqual(result, expected)

    def test_out_of_range(self):
        l = Node.create_list([1, 2, 3])
        k = 3
        result = return_kth_to_last(l, k)
        expected = 1
        self.assertEqual(result, expected)

        l = Node.create_list([1])
        k = 3
        result = return_kth_to_last(l, k)
        expected = 1
        self.assertEqual(result, expected)


if __name__== "__main__":
    unittest.main(verbosity=2)
