clc, clear, syms x, format long

% TAYLOR SERIES
max1 = 15;
name_func = 'Sinusoidal';
func = sin(x);
value_of_x = pi/2;

fprintf('%s\t%c\ttaylor series %s\n', 'n', '|', name_func)
fprintf('_________________________________\n')
for k = 1:max1
%     taylor(sin(x), 'order', k)
    X(k) = eval(subs(taylor(func, 'order', k), x, value_of_x));
    fprintf('%-4d%-4c%13e%13c\n',k,'|',X(k),'|')
end
fprintf('_________________________________\n')

p = x^(max1+1);
q = factorial(max1+1);
r = abs(diff(sin(x), (max1-1) + 1));
Err = eval(subs(p/q*r, x, pi/2));

%% HORNER METHODE
clc, clear, syms x
a = -0.02; b = 0.2; c = - 0.4; d = 1.28;
A = [a b c d];
x = 5.5;
maxi = length(A);

% The polynomial P(x)
b = A(1);
fprintf('________________\n')
fprintf('%s\t|\t%s\n','i','bn')
fprintf('________________\n')
fprintf('%d\t|\t%9f\n',1,b)
for k = 2:maxi
    b = A(k) + b*x;
    fprintf('%d\t|\t%9f\n',k,b)
end
fprintf('________________\n')

% The derivative of P(x)
d = (maxi-1) * A(1);
inc = 2;
fprintf('________________')
fprintf('\n%s\t|\t%s\n','i','dn')
fprintf('________________\n')
fprintf('%d\t|\t%9f\n',1,d)
for l = maxi-2:-1:1
    d = l*A(inc) + d*x;
    inc = inc + 1;
    fprintf('%d\t|\t%9f\n',inc-1,d)
end
fprintf('________________\n')

% The indefinite integral 
n = A(1)/maxi;
inc2 = 2;
fprintf('________________')
fprintf('\n%s\t|\t%s\n','i','n')
fprintf('________________\n')
fprintf('%d\t|\t%9f\n',inc2-1,n)
for m = maxi-1:-1:1
    n = ( A(inc2)/m ) + n*x;
    inc2 = inc2 + 1;
    fprintf('%d\t|\t%9f\n',inc2-1,n)
end
n = n*x;
fprintf('%d\t|\t%9f\n',maxi+1,n)
fprintf('________________\n')

