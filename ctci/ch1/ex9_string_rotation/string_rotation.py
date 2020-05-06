import unittest

def is_substring(s1, s2):
    return s2 in s1

def string_rotation(s1, s2):
    if len(s1) != len(s2):
        return False
    if s1 == s2:
        return True
    concattedString = s1 + s1
    return is_substring(concattedString, s2)


class TestStringRotation(unittest.TestCase):

    def test_different_string_lengths(self):
        self.assertFalse(string_rotation("water", "waters"))
        self.assertFalse(string_rotation("waters", "water"))
        self.assertFalse(string_rotation("", "water"))
        self.assertFalse(string_rotation("water", ""))
    
    def test_same_string(self):
        self.assertTrue(string_rotation("water", "water"))
        self.assertTrue(string_rotation("", ""))

    def test_rotated_string(self):
        self.assertTrue(string_rotation("water", "terwa"))
        self.assertTrue(string_rotation("waterbottle", "erbottlewat"))


if __name__== "__main__":
    unittest.main(verbosity=2)