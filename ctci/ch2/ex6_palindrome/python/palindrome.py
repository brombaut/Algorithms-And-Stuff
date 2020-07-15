import unittest


class Node:
    def __init__(self, value):
        self.value = value
        self.nextNode = None

    def copy(self):
        return Node(self.value)

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


def palindrome(head):
    if head is None:
        return True
    length = number_of_nodes(head)
    rev_head = reverse(head)
    count = 0
    while count < length / 2:
        if head.value != rev_head.value:
            return False
        head = head.nextNode
        rev_head = rev_head.nextNode
        count += 1
    return True


def number_of_nodes(head):
    count = 0
    while head is not None:
        count += 1
        head = head.nextNode
    return count


def reverse(head):
    if head is None:
        return None
    rev_head = None
    while head is not None:
        temp = rev_head
        rev_head = head.copy()
        rev_head.nextNode = temp
        head = head.nextNode
    return rev_head


class TestPalindrome(unittest.TestCase):

    def test_empty_palindrome(self):
        l = Node.create_list([])
        self.assertTrue(palindrome(l))

    def test_odd_palindrome(self):
        l = Node.create_list([2, 1, 0, 1, 2])
        self.assertTrue(palindrome(l))

    def test_even_palindrome(self):
        l = Node.create_list([2, 1, 0, 0, 1, 2])
        self.assertTrue(palindrome(l))

    def test_not_palindrome(self):
        l = Node.create_list([2, 1, 0, 1, 1, 2])
        self.assertFalse(palindrome(l))


if __name__ == "__main__":
    unittest.main(verbosity=2)
