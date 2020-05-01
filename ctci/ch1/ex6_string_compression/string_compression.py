import unittest

# NOTE: The solution in the book makes a note that string concatination
# runs in O(n^2) time, so they recommend using a StringBuilder in Java.

def string_compression(s):
    if not s:
        return s
    currChar = s[0]
    currCount = 1
    compressedString = ''
    for i in range(1, len(s)):
        if s[i] == currChar:
            currCount += 1
        else:
            compressedString += currChar + str(currCount)
            currChar = s[i]
            currCount = 1
    compressedString += currChar + str(currCount)
    if len(compressedString) < len(s): 
        return compressedString
    return s


class TestStringCompression(unittest.TestCase):
    def test_empty_string_returns_empty_string(self):
        self.assertEqual(string_compression(""), "")
    
    def test_single_letter_repeated(self):
        self.assertEqual(string_compression("aaaaa"), "a5")
        self.assertEqual(string_compression("bbb"), "b3")

    def test_original_is_smaller_than_compressed(self):
        self.assertEqual(string_compression("aa"), "aa")
        self.assertEqual(string_compression("b"), "b")

    def test_multiple_letters_repeated(self):
        self.assertEqual(string_compression("aaabb"), "a3b2")
        self.assertEqual(string_compression("aaabbccccc"), "a3b2c5")

    def test_multiple_single_letters(self):
        self.assertEqual(string_compression("abcdef"), "abcdef")

    def test_multiple_single_and_repeated_letters(self):
        self.assertEqual(string_compression("aabcccccaaa"), "a2b1c5a3")

if __name__== "__main__":
    unittest.main(verbosity=2)