xdata = [1.0, 2.0, 3.0, 4.0]; % This is the x data
N = length(xdata);
n = N - 1;

ydata = zeros(1, N);

for k=1:N
    ydata(k) = log(k);
end

h = (xdata(N) - xdata(1))/n;
fprintf("h is %d\n", h);

p = ydata(1)/2;
for k=1:n
    p = p + ydata(k);
end
p = p + ydata(N)/2;
p = h*p;
fprintf("%d\n", p);