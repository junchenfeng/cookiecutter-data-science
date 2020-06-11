import unittest


class CITestCase(unittest.TestCase):
    """
    end to end test of the project
    """
    def test_end_to_end(self):

        self.assertEqual(True, False)


if __name__ == '__main__':
    unittest.main()
