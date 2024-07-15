clc, clear, syms x

% ============ BISECT METHODE ============

a1 = 5;
b1 = 10;
error1 = 0.00001;
y1 = x^2 - 10*x + 25;

% a2 = 0.5;
% b2 = 2.5;
% error2 = 0.001;
% y2 = 2*x^2 - 2*x;

res1 = bisect(a1,b1,error1, y1, 10);
% res2 = bisect(a2,b2,error2, y2, 100);

% ============ END BISECT METHODE ============

% ============ REGULA FALSI METHODE ============

% a = 1.5;
% b = 2.5;
% error = 0.001;
% y = x^2 -4;

% res = regula_falsi(a,b,error,y);

% ============ END REGULA FALSI METHODE ============

% bisect function
function c = bisect(a,b,error, y, max_iteration)
    syms x
    fa = eval(subs(y, x, a));
    fb = eval(subs(y, x, b));
    if fa*fb > 0 
        disp('Tidak memiliki root');
    else
        fprintf('%s%9c%3s%10c%2s%10c%5s%15s\n', 'a','|','b','|','c','|','f(c)','loop ke');
        disp('---------------------------------------------');
        for k = 1:max_iteration
            if b-a<error; break; end
            
            c = (a+b)/2;
            fc = eval(subs(y, x, c));
            fprintf('%f |  %f  | %f  | %9f      %-d\n',a,b,c,fc,k);
            if fc == 0
                a = c;
                b = c;
            elseif fb*fc > 0
                b = c;
                fb = fc;
            else
                a = c;
                fa = fc;
            end
        end
        fprintf('\nRoot nya adalah: %f\n\n\n', c);
    end
end

% ragula falsi function
function c = regula_falsi(a,b,error,y)
    syms x
    fa = eval(subs(y,x,a));
    fb = eval(subs(y,x,b));
    if fa*fb > 0 
        disp('Tidak memiliki root');
    else
        c = b - ((fb*(b-a))/(fb-fa));
        fc = eval(subs(y, x, c));
        fprintf('%s%9c%3s%10c%2s%10c%5s%15s\n', 'a','|','b','|','c','|','f(c)','loop ke');
        disp('---------------------------------------------');
        k = 1;
        while abs(fc)>error
           fprintf('%f |  %f  | %f  | %9f       %d\n',a,b,c,fc,k);
           if fa*fc < 0
                b = c;
                fb = eval(subs(y,x,b));
           else
                a = c;
                fa = eval(subs(y,x,a));
           end
           c = b - ((fb*(b-a))/(fb-fa));
           fc = eval(subs(y,x,c));
           k = k + 1;
        end
        fprintf('%f |  %f  | %f  | %9f       %d\n',a,b,c,fc,k);
        fprintf('\nRootnya adalah: %f\n', c);
    end
end










