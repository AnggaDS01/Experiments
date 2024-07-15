clear, clc, format long

% x = [1:10];
% y = [];

% for n = 1:3:length(x)
%    y(n) = x(n)^2;
% end

% for n = 1:3:10
%    x(n) = n;
%    y(n) = x(n)^2;
% end

% plot(x,y)
% title('y = x^2')
% xlabel('x axis')
% ylabel('y axis')


% M = zeros(4);
% for n = 1:length(M)
%    M(n,n) = 1;
% end

% PROGRAM ITERATION METHODE

% [x, y] = range(1,4);
% y
% 
% function [x, y] = range(min,max)
%     for n = min:step:max
%         x(n) = n;
%         y(n) = x(n)^2;
%     end
% end

% =====================================================

p0 = 0.5; % initial guess
tol = 0.00001; % tolerance
max1 = 100; % maximum iteration

% k is the number of iteration
% p is fixed point approx
% err is approx error
% P is sequence

[k, p, relerr, P] = test(p0, tol, max1);

function [k, p, relerr, P] = test(p0, tol, max1)
    P(1) = p0;
    for k = 2:max1
        P(k) = exp(-P(k-1));
        err = abs(P(k) - P(k-1));
        relerr = err/abs(P(k));
        p = P(k);
        if (relerr < tol)
            break; 
        end
    end
    
    if k == max1
       disp('max iteration exceeded');
    end
    
    P=P';
end









