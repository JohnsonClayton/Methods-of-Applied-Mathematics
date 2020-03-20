function HW5gseidel(n,factor)
  %This script implements a simple Gauss-Seidel iteration scheme
  %for solving Ax = b for a square matrix A.  
  %A = coeff matrix, b = right side, n = number of iterations
  %Initial guess is the vector x. 
  %factor is the multiplier on the ones vector to determine x.
  %Updated iterations of x are computed by the Gauss-Seidel method. 

  %Example 1 from notes
  A = [2,3,1;-6,-10,1;4,5,8];
  b = [2;-6;6];

  %Example 2 from notes
  %A =[-4,1,1,0;1,-4,0,1;1,0,-4,1;0,1,1,-4];
  %b = [-200;-200;-100;-100];

  %Compute the actual solution of Ax = b using x = inv(A)*b
  G = inv(A);      %Compute the inverse of A. 
  x_actual = G*b   %Report the result of G*b to the screen. 

  %Compute the size of A.  Since A is square, M = N. 
  [M,N] = size(A);

  %Initial vector x will be an M x 1 vector.  See notes. 
  %The entries of x are all identical, just for convenience
  x = factor*ones(M,1);

  %Task 1:
  %Put system (A and b) into standard form.
  %To do so, use loops to divide i-th row of A and b by m = A(i,i)
  %See HW4 M-file for something similar, but not exact same.    
   
  %****************Write loop(s) here*************************************
  %****In-class work has been leading up to this homework assignment****
  %****Loops should be similar in nature to recent in class work********
  %**********************************************************************

  div = 1;                       % Initialize div to 1
  for i=1:M                      % Loop over all of the rows
    div = A(i, i);               % Define div to be the diagonal's coefficient
    for j=1:N                    % Go through every element in the row and
      A(i, j) = A(i, j) / div;   %   divide element by the diagonal's coefficient
    end
    b(i) = b(i) / div;           % Divide each row's associated b element by div
  end
  

  %Task 2:
  %Compute the M x M identity matrix I using the eye(M) command. 

  %****************Write comand here******************
  
  I = eye(M);    % Creates an MxM identity matrix

  %Task 3:
  %Form the matrix C = A - I. 
  %Alternatively, can use C = I - A instead. See notes.

  %****************Write comand here******************

   C = A - I;    % Zeroes out the diagonal

  
  %Task 4:
  %Perform the Gauss-Seidel iteration n times (n iterations).  
  %Use row-by-row entry computation for x(i). See notes.

  %****************Write loop(s) here*************************************
  %****In-class work has been leading up to this homework assignment****
  %****Loops should be similar in nature to recent in class work********
  %*********************************************************************

  for i=1:n                           % Iterates n times as per requested by user
    for j=1:M                         % Iterates over every row (every x present)
      x(j) = b(j) - dot(C(j,:), x');  % Calculates the new x_j value
    end
  end
  

  x_gs = x  %Report x, the last iteration vector, to the screen. 

end