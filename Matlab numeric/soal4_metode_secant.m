%% METODE SECANT
clc
disp('METODE SECANT')
y=@(x) exp(x) - x;
x0 = 0.1;
x1 = 0.2;
Er = 10^-5;
imax = 100;
i=0;
Tol=abs(x0-x1);
if y(x0)==0
    fprintf('%d adalah akar\n',x0);
elseif y(x1)==0
    fprintf('%d adalah akar\n',x1);
else
    fprintf('___________________________________________________________\n');
    fprintf('i\tx0\t\t\tx1\t\t\tx\t\t\tFx\t\t\tError\n');
    fprintf('___________________________________________________________\n');
    X=zeros(imax,1);
    while Tol>Er && i<imax
        i=i+1;
        X(i)=x1-(y(x1)*((x1-x0)/(y(x1)-y(x0))));
        FX=y(X(i));
        fprintf('%d\t%f\t%f\t%f\t%9f\t%f\n',i,x0,x1,X(i),FX,Tol)
        x0=x1;
        x1=X(i);
        Tol=abs(x0-x1);
    end
    fprintf('%d\t%f\t%f\t%f\t%9f\t%f\n',i+1,x0,x1,X(i),FX,Tol)
end
fprintf('___________________________________________________________\n');
fprintf('Akar persamaannya adalah=%f\n',X(i))
fprintf('=======================================\n')

%%
clc
% Inisialisasi variabel
x0 = 0.1;  % tebakan awal x1
x1 = 0.2;  % tebakan awal x2
tol = 1e-5;  % toleransi kesalahan
max_iter = 100;  % maksimum iterasi

% Iterasi Metode Secant
for i = 1:max_iter
    f0 = exp(x0) - x0;
    f1 = exp(x1) - x1;
    x = x1 - f1*(x1-x0)/(f1-f0);  % rumus metode secant
    err = abs(x - x1);  % kesalahan relatif
    fprintf('Iterasi %d, x = %f, err = %e\n', i, x, err);
    if err < tol  % jika error sudah lebih kecil dari toleransi, hentikan iterasi
        break;
    end
    % persiapan untuk iterasi selanjutnya
    x0 = x1;
    x1 = x;
end

% Output
fprintf('Akar yang ditemukan: %f\n', x);
