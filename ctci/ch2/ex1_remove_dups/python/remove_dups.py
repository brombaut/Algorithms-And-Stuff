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


def remove_dups(head):
    if head is None:
        return head
    seenValues = list([head.value])
    prevNode = head
    currNode = head.nextNode
    while currNode is not None:
        if currNode.value in seenValues:
            if currNode.nextNode is None:  # Remove tail
                prevNode.nextNode = None
                prevNode = currNode
                currNode = currNode.nextNode
            else:
                prevNode.nextNode = currNode.nextNode
                currNode = currNode.nextNode
        else:
            seenValues.append(currNode.value)
            prevNode = currNode
            currNode = currNode.nextNode
    return head
            


class TestRemoveDups(unittest.TestCase):

    def test_empty_list(self):
        l = Node.create_list([])
        result = remove_dups(l)
        expected = Node.create_list([])
        self.assertTrue(Node.compare_lists(result, expected))

    def test_no_dups(self):
        l = Node.create_list([1])
        result = remove_dups(l)
        expected = Node.create_list([1])
        self.assertTrue(Node.compare_lists(result, expected))

        l = Node.create_list([1, 2, 3])
        result = remove_dups(l)
        expected = Node.create_list([1, 2, 3])
        self.assertTrue(Node.compare_lists(result, expected))

    def test_dups(self):
        l = Node.create_list([1, 1, 2])
        result = remove_dups(l)
        expected = Node.create_list([1, 2])
        self.assertTrue(Node.compare_lists(result, expected))

        l = Node.create_list([1, 2, 2])
        result = remove_dups(l)
        expected = Node.create_list([1, 2])
        self.assertTrue(Node.compare_lists(result, expected))

        l = Node.create_list([2, 2, 2])
        result = remove_dups(l)
        expected = Node.create_list([2])
        self.assertTrue(Node.compare_lists(result, expected))

        l = Node.create_list([2, 2, 2, 3, 3, 2])
        result = remove_dups(l)
        expected = Node.create_list([2, 3])
        self.assertTrue(Node.compare_lists(result, expected))


if __name__== "__main__":
    unittest.main(verbosity=2)
