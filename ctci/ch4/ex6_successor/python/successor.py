import unittest

def successor():
    pass


class TestSuccessor(unittest.TestCase):

    def test_fail(self):
        self.assertTrue(1 == 0)


if __name__== "__main__":
    unittest.main(verbosity=2)
