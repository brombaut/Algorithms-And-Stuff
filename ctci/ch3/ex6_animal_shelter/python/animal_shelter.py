import unittest

def animal_shelter():
    pass


class TestAnimalShelter(unittest.TestCase):

    def test_fail(self):
        self.assertTrue(1 == 0)


if __name__== "__main__":
    unittest.main(verbosity=2)
