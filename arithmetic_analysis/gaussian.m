clc
clear all
mat=[2, 2, -1;0, -2, -1;0, 0, 5];
assert1(class(mat),'double')
mat1= gaussian_elimination(mat, [5;-7;15]);
assert1(mat1,[2.;2.;3.])
assert1(gaussian_elimination(mat(:,2), [[5], [-7], [15]]),[])
mat2=gaussian_elimination([1, -4, -2;5, 2, -2;1, -1, 0], [-2;-3;4]);
assert1(mat2,[ 2.3 ;-1.7 ;5.55])
assert1(gaussian_elimination(coefficients=[2, 2, -1;1, -2, -1;0, 0, 5], vector=[5;-7;15]),[1.3333
   2.6667
   3.0000])