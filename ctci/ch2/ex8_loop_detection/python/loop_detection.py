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


def loop_detection(head):
    slow = head
    fast = head

    while fast is not None and fast.nextNode is not None:
        slow = slow.nextNode
        fast = fast.nextNode.nextNode
        if slow == fast:
            break
    if fast is None or fast.nextNode is None:
        return None

    slow = head
    while slow != fast:
        slow = slow.nextNode
        fast = fast.nextNode
    return fast


class TestLoopDetection(unittest.TestCase):

    def test_no_loop(self):
        l = Node.create_list([2, 1, 0])
        self.assertEqual(loop_detection(l), None)

    def test_loop(self):
        l = Node.create_list([1, 2, 3, 4, 5])
        loop_start = l.nextNode.nextNode
        temp = l
        while temp.nextNode is not None:
            temp = temp.nextNode
        temp.nextNode = loop_start
        self.assertEqual(loop_detection(l), loop_start)


if __name__ == "__main__":
    unittest.main(verbosity=2)
