import unittest

# Have a look at the solution in the book. They keep track of which rows
# and cols have to be zeroes in the first row and column of the matrix
def zero_matrix(matrix, m, n):
    zero_rows = list()
    zero_cols = list()
    i = 0
    while i < m:
        j = 0
        while j < n:
            if matrix[i][j] == 0:
                if i not in zero_rows:
                    zero_rows.append(i)
                if j not in zero_cols:
                    zero_cols.append(j)
            j += 1
        i += 1
    i = 0
    while i < len(zero_rows):
        row = zero_rows[i]
        j = 0
        while j < n:
            matrix[row][j] = 0
            j += 1
        i += 1
    j = 0
    while j < len(zero_cols):
        col = zero_cols[j]
        i = 0
        while i < m:
            matrix[i][col] = 0
            i += 1
        j += 1
    return matrix


class TestZeroMatrix(unittest.TestCase):

    def test_one_by_one(self):
        m = 1
        n = 1
        initial = [
            [1],
        ]
        expected = [
            [1]
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)
        initial = [
            [0],
        ]
        expected = [
            [0]
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)

    def test_one_by_two(self):
        m = 1
        n = 2
        initial = [
            [1, 2],
        ]
        expected = [
            [1, 2]
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)
        initial = [
            [0, 2],
        ]
        expected = [
            [0, 0]
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)
    
    def test_two_by_one(self):
        m = 2
        n = 1
        initial = [
            [1],
            [1]
        ]
        expected = [
            [1],
            [1]
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)
        initial = [
            [1],
            [0]
        ]
        expected = [
            [0],
            [0]
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)

    def test_two_by_two(self):
        m = 2
        n = 2
        initial = [
            [1, 2],
            [3, 4],
        ]
        expected = [
            [1, 2],
            [3, 4],
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)
        initial = [
            [1, 2],
            [0, 4],
        ]
        expected = [
            [0, 2],
            [0, 0],
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)
        initial = [
            [1, 0],
            [0, 4],
        ]
        expected = [
            [0, 0],
            [0, 0],
        ]
        self.assertEqual(zero_matrix(initial, m, n), expected)


if __name__== "__main__":
    unittest.main(verbosity=2)