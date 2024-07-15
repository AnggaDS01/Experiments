clear, clc

% global c;
% 
% jumlah
% PENULISAN FUNGSI KE SATU
% function jumlah
% %   mengambil variable global
%     global c;
% 
%     a = 1;
%     b = 2;
%     c = a+b
% end

% a = linspace(-5, 5, 20);
% b = linspace(-5, 5, 20)
% parabola(a, 2, 3)
% 
% hold on
% 
% parabola(b, 3, 2)
% 
% hold off
% 
% function parabola(x, p, c)
%     y = p*x.^2 + c
%     plot(x, y)
% end

% FUNGSI DENGAN INPUT OUTPUT

% [xling, yling] = lingkaran(5);
% plot(xling, yling)
% 
% function [x, y] = lingkaran(r)
%     sudut = linspace(0, 2*pi, 100);
%     x = r*cos(sudut);
%     y = r*sin(sudut);
% end



% TEST DUA
% PENULISAN FUNGSI KEDUA
% a = calculate(10,5, '*')
b = calculate(10,5, '+')
c = calculate(33,3, '/')

function c = calculate(a,b, operator)
% CALCULATE adalah fungsi yang menerima 3 parameter yaitu:
%     - angka pertama: merupakan bilangan int atau float
%     - angka kedua: merupakan bilangan int atau float
%     - operator: yang hanya memiliki 4 nilai, "*", "+", "-", "/"
    
    switch nargin
        case 2; operator = '+';
    end
    switch operator
        case '+'; c = a+b;
        case '-'; c = a-b;
        case '*'; c = a*b;
        case '/'; c = a/b;
    end
end


% PENULISAN FUNGSI KETIGA
% add(1,2)
% 
% function add(a,b)
%     c = a+b
% end








































