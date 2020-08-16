clc
clear all
n1=chinese_remainder_theorem(3, 2, 5, 3,7,2);
assert1(n1,23)
n2=chinese_remainder_theorem(5,1,7,3);
assert1(n2,31)
n3=chinese_remainder_theorem(6,1,4,3);
assert1(n3,7)