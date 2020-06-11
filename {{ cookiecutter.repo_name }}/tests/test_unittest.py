import unittest


class UnittestTestCase(unittest.TestCase):
    """
    test of components and other micro-level
    """
    def test_component(self):
        self.assertEqual(True, False)


if __name__ == '__main__':
    unittest.main()
