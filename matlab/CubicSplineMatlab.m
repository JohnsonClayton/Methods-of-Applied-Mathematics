%Enter data
x = [0,1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,21,22,23,25,27,29]
y = [0,1,1.25,1.5,1.25,2,1.5,2,2,3,2.5,3.5,5,4.5,5.75,5.5,5,4,3,2,2,2.2,2,1,0]

%Create vector of 500 points between 0 and x[n] on x-axis 
n = length(x)
xnew = linspace(0, x(n), 500)

%Command for cubic spline spline polynomial p(x) that passes through  
%original data and defined on the 500 x-axis points. 
p = spline(x, y, xnew)

%Plot the original data together with p(x) sampled at the 500 points
plot(x, y, 'o', xnew, p, '-r')
