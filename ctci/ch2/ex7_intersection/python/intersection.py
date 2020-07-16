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


def intersection(n1, n2):
    if n1 is None or n2 is None:
        return None  # No Intersection
    run1 = n1
    len1 = 1
    while run1.nextNode is not None:
        run1 = run1.nextNode
        len1 += 1

    run2 = n2
    len2 = 1
    while run2.nextNode is not None:
        run2 = run2.nextNode
        len2 += 1

    if run1 != run2:
        return None  # No Intersection

    run1 = n1
    run2 = n2

    diff = len1 - len2

    count1 = diff
    while count1 > 0:
        run1 = run1.nextNode
        count -= 1

    count2 = diff
    while count1 < 0:
        run2 = run2.nextNode
        count += 1

    while run1 and run2:
        if run1 == run2:
            return run1
        run1 = run1.nextNode
        run2 = run2.nextNode
    return None


class TestIntersection(unittest.TestCase):

    def test_different_list_should_not_intersect(self):
        n1 = Node.create_list([2, 1, 0])
        n2 = Node.create_list([2, 1, 0])
        result = intersection(n1, n2)
        self.assertEqual(result, None)

    def test_same_list_should_intersect(self):
        n1 = Node.create_list([2, 1, 0])
        n2 = n1
        result = intersection(n1, n2)
        self.assertEqual(result, n1)

    def test_equal_len_list_with_intersection(self):
        intersect = Node.create_list([2, 1, 0])
        n1 = Node.create_list([3, 4])
        n1.nextNode = intersect
        n2 = Node.create_list([5, 6])
        n2.nextNode = intersect
        result = intersection(n1, n2)
        self.assertEqual(result, intersect)

    def test_diff_len_list_with_no_intersection(self):
        n1 = Node.create_list([2])
        n2 = Node.create_list([2, 1, 0])
        result = intersection(n1, n2)
        self.assertEqual(result, None)

    def test_longer_first_list_with_intersection(self):
        intersect = Node.create_list([2, 1, 0])
        n1 = Node.create_list([2])
        n1.nextNode = intersect
        n2 = Node.create_list([2, 1, 0])
        n2.nextNode = intersect
        result = intersection(n1, n2)
        self.assertEqual(result, intersect)

    def test_longer_second_list_with_intersection(self):
        intersect = Node.create_list([2, 1, 0])
        n1 = Node.create_list([2, 1, 0])
        n1.nextNode = intersect
        n2 = Node.create_list([2])
        n2.nextNode = intersect
        result = intersection(n1, n2)
        self.assertEqual(result, intersect)


if __name__ == "__main__":
    unittest.main(verbosity=2)
