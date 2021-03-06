function hw3(x_0, n)
% This function performs newton's method.
% x_0 => initial value
% n   => iterations

% First we compute the formulas for f(x) and f'(x).
% The '@' symbol tells MATLAB to plug in x for the function.
f = @(x) x^3 - 4*x^2 + 3*x + 1;
fp = @(x) 3*x^2 - 8*x + 3;

% Next, we form the iteration function g(x).
g = @(x) x - (f(x)/fp(x));

% The following "for" loop performs the iteration.
% The vector "r" records the values of the iteration.
% The first value of "r" will be the user input x_0.
r(1) = x_0;
for k=2:n
    r(k) = g( r( k-1 ) );
end

% The results are reported as a column vector r'.
Iteration_Vector = r'

end

