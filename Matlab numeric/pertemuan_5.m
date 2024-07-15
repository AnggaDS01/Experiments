%% BISECTION METHODE
clear, clc

    % In graphical form :
        % begin with calcuating midpoint c
        % if f(a) and  f(c) have opposite sign, then a zero lies in [a,c]
        % if f(b) and f(c) have opposite sign, then a zero lies in [b,c]
        % if f(c) = 0, then the zero is c
        % here, midpoint c is c = a + b / 2
        
    % Step 
        % set the interval [a,b] and the error
        % calculate f(a) and f(b)
        % if f(a) f(b) > 0, no root
        % calculate midpoint, set it as c
        % calculate f(c)
        % % pilih salah satu:
            % if f(a) f(c) > 0 so a = c
            % if f(b) f(c) > 0 so b = c
            
    % cont
        % calculate b - a
        % if b - a < tolerance or if max iteration is reached then process
        % us stopped
        
    % Taks 2 write your own code
        

%% METHODE IF FALSE POSITION
clear, clc

    % it is also known as regula falsi methode
    % this methode is developed since the bisection converges at slow speed
    
    % Concept :
        % A better approximation if midpoint (c, 0) is find where
        
    % Graphical form
        % m = f(b) - f(a) / b - a
        % m = 0 - f(b) / c - b
            % Hence
        % c = b - ( f(b)(b - a) ) / ( f(b) - f(a) ) 

    
%% Tugas mencoba sendiri methode regulasi falsi dan bisection
% Clearing Screen
clc, syms x;

% BISECTION METHODE
    
    % Enter non-linear equations: cos(x) - x * exp(x)
    % Enter first guess: 0
    % Enter second guess: 1
    % Tolerable error: 0.00001
    
    % START CODING
    % Input Section
    y = input('Enter non-linear equations: ');
    a = input('Enter first guess: ');
    b = input('Enter second guess: ');
    e = input('Tolerable error: ');

    % Finding Functional Value
    fa = eval(subs(y,x,a));
    fb = eval(subs(y,x,b));

    % Implementing Bisection Method
    if fa*fb > 0 
        disp('Given initial values do not bracket the root.');
    else
        c = (a+b)/2;
        fc = eval(subs(y,x,c));
        fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
        while abs(fc)>e
            fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
            if fa*fc< 0
                b =c;
            else
                a =c;
            end
            c = (a+b)/2;
            fc = eval(subs(y,x,c));
        end
        fprintf('\nRoot is: %f\n', c);
    end

% METHODE REGULASI FALSI
    % Enter non-linear equations: sin(x)+cos(x)+exp(x)-8
    % Enter first guess: 2
    % Enter second guess: 3
    % Tolerable error: 0.00001
    
    % START CODING 
    % Input Section
%     y = input('Enter non-linear equations: ');
%     a = input('Enter first guess: ');
%     b = input('Enter second guess: ');
%     e = input('Tolerable error: ');
% 
%     % Finding Functional Value
%     fa = eval(subs(y,x,a));
%     fb = eval(subs(y,x,b));
% 
%     % Implementing Bisection Method
%     if fa*fb > 0 
%         disp('Given initial values do not bracket the root.');
%     else
%         c = a - (a-b) * fa/(fa-fb);
%         fc = eval(subs(y,x,c));
%         fprintf('\n\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
%         while abs(fc)>e
%             fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
%             if fa*fc< 0
%                 b =c;
%                 fb = eval(subs(y,x,b));
%             else
%                 a =c;
%                 fa = eval(subs(y,x,a));
%             end
%             c = a - (a-b) * fa/(fa-fb);
%             fc = eval(subs(y,x,c));
%         end
%         fprintf('\nRoot is: %f\n', c);
%     end

%% test
clear, clc, syms x y

% y = sin(x)+cos(x)+exp(x)-8;
% test = eval(subs(y,x,3));

test = eval(subs(2*x + 3*y, x, 4))








    
    
    
    