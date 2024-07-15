%% RUMUS ABC
clc, clear
disp('RUMUS ABC')
AB = 05;
x1=(-2+sqrt(2^2-4*(-AB)*1))/2;
x2=(-2+sqrt(2^2+4*(-AB)*1))/2;
fprintf('x1=%f dan x2=%f\n\n',x1,x2)
%% METODE BISECTION
disp('METODE BISECTION')
y = @(x) x^2+2*x-AB; %@(x) x^2-6*x-AB && @(x) x^2+6*x-AB
A = 0; B = 10;
Er = 10^-3; imax = 25;
FA = y(A); FB = y(B);
Tol = abs(A-B); i=0;
if FA == 0
    fprintf('%d adalah akar\n',A);
elseif FB==0
    fprintf('%d adalah akar\n',B);
elseif FA*FB<0
    fprintf('____________________________________________________________\n');
    fprintf('i\tA\t\t\tB\t\t\tx\t\t\tFx\t\t\tError\n');
    fprintf('____________________________________________________________\n');
    while Tol>Er && i<imax
        i=i+1;
        X(i)=(A+B)/2;
        FX=y(X(i));
        fprintf('%d\t%f\t%f\t%f\t%9f\t%f\n',i,A,B,X(i),FX,Tol)
        if FX==0
            fprintf('%f adalah akar\n',X(i));
            return
        elseif y(A)*FX<0
            B=X(i);
        else
            A=X(i);
        end
        Tol=abs(A-B);
    end
    fprintf('%d\t%f\t%f\t%f\t%9f\t%f\n',i+1,A,B,X(i),FX,Tol)
else
    fprintf('Tidak ada akar atau Range yang dibuat terlalu besar\n')
end
fprintf('____________________________________________________________\n');
fprintf('Akar persamaannya adalah=%f\n',X(i))
fprintf('=======================================\n')

%% METODE REGULA FALSI
disp('METODE REGULA FALSI')
y = @(x) x^2+2*x-AB;
A = 0; B = 10;
Er = 10^-5; imax = 25;
FA = y(A); FB = y(B);
Tol = abs(A-B); i=0;
if FA==0
    fprintf('%d adalah akar\n',A);
elseif FB==0
    fprintf('%d adalah akar\n',B);
elseif FA*FB<0
    fprintf('____________________________________________________________\n');
    fprintf('i\tA\t\t\tB\t\t\tF(a)\t\tF(b)\t\tx\t\t\tFx\t\t\tError\n');
    fprintf('____________________________________________________________\n');
    while Tol>Er && i<imax
        i=i+1;
        X(i)=((y(B)*A)-(y(A)*B))/(y(B)-y(A));
        FX=y(X(i));
        fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n',i,A,B,y(A),y(B),X(i),FX,Tol)
        if FX==0
            fprintf('%f adalah akar\n',X(i));
            return
        elseif y(A)*FX<0
            B=X(i);
        else
            A=X(i);
        end
        Tol=abs(A-B);
    end
    fprintf('%d\t%f\t%f\t%f\t%9f\t%f\n',i+1,A,B,X(i),FX,Tol)
else
    fprintf('Tidak ada akar atau Range yang dibuat terlalu besar\n')
end
fprintf('____________________________________________________________\n');
fprintf('Akar persamaannya adalah=%f\n',X(i));
fprintf('=======================================\n')

%% METODE NEWTON-RAPHSON
disp('METODE NEWTON RAPHSON')
y=@(x) x^2+2*x-AB;
dy=@(x) 2*x+2;
A = 0;
B = 10;
Er = 10^-5;
imax = 25;
i=0;
FB=y(B);    
DFB=dy(B);
X=B-(FB/DFB);
Tol=abs(X-B)/B;
if FB==0
    fprintf('%d adalah akar\n',B);
else
    fprintf('__________________________________________________\n');
    fprintf('i\tx0\t\t\tx\t\t\ty(B)\t\tdy(B)\t\tFx\t\t\tError\n');
    fprintf('__________________________________________________\n');
    X=zeros(imax,1);
    while Tol>Er && i<imax
        i=i+1;
        X(i)=B-(y(B)/dy(B));
        FX=y(X(i));
        Tol=abs(B-X(i));
        fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n',i,B,X(i),y(B),dy(B),FX,Tol)
        B=X(i);
    end
    Tol=abs(B-X(i));
    fprintf('%d\t%f\t%f\t%f\t%f\n',i+1,B,X(i),FX,Tol)
end
fprintf('__________________________________________________\n');
fprintf('Akar persamaannya adalah=%f\n',X(i));
fprintf('=======================================\n')

%% METODE SECANT
disp('METODE SECANT')
y=@(x) x^2+2*x-AB;
A = 0;
B = 10;
Er = 10^-5;
imax = 25;
i=0;
Tol=abs(A-B);
if y(A)==0
    fprintf('%d adalah akar\n',A);
elseif y(B)==0
    fprintf('%d adalah akar\n',B);
else
    fprintf('___________________________________________________________\n');
    fprintf('i\tx1\t\t\tx0\t\t\tx\t\t\ty(A)\t\ty(B)\t\tFx\t\t\tError\n');
    fprintf('___________________________________________________________\n');
    X=zeros(imax,1);
    while Tol>Er && i<imax
        i=i+1;
        X(i)=B-(y(B)*((B-A)/(y(B)-y(A))));
        FX=y(X(i));
        fprintf('%d\t%f\t%f\t%f\t%9f\t%9f\t%9f\t%f\n',i,B,A,X(i),y(A),y(B),FX,Tol)
        A=B;
        B=X(i);
        Tol=abs(A-B);
    end
    fprintf('%d\t%f\t%f\t%f\t%9f\t%f\n',i+1,A,B,X(i),FX,Tol)
end
fprintf('___________________________________________________________\n');
fprintf('Akar persamaannya adalah=%f\n',X(i))
fprintf('=======================================\n')
%% newton raphson (for exam)
clc, clear, syms x
y = (x-3)^4;
dy = diff(y);
tol = 10^-4;
guess = 3.1;
% fprintf('%2g: y(%g) %c %-12g\t dy(%g) = %12g\t x - y/dy = %8g\t Err = %g\n' , 1, guess, '=',nilai_1, guess, nilai_2, res, Err)
for n = 1:100
    nilai_1 = eval(subs(y, x, guess));
    nilai_2 = eval(subs(dy, x, guess));
    res = guess-(nilai_1/nilai_2);
    Err = abs(guess - res);
    if Err < tol
        break
    end
    fprintf('%2g: y(%g) %c %12g\t dy(%g) = %12g\t x - y/dy = %8g\t Err = %g\n' , n, guess, '=',nilai_1, guess, nilai_2, res, Err)
    guess = res;
end
%% 
clc
exp(-0)

%%
zeros(100, 1)



