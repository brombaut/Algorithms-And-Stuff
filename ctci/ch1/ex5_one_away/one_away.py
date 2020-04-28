import unittest

def one_away(s1, s2):
    if s1 == s2:
        return True
    if len(s1) < len(s2):
        s1, s2 = s2, s1
    if len(s1) - len(s2) > 1:
        return False
    edited = False
    i1 = 0
    i2 = 0
    while i1 < len(s1):
        c1 = s1[i1]
        c2 = s2[i2] if i2 < len(s2) else ''
        if c1 != c2:
            if edited:
                return False
            edited = True
            if len(s1) != len(s2):
                i2 -= 1  # Adding in the missing character
        i1 += 1
        i2 += 1
    return True



class TestOneAway(unittest.TestCase):

    def test_same_string(self):
        self.assertTrue(one_away('pale', 'pale'))
    
    def test_two_or_more_character_lengths(self):
        self.assertFalse(one_away('pale', 'pa'))
        self.assertFalse(one_away('pa', 'pale'))

    def test_first_string_has_one_additional_character(self):
        self.assertTrue(one_away('pale', 'pal'))
        self.assertTrue(one_away('pale', 'ple'))
        self.assertTrue(one_away('pales', 'pale'))
        
    def test_second_string_has_one_additional_character(self):
        self.assertTrue(one_away('pal', 'pale'))
        self.assertTrue(one_away('pae', 'pale'))
        self.assertTrue(one_away('pale', 'pales'))

    def test_single_letter_difference_betwheen_strings(self):
        self.assertTrue(one_away('pale', 'bale'))

    def test_multiple_letter_differences_between_strings(self):
        self.assertFalse(one_away('pale', 'bake'))


if __name__== "__main__":
    unittest.main(verbosity=2)