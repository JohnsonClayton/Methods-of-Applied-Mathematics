%Enter data
x = [1, 2.5, 7, 8, 9,   10,  13,  14,  16, 16.5, 17,   18,   19,   20,  21.5, 23,  26.5, 28];
y = [6, 6,   6, 6, 6.5, 6.5, 7.5, 7.5, 7,  6,    5.5,  4.75, 4.75, 4.5, 4,    3.5, 3,    1];

%Create vector of 500 points between 0 and x[n] on x-axis 
n = length(x);
xnew = linspace(0, x(n), 500);

%Command for cubic spline spline polynomial p(x) that passes through  
%original data and defined on the 500 x-axis points. 
p = spline(x, y, xnew);

%Plot the original data together with p(x) sampled at the 500 points
plot(x, y, 'o', xnew, p, '-r')
