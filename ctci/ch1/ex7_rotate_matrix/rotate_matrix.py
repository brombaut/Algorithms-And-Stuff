import unittest
import math

def rotate_matrix(m):
    n = len(m)
    layer = 0
    while layer < (n / 2):
        first = layer
        last = n - 1 - layer
        i = first
        while i < last:
            offset = i - first
            # save top
            top = m[first][i]
            # left -> top
            m[first][i] = m[last - offset][first]
            # bottom -> left
            m[last - offset][first] = m[last][last - offset]
            # right -> bottom
            m[last][last - offset] = m[i][last]
            # top -> right
            m[i][last] = top
            i += 1
        layer += 1
    return m


class TestRotateMatrix(unittest.TestCase):

    def test_1_by_1_matrix(self):
        initial = [
            [1],
        ]
        expected = [
            [1]
        ]
        self.assertEqual(rotate_matrix(initial), expected)

    def test_2_by_2_matrix(self):
        initial = [
            [1, 2],
            [3, 4]
        ]
        expected = [
            [3, 1],
            [4, 2]
        ]
        self.assertEqual(rotate_matrix(initial), expected)

    def test_3_by_3_matrix(self):
        initial = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        expected = [
            [7, 4, 1],
            [8, 5, 2],
            [9, 6, 3]
        ]
        self.assertEqual(rotate_matrix(initial), expected)

    def test_4_by_4_matrix(self):
        initial = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16],
        ]
        expected = [
            [13, 9, 5, 1],
            [14, 10, 6, 2],
            [15, 11, 7, 3],
            [16, 12, 8, 4],
        ]
        self.assertEqual(rotate_matrix(initial), expected)


if __name__== "__main__":
    unittest.main(verbosity=2)