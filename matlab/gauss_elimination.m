% This script runs naive Gauss elimination without pivoting.
% A = square coeff matrix, b = right side (augmented section), x = solution vector

format compact

A = [2, 3, 1; -6, -10, 1; 4, 5, 8]
b = [2; -6; 6]

%A = [3, 2, 1; 3, 3, 3; -12, -10, -5]
%b = [0; 1; 4]

[M, N] = size(A);			% M = number of rows, N = number of columns (M = N)
L = eye(M)				% Initialize L to be the M x M identity matrix
A2 = A;					% Make a copy of A

% Gaussian Elimination to put A into upper triangular form:
for k = 1:N-1				% This is the column index range
  for i = k+1:M				% This row index range works on the lower part of A
    Column_Number = k			% Outputs k
    Row_Number = i			% Outputs i
    if A(k, k) ~= 0			% If A(k, k) = 0, then we need row interchanges (not implemented here)
      m = A(i, k)/A(k, k)		% Compute and output the multiplier
      b(i) = b(i) - m*b(k);		% Row operation update on entry i of b
      L(i, k) = m;			% Update L matrix entry
      for j = k:N			% Row operations on nonzero lower portion of A
        A(i, j) = A(i, j) - m*A(k, j)	% Row operation on i-th row of A
      end

      % Outputs values
      A = A
      b = b
      L = L
    end
  end
end

% Compute and output values
U = A
LU = L*U
Original_A = A2

% Back Substitution
x = zeros(M, 1)				% Initialize solution vector x to be M x 1 zero vector
x(M) = b(M)/A(M, M)			% If A(M, M)=0, then either no solution or inf many solutions
for k = M-1:-1:1			% Increment is -1 so that we work up to compute x (we're stepping backwards)
  Row_Number = k			% This line reports the row number
  x(k) = b(k)				% Initialize x(k)
  for j = k+1:M				% This loop begins computation of x(k)
    x(k) = x(k) - A(k, j)*x(j);		% Compute value of x(k) using updates
  end
  x(k) = x(k)/A(k, k)			% Finish computation of x(k) and report latest x
end
