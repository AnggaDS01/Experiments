%% PERSAMAAN DIFFERENSIAL METODE EULER ORDE 1 

% Selesaikan persamaan differensial dy/dx=x √y pada interval x=0 s/d x=1,h=1. 
% Pada saat x=0 nilai y=1, Hitung kesalahan sebenarnya!, gunakan metode euler 
% dan metode heun untuk menyelesaikannya dan beri plotting dari kedua hasil 
% metode tersebut, dan jelaskan megapa metode Heun lebih mendapatkan hasil 
% yang mendekati dari nilai sebenarnya?

clear, clc

x(1) = 0;
y(1) = 1;
xb = 1;
h = 1/4;
n = (xb - x(1))/h;
dy = @(x,y) x*sqrt(y);
y_eksak = @(x) ((2 + 1/2*x^2)/2)^2;

display('________________________________________________')
fprintf('x\t\ty(euler)\t\ty(eksak)\t\terror\n')
display('________________________________________________')
for i = 2:n+2
    y(i) = y(i-1) + h*dy(x(i-1), y(i-1)); 
    x(i) = x(1) + (i-1)*h;
    y_actual = y_eksak(x(i-1));
    error = abs( (y(i-1) - y_actual ) / y_actual ) * 100;
    fprintf('%-8g%-16g%-16g%g\n', x(i-1), y(i-1), y_actual, error)
end
display('________________________________________________')
plot(x, y, 'x-')
xticks(x(1):0.5:x(end))
xtickangle(90)
yticks(y(1):0.5:y(end)+1)
grid()
%% PERSAMAAN DIFFERENSIAL METODE EULER ORDE 2
clc, clear

x = zeros(1,10);
y = zeros(1,10);
x(1) = 0; % nilai awal x
y(1) = 0; % nilai awal y
xb = 2; % nial akhir x
dy(1) = 0; % nilai awal turunan y
dy_2 = @(x,dy,y) 1 - 2*x*y - 3*dy; % persamaan yang akan dicari solusinya
h = 0.2; % step perhitungan
n = (xb - x(1)) / h; % jumlah segmen dalam perhitungan

fprintf('i\tx\t\tdy\t\t\t\tdy_2\t\ty\n')
disp('_______________________________________________')
tic
for i = 2:n+2
    y(i) = y(i-1) + h*dy(i-1) + (h^2/2)*dy_2(x(i-1), dy(i-1), y(i-1)); % persamaa deret taylor hingga suku-3
    dy(i) = dy(i-1) + h*dy_2(x(i-1), dy(i-1), y(i-1)); % mencari nilai turunan pertama dari y
    x(i) = x(1) + (i-1)*h; % increment nilai x setiap iterasi
    fprintf('%d\t%g\t\t%-8g\t\t%-7g\t\t%g\n',i-2, x(i-1), dy(i-1), dy_2(x(i-1), dy(i-1), y(i-1)), y(i-1))
end
disp('_______________________________________________')
toc
plot(x(1:end-1),y(1:end-1), 'x-')
xticks(x(1):h:x(end))
grid()
%% PERSAMAAN DIFFERENSIAL METODE HEUN (PREDIKTOR DAN KOREKTOR)
clc, clear
% predictor : y_euler = yr + hf(xr, yr)
% corrector : y_heun = yr + h/2(f(xr, yr) + f(xr_1, y_euler))

fxy = @(x,y) x+y;
x0 = 0;
y0 = 1;
xb = 1;
h = 0.01;
n = (xb-x0)/h;
y = [y0 zeros(1,n)];
x = [x0 zeros(1,n)];
y_eksak = @(x) -x-1+(2/exp(-x));

disp('____________________________________________')
fprintf('i\t\ty_0\t\t\ty(numeric)\ty(eksak)\tx\n')
disp('____________________________________________')
for i = 2:n+1
    x(i) = x0 + (i-1)*h; % assign nilai baru untuk step pada setiap iterasi
    y(i) = y(i-1) + h*fxy(x(i-1),y(i-1)); % metode euler (prediktor)
    k(i) = y(i);
    y(i) = y(i-1) + h/2*(fxy(x(i-1), y(i-1)) + fxy(x(i), y(i))); % metode heun (korektor)
    fprintf('%d\t\t%-8g\t%g\t\t%g\t\t%g\n', i-1, k(i), y(i), y_eksak(xb), x(i))
end

%% METODE DERET TAYLOR
clc ,clear, syms x y

n = 4;
x0 = 0;
y0 = 1;
h = 0.25;
dy = 1/2*x - 1/2*y;
fxy = [dy zeros(1,n)];
diff_taylor = zeros(1,n);
test = zeros(1,n);
fprintf('k\t\ty_n\t\t\t\tf(x,y)\n')
tic
disp('___________________________________________')
for k = 2:length(x0)+1
    for i = 2:n+1
        fxy(i) = (diff(fxy(i-1), x) +  dy*diff(fxy(i-1), y));
        diff_taylor(i-1) = subs(fxy(i-1), {x,y}, {x0(k-1), y0(k-1)});
        test(i-1) = (diff_taylor(i-1)*h^(i-1))/factorial(i-1);
    end
    y0(k) = y0(k-1) + sum(test);
    fprintf('%d\t\t%-10g\t\tf(%g, %g)\n',k-1, y0(k), x0(k-1), y0(k-1))
end
disp('___________________________________________')
toc

%% METODE DERET TAYLOR V.2
clear, clc, syms x y

xx(1) = 0;
xb = 0.2;
yy(1) = 1;
h = 0.05;    
N = round((xb - xx(1))/h);

xx(2:N+1) = 0;
yy(2:N+1) = 0;

fxy = @(x,y) 2*x+y;
dfx = str2func(['@(x,y)' char(diff(fxy, x))]);
dfy = str2func(['@(x,y)' char(diff(fxy, y))]);
y_eksak = @(x) -x-1+(2/exp(-x));

disp('______________________________________________________________________________________________')
fprintf('i\tx\t\tfxy(x_1,y_0))\tdx(x_1,y_0))\tdy(x_1,y_0))\ty(numeric)\ty(eksak)\terror\t |\n')
disp('______________________________________________________________________________________________')
for i = 2:N+2
    xx(i) = xx(i-1) + h;
    yy(i) = yy(i-1) + h*fxy(xx(i),yy(i-1)) + h^2*(dfx(xx(i),yy(i-1))+fxy(xx(i),yy(i-1))*dfy(xx(i),yy(i-1)))/2;
    error = abs(y_eksak(xb)-yy(i-1));
    fprintf('%d\t%-4g\t%-10g\t\t%g\t\t\t\t%g\t\t\t\t%-10g\t%g\t\t%-9g|\n', i-2, xx(i-1), fxy(xx(i),yy(i-1)), dfx(xx(i),yy(i-1)), dfy(xx(i),yy(i-1)), yy(i-1), y_eksak(xb), error)
end
disp('______________________________________________________________________________________________')
%% METODE RUNGE KUTTA
clear, clc

fxy = @(x,y) x + y;
x(1) = 0;
y(1) = 1;
h = 0.1;
xb = 1;
n = (xb - x(1))/h;
y_eksak = 3.43656365; % dapat dicari dengan metode faktor integrasi jika tidak bisa menggunakan metode PERSAMAAN HOMOGEN DENGAN SUBSTITUSI  − 

x(2:n+2) = 0;
y(2:n+2) = 0;
k1 = [0 zeros(1,n+1)];
k2 = [0 zeros(1,n+1)];
k3 = [0 zeros(1,n+1)];
k4 = [0 zeros(1,n+1)];

a = 1;
methodes = ["orde 2", "orde 3", "orde 4"];
order = methodes(a);
disp("METODE RUNGE KUTTA ORDE " + order);
disp('__________________________________________________________________________________________________')
fprintf("i\tx\t\ty(numeric)\t\ty(eksak)\t\terror\t\tk1\t\t\tk2\t\t\tk3\t\t\tk4\n");
disp('__________________________________________________________________________________________________')
tic
for i = 2:n+2
    switch order
        case "orde 2"
            k1(i) = h*fxy(x(i-1),y(i-1));
            k2(i) = h*fxy(x(i-1) + h, y(i-1) + k1(i));
            y(i) = y(i-1) + 1/2*(k1(i) + k2(i));            
        case "orde 3"
            k1(i) = h*fxy(x(i-1), y(i-1));
            k2(i) = h*fxy(x(i-1) + h/2, y(i-1) + k1(i)/2);
            k3(i) = h*fxy(x(i-1) + h, y(i-1) - k1(i) + 2*k2(i));
            y(i) = y(i-1) + 1/6*(k1(i) + 4*k2(i) + k3(i));
        case "orde 4"
            k1(i) = h*fxy(x(i-1),y(i-1));
            k2(i) = h*fxy(x(i-1) + h/2, y(i-1) + k1(i)/2);
            k3(i) = h*fxy(x(i-1) + h/2, y(i-1) + k2(i)/2);
            k4(i) = h*fxy(x(i-1) + h, y(i-1) + k3(i));
            y(i) = y(i-1) + 1/6*(k1(i) + 2*k2(i) + 2*k3(i) + k4(i));
    end
    x(i) = x(i-1) + h;
    error = abs(y_eksak - y(i-1));
    fprintf("%d\t%g\t\t%-9.8f\t\t%.8f\t\t%-10g\t%-9g\t%-9g\t%-9g\t%g\n", i-2, x(i-1), y(i-1), y_eksak, error, k1(i-1), k2(i-1), k3(i-1), k4(i-1));
end
disp('__________________________________________________________________________________________________')
toc

%% ========================================================EXPAND VERSION RUNGE KUTTA========================================================
%% RUNGE KUTTA ORDE 2
clear, clc

fxy = @(x,y) x + y;
x(1) = 0;
y(1) = 1;
h = 0.1;
xb = 1;
n = (xb - x(1))/h;
y_eksak = 3.43656365; % dapat dicari dengan metode faktor integrasi jika tidak bisa menggunakan metode PERSAMAAN HOMOGEN DENGAN SUBSTITUSI  − 

x(2:n+2) = 0;
y(2:n+2) = 0;
k1 = [0 zeros(1,n+1)];
k2 = [0 zeros(1,n+1)];
k3 = [0 zeros(1,n+1)];
k4 = [0 zeros(1,n+1)];

disp("METODE RUNGE KUTTA ORDE 2");
disp('__________________________________________________________________________________________________')
fprintf("i\tx\t\ty(numeric)\t\ty(eksak)\t\terror\t\tk1\t\t\tk2\t\t\tk3\t\t\tk4\n");
disp('__________________________________________________________________________________________________')
tic
for i = 2:n+2
    k1(i) = h*fxy(x(i-1),y(i-1));
    k2(i) = h*fxy(x(i-1) + h, y(i-1) + k1(i));
    y(i) = y(i-1) + 1/2*(k1(i) + k2(i));              
    x(i) = x(i-1) + h;
    error = abs(y_eksak - y(i-1));
    fprintf("%d\t%g\t\t%-9.8f\t\t%.8f\t\t%-10g\t%-9g\t%-9g\t%-9g\t%g\n", i-2, x(i-1), y(i-1), y_eksak, error, k1(i-1), k2(i-1), k3(i-1), k4(i-1));
end
disp('__________________________________________________________________________________________________')
toc 
%% RUNGE KUTTA ORDE 3
clear, clc

fxy = @(x,y) x + y;
x(1) = 0;
y(1) = 1;
h = 0.1;
xb = 1;
n = (xb - x(1))/h;
y_eksak = 3.43656365; % dapat dicari dengan metode faktor integrasi jika tidak bisa menggunakan metode PERSAMAAN HOMOGEN DENGAN SUBSTITUSI  − 

x(2:n+2) = 0;
y(2:n+2) = 0;
k1 = [0 zeros(1,n+1)];
k2 = [0 zeros(1,n+1)];
k3 = [0 zeros(1,n+1)];
k4 = [0 zeros(1,n+1)];

disp("METODE RUNGE KUTTA ORDE 3");
disp('__________________________________________________________________________________________________')
fprintf("i\tx\t\ty(numeric)\t\ty(eksak)\t\terror\t\tk1\t\t\tk2\t\t\tk3\t\t\tk4\n");
disp('__________________________________________________________________________________________________')
tic
for i = 2:n+2
    k1(i) = h*fxy(x(i-1), y(i-1));
    k2(i) = h*fxy(x(i-1) + h/2, y(i-1) + k1(i)/2);
    k3(i) = h*fxy(x(i-1) + h, y(i-1) - k1(i) + 2*k2(i));
    y(i) = y(i-1) + 1/6*(k1(i) + 4*k2(i) + k3(i));
    x(i) = x(i-1) + h;
    error = abs(y_eksak - y(i-1));
    fprintf("%d\t%g\t\t%-9.8f\t\t%.8f\t\t%-10g\t%-9g\t%-9g\t%-9g\t%g\n", i-2, x(i-1), y(i-1), y_eksak, error, k1(i-1), k2(i-1), k3(i-1), k4(i-1));
end
disp('__________________________________________________________________________________________________')
toc 
%% RUNGE KUTTA ORDE 4
clear, clc

fxy = @(x,y) 1 - x*y;
x(1) = 0;
y(1) = 1;
h = 0.5;
xb = 3;
n = (xb - x(1))/h;
y_eksak = 3.43656365; % dapat dicari dengan metode faktor integrasi jika tidak bisa menggunakan metode PERSAMAAN HOMOGEN DENGAN SUBSTITUSI  − 

x(2:n+2) = 0;
y(2:n+2) = 0;
k1 = [0 zeros(1,n+1)];
k2 = [0 zeros(1,n+1)];
k3 = [0 zeros(1,n+1)];
k4 = [0 zeros(1,n+1)];

disp("METODE RUNGE KUTTA ORDE 2");
disp('__________________________________________________________________________________________________')
fprintf("i\tx\t\ty(numeric)\t\ty(eksak)\t\terror\t\tk1\t\t\tk2\t\t\tk3\t\t\tk4\n");
disp('__________________________________________________________________________________________________')
tic
for i = 2:n+2
    k1(i) = h*fxy(x(i-1),y(i-1));
    k2(i) = h*fxy(x(i-1) + h/2, y(i-1) + k1(i)/2);
    k3(i) = h*fxy(x(i-1) + h/2, y(i-1) + k2(i)/2);
    k4(i) = h*fxy(x(i-1) + h, y(i-1) + k3(i));
    y(i) = y(i-1) + 1/6*(k1(i) + 2*k2(i) + 2*k3(i) + k4(i));
    x(i) = x(i-1) + h;
    error = abs(y_eksak - y(i-1));
    fprintf("%d\t%g\t\t%-9.8f\t\t%.8f\t\t%-10g\t%-9g\t%-9g\t%-9g\t%g\n", i-2, x(i-1), y(i-1), y_eksak, error, k1(i-1), k2(i-1), k3(i-1), k4(i-1));
end
disp('__________________________________________________________________________________________________')
toc 
%% ========================================================END EXPAND VERSION RUNGE KUTTA========================================================
%% 
clc ,clear, syms x y

n = 4;
x0 = [0 0.25 0.5];
y0 = [1 zeros(1,n-1)];
h = 0.25;
test = zeros(1,n);
fxy = @(x,y) 1/2*x - 1/2*y;
dy = 1/2*x - 1/2*y;
diff_taylor = zeros(1,n);
tic
for i = 2:length(x0)+1
    disp('____________________________________')
    for k = 2:n+1
        fxy = str2func(['@(x,y)' char(diff(fxy, x) + dy*diff(fxy, y))]);
        diff_taylor(k) = fxy(x0(i-1), y0(i-1));
        test(k-1) = (diff_taylor(k-1)*h^(k-1))/factorial(k-1);
        disp(diff_taylor(k-1))
%         disp(test(k-1))
    end
    y0(i) = y0(i-1) + sum(test);
end
toc










