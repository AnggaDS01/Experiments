clear, clc

% membuat array dengan increment
% a = 1:2:10; % start, step, end

% for i = 1:10
%    if ~mod(i,2)
%        disp('adalah angka genap')
%    else
%        disp('adalah angka ganjil')
%    end
% end

% misalkan y = x^2 + 2x
% misalkan x = -5 to 5

% x = [-5:5];
% y = [];

% for i = 1:length(x)
%     y(i) = x(i)^2 + 2*x(i);
% end

% plot(x,y);

[x, y] = calculate(-5, 5, 1, 2)

plot(x,y)

function [x, y] = calculate(min, max, p, c, step)
    switch nargin
        case 2
            p = 1;
            c = 0;
            step = 1;
        case 3
            c = 0;
            step = 1;
        case 4
            step = 1;
    end
    
    x = [min:step:max]
    
    for n = 1:length(x)
       y(n) = p*x(n)^2 + c*x(n);
   end

end






























