mat= gaussian_elimination([2, 2, -1;0, -2, -1;0, 0, 5], [5;-7;15])
assert1(mat,[2.;2.;3.])