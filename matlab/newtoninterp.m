function newtoninterp(x)% This program uses Newton's interpolation method to
% compute the value of the interpolating polynomial
% at the user input value x.
 xdata = [8.0 9.0 9.5 11.0];   % This is the x data
 N = length(xdata);            % N = number (length of x data points
 ydata = zeros(1, N);          % Initialize y data as 1 row of N zeros
 
 for k = 1:N                   % This loop creates y data using ln(x)
     ydata(k) = log(xdata(k));
 end
 
 a = ydata;                    % Create a => copy of y data
 for k = 2:N                   % k = column number of divided diffs
   for i = k:N                 % Create column vector of divided diffs
       a(i) = (a(i)-a(k-1))/(xdata(i)-xdata(k-1));
   end
 end
 
 p = a(N);                     % Nested computation of p(x)
 for k = 1:N-1
     p = (x-xdata(N-k))*p + a(N-k);
 end
 
 p=p                           % Since no semicolon, this will print to screen
 a=a                           % Since no semicolon, this will print to screens
 xp = [x];                     % Put the x value in as a length 1 vector
 yp = [p];                     % Put the y value for p in as a length 1 vector
 plot(xdata, ydata, '-o', xp, yp, 's') % Plot vector ordered pairs; s = square
 xlabel('x')
 legend('Data', 'Point Value', 'Location', 'Northwest')
end

