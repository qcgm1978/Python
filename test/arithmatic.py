import os
import sys
import unittest

import numpy as np
from numpy import array, cos, cross, radians, sin  # type: ignore

currentdir = os.path.dirname(os.path.realpath(__file__))
parentdir = os.path.dirname(currentdir)
sys.path.append(parentdir)
from arithmetic_analysis.bisection import bisection
from arithmetic_analysis.gaussian_elimination import gaussian_elimination
from arithmetic_analysis.in_static_equilibrium import in_static_equilibrium, polar_force


class TDD_BISECTION(unittest.TestCase):
    def test_annotations(self):
        from typing import Dict

        class Player:
            pass

        players: Dict[str, Player]
        __points: int
        self.assertEqual(__annotations__, {})

    def test_bisection(self):
        # Combinatorial Condition Coverage
        self.assertEqual(bisection(lambda x: x + 1, -1, 1), -1)
        self.assertEqual(bisection(lambda x: x + 2, -1, -2), -2)

        with self.assertRaises(ValueError) as cm:
            bisection(lambda x: x + 2, -10, -20)
        the_exception = cm.exception
        error = "could not find root in given interval."
        self.assertEqual(str(the_exception), error)

        self.assertAlmostEqual(bisection(lambda x: x + 2, -1, -20), -2, 6)
        self.assertAlmostEqual((bisection(lambda x: x ** 3 - 1, -5, 5)), 1)

    def test_gaussian_elimination(self):
        mat = [[2, 2, -1], [0, -2, -1], [0, 0, 5]]
        self.assertIsInstance(mat, list)
        self.assertEqual(
            gaussian_elimination(mat, [[5], [-7], [15]], returnList=True),
            [[2.0], [2.0], [3.0]],
        )
        self.assertEqual(
            gaussian_elimination(mat[:2], [[5], [-7], [15]], returnList=True), []
        )

    def test_in_static_equilibrium(self):
        print(cos(45))
        print(cos(180-45))
        print(cos(radians(180-45)))
        print(sin(180-45))
        print(sin(radians(180-45)))
        forces = array(
            [
                polar_force(718.4, 180 - 30),
                polar_force(879.54, 45),
                polar_force(100, -90),
            ]
        )

        location = array([[0, 0], [0, 0], [0, 0]])

        self.assertTrue(in_static_equilibrium(forces, location))


if __name__ == "__main__":
    unittest.main()

if __name__ == "__main__":
    unittest.main()
