%% PERSAMAAN DIFERENSIAL ORDE TINGGI
clear, clc, close all
% Nama: Angga Dwi Sunarto
% Nim: 24040119140105
% Tugas Fisika Komputasi: PD Orde Tinggi

x(1) = 0; % nilai awal x
xb = 2; % nilai akhir x
y(1) = 0; % nilai awal y
z(1) = 0; % nilai awal z(dy/dx)
h = 0.2; % step pengukuran
n = (xb-x)/h; % jumlah segmen sebagai batas jumlah iterasi

% membuat array kosong untuk menampung nilai pada variabel x,y,z,k1,k2,l1,l2
x(2:n+1) = 0;
y(2:n+1) = 0;
z(2:n+1) = 0;
k1 = [0 zeros(1,n+1)];
k2 = [0 zeros(1,n+1)];
l1 = [0 zeros(1,n+1)];
l2 = [0 zeros(1,n+1)];

f = @(x,y,z) 1-2*x*y-3*z; % fungsi untuk menampung persamaan diferensial orde 2
g = @(x,y,z) z; % fungsi untuk menampung nilai z(dy/dx)

methodes = ["Runga Kutta", "Euler"]; % variable untuk menampung string pada array
a = 1; % variabel a sebagai pengendali untuk metode yang ingin digunakan ada 2 metode yaitu:
            % 2. Metode Runga Kutta orde 2
            % 1. Metode Euler

disp("Metode " + methodes(a))
switch methodes(a) % pengkondisian menggunakan switch dengan case pada variabel methodes
    case "Runga Kutta" % jika variable methodes bernilai "Runga Kutta" maka jalan kan program selanjutnya jika tidak maka skip
        disp('______________________________________________________________________________________________________')
        fprintf("i\tx\t\ty\t\t\t\tz\t\t\t\tk1\t\t\t\tl1\t\t\t\tk2\t\t\t\tl2\n");
        disp('______________________________________________________________________________________________________')
        for i = 2:12
            k1(i) = h*g(x(i-1),y(i-1),z(i-1)); % masukkan nilai dengan k1 pada index ke i dengan h*g(x pada index i-1, y pada index i-1, z pada index i-1)
            l1(i) = h*f(x(i-1),y(i-1),z(i-1)); % masukkan nilai dengan l1 pada index ke i dengan h*f(x pada index i-1, y pada index i-1, z pada index i-1)
            k2(i) = h*g(x(i-1) + h, y(i-1) + k1(i), z(i-1) + l1(i)); % masukkan nilai dengan k2 pada index ke i dengan h*g((x pada index i-1) + h, (y pada index i-1) + (k1 pada index ke i), (z pada index i-1) + (l1 pada index ke i))
            l2(i) = h*f(x(i-1) + h, y(i-1) + k1(i), z(i-1) + l1(i)); % masukkan nilai dengan l2 pada index ke i dengan h*f((x pada index i-1) + h, (y pada index i-1) + (k1 pada index ke i), (z pada index i-1) + (l1 pada index ke i))
            y(i) = y(i-1) + 1/2*(k1(i) + k2(i)); % masukan nilai dengan y pada index ke i dengan (y pada index ke i-1) + 1/2*((k1 pada index ke i) + (k2 pada index ke i))
            z(i) = z(i-1) + 1/2*(l1(i) + l2(i));  % masukan nilai dengan z pada index ke i dengan (z pada index ke i-1) + 1/2*((l1 pada index ke i) + (l2 pada index ke i))
            x(i) = x(i-1) + h; % masukkan nilai dengan y pada index ke i dengan x pada index ke i-1 + h
            fprintf('%g\t%g\t\t%-10g\t\t%-10g\t\t%-10g\t\t%-10g\t\t%-10g\t\t%g\n',(i-2) ,x(i-1), y(i-1),z(i-1), k1(i-1), l1(i-1), k2(i-1), l2(i-1))
        end
        disp('______________________________________________________________________________________________________')
    case "Euler" % jika variable methodes bernilai "Euler" maka jalan kan program selanjutnya jika tidak maka skip
        disp('__________________________________')
        fprintf("i\tx\t\ty\t\t\tz\n");
        disp('__________________________________')
            for i = 2:n+2
                y(i) = y(i-1) + h*g(x(i-1),y(i-1),z(i-1)); % masukkan nilai dengan y pada index ke i dengan y pada index ke i-1 + h*g(x index ke i-1, y index ke i-1, z index ke i-1)
                z(i) = z(i-1) + h*f(x(i-1),y(i-1),z(i-1)); % masukkan nilai dengan z pada index ke i dengan z pada index ke i-1 + h*f(x index ke i-1, y index ke i-1, z index ke i-1)
                x(i) = x(i-1) + h; % masukkan nilai dengan y pada index ke i dengan x pada index ke i-1 + h
                fprintf('%g\t%g\t\t%-8g\t%g\n',i-2, x(i-1), y(i-1), z(i-1))
            end
        disp('__________________________________')
end

% plotting nilai x,y dan x,z
plot(x,y, '--ob')
hold on
plot(x,z, '--or')

%% Metode Euler
clear, clc, close all
% Nama: Angga Dwi Sunarto
% Nim: 24040119140105
% Tugas Fisika Komputasi: PD Orde Tinggi

x(1) = 0;
xb = 2;
y(1) = 0;
z(1) = 1;
h = 0.2;
n = (xb-x)/h;

x(2:n+1) = 0;
y(2:n+1) = 0;
z(2:n+1) = 0;

% f = @(x,y,z) 1/2*y - 1;
f = @(x,y,z) 10^5 - 10*y - 10*z;
g = @(x,y,z) z;

disp('__________________________________')
fprintf("i\tx\t\ty\t\t\tz\n");
disp('__________________________________')
    for i = 2:n+2
        y(i) = y(i-1) + h*g(x(i-1),y(i-1),z(i-1));
        z(i) = z(i-1) + h*f(x(i-1),y(i-1),z(i-1));
        x(i) = x(i-1) + h;
        fprintf('%g\t%g\t\t%-8g\t%g\n',i-2, x(i-1), y(i-1), z(i-1))
    end
disp('__________________________________')
plot(x,y, '--ob')
hold on
plot(x,z, '--or')

%% Metode Runga Kutta Orde 2
clear, clc, close all
% Nama: Angga Dwi Sunarto
% Nim: 24040119140105
% Tugas Fisika Komputasi: PD Orde Tinggi

x(1) = 0;
xb = 2;
y(1) = 0;
z(1) = 1;
h = 0.2;
n = (xb-x)/h;

x(2:n+1) = 0;
y(2:n+1) = 0;
z(2:n+1) = 0;
k1 = [0 zeros(1,n+1)];
k2 = [0 zeros(1,n+1)];
l1 = [0 zeros(1,n+1)];
l2 = [0 zeros(1,n+1)];

f = @(x,y,z) 10^5 - 10*y - 10*z;
g = @(x,y,z) z;

disp('______________________________________________________________________________________________________')
fprintf("i\tx\t\ty\t\t\t\tz\t\t\t\tk1\t\t\t\tl1\t\t\t\tk2\t\t\t\tl2\n");
disp('______________________________________________________________________________________________________')
for i = 2:n+2
    k1(i) = h*g(x(i-1),y(i-1),z(i-1));
    l1(i) = h*f(x(i-1),y(i-1),z(i-1));
    k2(i) = h*g(x(i-1) + h, y(i-1) + k1(i), z(i-1) + l1(i));
    l2(i) = h*f(x(i-1) + h, y(i-1) + k1(i), z(i-1) + l1(i));
    y(i) = y(i-1) + 1/2*(k1(i) + k2(i));
    z(i) = z(i-1) + 1/2*(l1(i) + l2(i));
    x(i) = x(i-1) + h;
    fprintf('%g\t%g\t\t%-10g\t\t%-10g\t\t%-10g\t\t%-10g\t\t%-10g\t\t%g\n',(i-2) ,x(i-1), y(i-1),z(i-1), k1(i-1), l1(i-1), k2(i-1), l2(i-1))
end
disp('______________________________________________________________________________________________________')
plot(x,y, '--ob', 'DisplayName', 'Nilai V')
xlabel('nilai x')
ylabel('nilai y')
title("grafik hubungan antara waktu dengan V dan nilai V' ")
legend()
hold on
plot(x,z, '--or', 'DisplayName', "Nilai V'")

%% PROGRAM PD ORDE 2 OSILASI
clear, clc, close all

x(1) = 0; % nilai awal x
y(1) = 0; % nilai awal y
z(1) = 100; % nilai awal z
h = 0.2; % step pengukuran
n = 100; % jumlah iterasi

% membuat array kosong untuk menampung nilai pada variabel x,y,z
x(2:n+1) = 0;
y(2:n+1) = 0;
z(2:n+1) = 0;

g = @(z) z; % fungsi untuk menampung nilai z(dy/dx)
f = @(x,y,z) -1*y - .5*z; % fungsi untuk menampung persamaan diferensial orde 2

disp('__________________________________')
fprintf("i\t  x\t\t\t  y\t\t\t  z\n");
disp('__________________________________')
for i = 2:n+2
    y(i) = y(i-1) +(h*g(z(i-1))); % masukkan nilai dengan y pada index ke i dengan y pada index ke i-1 + h*g(z index ke i-1)
    z(i) = z(i-1) + h*f(x(i-1),y(i),z(i-1)); % masukkan nilai dengan z pada index ke i dengan z pada index ke i-1 + h*f(x index ke i-1, y index ke i, z index ke i-1)
    x(i) = x(i-1) + h; % masukkan nilai dengan y pada index ke i dengan x pada index ke i-1 + h
    fprintf('%g\t%4g\t%10g\t%10g\n',i-2, x(i-1), y(i-1), z(i-1));
end
disp('__________________________________')
% plotting nilai x index 2 sampai index terakhir - 1 dan y index 2 sampai index terakhir - 1
plot(x(2:end-1),y(2:end-1), '--ob')
hold on
% plotting nilai x index 2 sampai index terakhir - 1 dan z index 2 sampai index terakhir - 1
plot(x(2:end-1),z(2:end-1), '--or')

