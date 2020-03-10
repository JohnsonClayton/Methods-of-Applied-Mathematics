x = [1, 2.5, 7, 8, 9,   10,  13,  14,  16, 16.5, 17,   18,   19,   20,  21.5, 23,  26.5, 28];
y = [6, 6,   6, 6, 6.5, 6.5, 7.5, 7.5, 7,  6,    5.5,  4.75, 4.75, 4.5, 4,    3.5, 3,    1];

N = length(x);
n = N - 1;

% Rectangle rule
rect = 0;

% Trapezoid rule
trap = 0;

for k=1:n
    % Left-Rectangle Rule
    rect = rect + y( k )*( x( k+ 1)- x( k ) );
    
    % Trapezoid Rule (how do you catch a zoid?)
    trap = trap + ( y( k ) + y( k+1 ) )*( x( k+1 )- x( k ) ) / 2.0;
end

fprintf("Rectangle rule: %d\n", rect);
fprintf("Trapezoid rule: %d\n", trap);