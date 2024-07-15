clear, clc, close all

fungsiP = @(x) -2/x;
fungsiQ = @(x) 2/x^2;
fungsiR = @(x) sin(log(x))/x^2;

a=1.0;
b=2.0;

alpha=1;
beta=2;


%=======jika diketahui n, maka h dihitung ====
n=9;
h=(b-a)/(n+1);
A(n,n) = 0;
b(n,1) = 0;

%=======jika diketahui h, maka n dihitung ====
% h=0.1;
% n=((b-a)/h)-1;
 
%====== Mencari Elemen Matrik A ========
tic
for i=1:n
    x=a+i*h;
    A(i,i)=2+h^2*fungsiQ(x);
end
for i=1:n-1
    x=a+i*h;
    A(i,i+1)=-1+((h/2)*fungsiP(x));
end
for i=2:n
    x=a+i*h;
    A(i,i-1)=-1-((h/2)*fungsiP(x));
end

% ====== Mencari Elemen Vektor b ========
x=a+h;
b(1,1)=-h^2*fungsiR(x)+(1+((h/2)*fungsiP(x)))*alpha;
for i=2:8
    x=a+i*h;
    b(i,1)=-h^2*fungsiR(x);
end
xn=a+n*h;
b(n,1)=-h^2*fungsiR(xn)+(1-((h/2)*fungsiP(xn)))*beta;

%====== Menggabungkan Vektor b kedalam matrik A ========
for i=1:n
    A(i,n+1)=b(i,1);
end

%&&&&&& Proses Eliminasi Gauss &&&&&&&&&&&&&&&&&&&&&&&&&
%---------Proses Triangularisasi-----------
for j=1:n-1
    %----mulai proses pivot---
    if A(j,j) == 0
        for p = 1:n+1
            u = A(j,p);
            v = A(j+1,p);
            A(j+1,p) = u;
            A(j,p) = v;
        end
    end
    %----akhir proses pivot---
    jj = j + 1;
    for i = jj:n
        m = A(i,j)/A(j,j);
        for k = 1:n+1
            A(i,k) = A(i,k) - (m*A(j,k));
        end
    end
end
%-------------------------------------------
%------Proses Substitusi mundur-------------
 
x(n,1) = A(n,n+1)/A(n,n);
for i=n-1:-1:1
    S = 0;
    for j = n:-1:i+1
        S = S + A(i,j)*x(j,1);
    end
    x(i,1) = (A(i,n+1) - S)/A(i,i);
end
toc

%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%===== Menampilkan Vektor w =================
w = x

%% REFACTORING VERSION (Finite Difference Methode)
clear, clc, close all

% ==========================CONTOH KASUS===================================
% Diketahui persamaan diferensial seperti berikut ini
% y′′ = (-2/x)y′ + (2/x^2)y + sin(ln(x))/x^2; 1 <= x <= 2; y(1) = 1; y(2) = 2
% ==========================SELESAI===================================

fungsiP = @(x) -2/x;
fungsiQ = @(x) 2/x^2;
fungsiR = @(x) sin(log(x))/x^2;

a=1.0; % x0
b=2.0; % x

alpha=1; % y0
beta=2; % y

%=======jika diketahui n, maka h dihitung ====
% n=9;
% h=(b-a)/(n+1);

%=======jika diketahui h, maka n dihitung ====
h=0.1;
n=((b-a)/h)-1;
A(n,n) = 0;
b(n,1) = 0;

tic
for i = 1:n
    x = a + i*h;
    
    % Membuat matriks A
    A(i,i) = 2 + h^2*fungsiQ(x);
    if i > 1; A(i,i - 1) = -1 - ((h/2)*fungsiP(x)); end
    if i < n; A(i,i + 1) = -1 + ((h/2)*fungsiP(x)); end
    % Selesai membuat matriks A
    
    % Membuat matriks B
    b(1,1) = -h^2*fungsiR(a + h) + (1 + ((h/2) * fungsiP(a + h)))*alpha;
    if i > 1 && i < n; b(i,1) = -h^2*fungsiR(x); end
    b(n,1) = -h^2*fungsiR(x) + (1 - ((h/2)*fungsiP(x)))*beta;
    % Selesai membuat matriks B
end

%&&&&&& Proses Eliminasi Gauss &&&&&&&&&&&&&&&&&&&&&&&&&
%---------Proses Triangularisasi-----------
A = [A b]; % Menggabungkan matriks A dan b
A
for p=1:n-1
    for k = p+1:n
        m = A(k,p) / A(p,p);
        A(k,p:n+1) = A(k,p:n+1) - m*A(p,p:n+1);
    end
end

%------Proses Substitusi mundur-------------
B = A(:,end);
A = A(:, 1:end-1);
w = zeros(n,1);
 
w(n) = B(n)/A(n,n);
if eq(isnan(w(n)), 1)
    w(n) = 0;
else
    for k = n-1:-1:1 
        w(k) = ( B(k) - sum( A(k ,k+1:end) .* w(k+1:end)' ) ) / A(k,k);
    end
end
toc
w
