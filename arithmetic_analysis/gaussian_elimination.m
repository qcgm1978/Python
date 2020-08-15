#Gaussian elimination method for solving a system of linear equations.
#Gaussian elimination - https://en.wikipedia.org/wiki/Gaussian_elimination
function mat=gaussian_elimination(coefficients=[2, 2, -1;1, -2, -1;0, 0, 5], vector=[5;-7;15])
  #    This function performs Gaussian elimination method
  #    Examples:
  #        1x1 - 4x2 - 2x3 = -2        1x1 + 2x2 = 5
  #        5x1 + 2x2 - 2x3 = -3        5x1 + 2x2 = 5
  #        1x1 - 1x2 + 0x3 = 4
  #    >>> gaussian_elimination([[1, -4, -2], [5, 2, -2], [1, -1, 0]], [[-2], [-3], [4]])
  #    array([[ 2.3 ],
  #           [-1.7 ],
  #           [ 5.55]])
  #    >>> gaussian_elimination([[1, 2], [5, 2]], [[5], [5]])
  #    array([[0. ],
  #           [2.5]])
  # coefficients must to be a square matrix so we need to check first
  [row, columns] = size(coefficients);
  if( ~issquare(coefficients))
  mat= [];
  return
endif
# augmented matrix
augmented_mat = [coefficients, vector];
# scale the matrix leaving it triangular
for i =1:columns-1 
  pivot = augmented_mat(i, i);
  for row1 =i + 1:row
    factor = augmented_mat(row1, i) / pivot;
    #    Adding a multiple of one row to another row.
    augmented_mat(row1, :) -= factor * augmented_mat(i, :);
  end
end
mat = retroactive_resolution(
augmented_mat(:, 1:columns), augmented_mat(:, columns+1 )
);
endfunction

function x=retroactive_resolution(coefficients, vector)
#    This function performs a retroactive linear system resolution
#    for triangular matrix
#      Examples:
#      2x1 + 2x2 - 1x3 = 5         2x1 + 2x2 = -1
#      0x1 - 2x2 - 1x3 = -7        0x1 - 2x2 = -1
#      0x1 + 0x2 + 5x3 = 15
#      >>> gaussian_elimination([[2, 2, -1], [0, -2, -1], [0, 0, 5]], [[5], [-7], [15]])
#      array([[2.],
#      [2.],
#      [3.]])
#      >>> gaussian_elimination([[2, 2], [0, -2]], [[-1], [-1]])
#      array([[-1. ],
#      [ 0.5]])
[row, columns] = size(coefficients);
x = zeros(row, 1);
for i=row:-1:1
  sum = 0;
  for col =(i + 1: columns)
    sum += coefficients(i, col) * x(col);
  end
  x(i, 1)= (vector(i) - sum) / coefficients(i, i);
end
endfunction
