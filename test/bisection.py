
import os
import unittest
import sys
currentdir = os.path.dirname(os.path.realpath(__file__))
parentdir = os.path.dirname(currentdir)
sys.path.append(parentdir)
from arithmetic_analysis.bisection import bisection
class TDD_BISECTION(unittest.TestCase):
    def test_annotations(self):
        from typing import Dict
        class Player:
            pass
        players: Dict[str, Player]
        __points: int
        self.assertEqual(__annotations__,{})
    def test_bisection(self):
        # Combinatorial Condition Coverage
        self.assertEqual(bisection(lambda x:x+1,-1,1),-1)
        self.assertEqual(bisection(lambda x: x + 2, -1, -2), -2)
        
        with self.assertRaises(ValueError) as cm:
            bisection(lambda x:x+2,-10,-20)
        the_exception = cm.exception
        error =  "could not find root in given interval."
        self.assertEqual(str(the_exception), error)

        self.assertAlmostEqual(bisection(lambda x:x+2,-1,-20),-2,6)
        self.assertAlmostEqual((bisection(lambda x: x ** 3 - 1, -5, 5)),1)
if __name__ == '__main__':
    unittest.main()

                