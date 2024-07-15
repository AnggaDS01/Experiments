%% INTEGRAL NUMERIK 
clc, clear, syms x u % clc: untuk clear command window, clear: untuk clear variable yang tersimpan di workspace, syms: digunakan untuk memberi akses pada symbol yang ingin dipakai pada persamaan
% Nama : Angga Dwi Sunarto
% Nim : 24040119140105

% penejalasan program integral
% Program ini digunakan untuk melakukan perhitungan integral secara numerik dengan bantuan matlab
% ada beberapa metode yang dipakai pada program ini, yakni:
    % Metode trapesium, dengan persamaan yaitu : L = h/2(f_0 + 2f_1 + 2f_2 + ... + 2f_n-1 + 2f_n)
    % Metode simpson 1/3, dengan persamaan yaitu : L = h/3(f_0 4*JUMLAH f_i(ganjil) + 2*JUMLAH f_i(genap) + f_n)
    % Metode midpoint, dengan persamaan yaitu : L = h( f_1/2 + f_3/2 + f_5/2 + ... + f_n-(1/2) )
        % dimana: x_1/2 = x_0 + (h/2)
% untuk jumlah segmen dapat dicari dengan n = (b - a) / h

fx = @(x) x^3 + 4*x^2 - 3*x + 1; % variable untuk menampung nilai dari fungsi atau persamaan matematik
fx_int = str2func(['@(x)' char(int(fx(x)))]); % conversi ke bentuk string agar function dapat di integralkan
h = 0.05; % toleransi yang diberikan pada proses perhitungan integral secara numerik, semakin kecil toleransi semakin banyak segmen yang akan tergenerate
a = 1; % batas bawah integral
b = 3; % batas atas integral
idx = (b-a)/h; % variable yang digunakan untuk membagi luas dibawah kurva pada function matematik jadi beberapa segmen
x_i = linspace(a,b,idx+1); % men-generate list data dengan nilai awal, akhir, dan step yang diberikan => linspace(nilai min, nilai max, step yang diberikan)
nilai_eksak = fx_int(b) - fx_int(a); % untuk mendapatkan nilai eksak yang akan dijadikan sebagai pembanding

ctrl = 4; % variable 'ctrl' digunakan sebagai pengendali untuk memilih metode yang ingin dipakai, adapun methode yang tersedia pada program ini sebagai berikut:
            % 1 = 'simpson methode'
            % 2 = 'metode trapesium'
            % 3 = 'metode mid point'
            % 4 = 'gauss-legendre'
n = 2; % jumlah titik yang ingin digunakan pada metode gauss-legendre
       % note: semakin banyak titik maka program akan berjalan lebih lama
       % namun untuk hasil akan semakin presisi
       
methodes = [
    "simpson methode";
    "metode trapesium";
    "metode mid point";
    "gauss-legendre " + n + " titik"
]; % digunakan untuk menampung nilai ke dalam array 
methode = methodes(ctrl); % mengisi nilai variable berdasarkan index pada variable methodes
f_n = zeros(1, length(x_i)); % membuat itinial value untuk menampung nilai f_n sebagai perhitungan fungsi terhadap x setiap iterasinya
x_mid = zeros(1, length(x_i)-1); % membuat itinial value untuk menampung nilai x untuk metode midpoint
[nodes, weight] = nodes_weight_gauss(n, u);

fprintf('menggunakan "%s"\n',methodes(ctrl));
disp('______________________________________')
fprintf('i\tnumerik\t\teksak\t\terror\n')
disp('______________________________________')
tic
if strcmp(methode, "gauss-legendre " + n + " titik")
    % METODE GAUSS LEGENDRE_________________________________________________
    x_gauss = @(t)((a+b)+(b-a)*t)/2; % mengubah batas integral menjadi -1 sampai 1 dengan manipulasi nilai x pada fungsi fx
    dx = (b-a)/2; % mengubah nilai dx menjadi dt sebagai bentuk transformasi karna perubahan dari batas integral
    integral = zeros(1,n);
    
    for i = 1:n
        integral(i) = weight(i)*dx*( fx(x_gauss(nodes(i))));
    end
    error = abs( (nilai_eksak - sum(integral)) / nilai_eksak ); % mencari error dari perhitungan integrasi secara numerik terhadap nilai integrasi eksak
    fprintf('%d\t%-12g%-10g\t%g\n',1,sum(integral),nilai_eksak,error) % menampilkan nilai dari perhitungan
else
    for i = 1:length(x_i) % melakukan iterasi dari 1 sampai panjang dari array pada variable x_i
        switch(methode) % lakukan pengkondisian sesuai dari value pada variable methode
            case 'simpson methode' % jika value dari variable methode = 'simpson methode' maka eksekusi program selanjutnya, jika tidak maka skip
                % METODE 1/3 SIMPSON_________________________________________________
                f_n(i) = fx(x_i(i)); % assign new value dari f_n dengan index ke-i dengan nilai dari fungsi y terhadap x, dimana x didapat dari variable x_i, dan array x_i diambil nilai berdasarkan nilai i (iterasi dalam kasus ini)
                if i > 1 && i < length(x_i)&& mod(i,2) == 0 % lakukan pengkondisian jika nilai i > 1 dan nilai i < panjang array x_i dan lakukan operasi modulo(sisa bagi untuk mendapat kan nilai i genap)
                    f_n(i) = f_n(i)*4; % assign new value dari f_n dengan index ke i dengan f_n index ke-i dikali 4
                elseif i > 1 && i < length(x_i)&& mod(i,2) == 1 % lakukan pengkondisian jika nilai i > 1 dan nilai i < panjang array x_i dan lakukan operasi modulo(sisa bagi untuk mendapat kan nilai i ganjil)
                    f_n(i) = f_n(i)*2; % assign new value dari f_n dengan index ke i dengan f_n index ke-i dikali 2
                end
                integral = (h/3)*(f_n(1) + sum(f_n(2:end-1)) + f_n(end)); % variable integral pada metode simpson 1/3, digunakan untuk menampung hasil perhitungan secara komputasi dengan persamaan numerik untuk mendapatkan hasil integrasi, dengan menggunakan persamaan numerik metode simpson
            case 'metode trapesium' % jika value dari variable methode = 'metode trapesium' maka eksekusi program selanjutnya, jika tidak maka skip
                % METODE TRAPESIUM_________________________________________________
                f_n(i) = fx(x_i(i)); % assign new value dari f_n dengan index ke-i dengan nilai dari fungsi y terhadap x, dimana x didapat dari variable x_i, dan array x_i diambil nilai berdasarkan nilai i (iterasi dalam kasus ini)
                integral = (h/2)*(f_n(1) + 2*sum(f_n(2:end-1)) + f_n(end)); % variable integral pada metode trapesium, digunakan untuk menampung hasil perhitungan secara komputasi dengan persamaan numerik untuk mendapatkan hasil integrasi, dengan menggunakan persamaan numerik metode trapesium
            case 'metode mid point' % jika value dari variable methode = 'metode mid point' maka eksekusi program selanjutnya, jika tidak maka skip
                % METODE MID POINT_________________________________________________
                if i < length(x_i) % lakukan pengkondisian jika i kurang dari panjang array x_i maka eksekusi program selanjutnya, jika tidak maka skip
                    x_mid(i) = x_i(i) + (x_i(i+1) - x_i(i)) / 2; % menghitung nilai x_i+(1/2) untuk mendapatkan nilai setiap fungsi y terhadap x untuk i dari 1 sampai panjang dari array x_i dikurang dengan 1, agar tidak overlap saat indexing i+1
                    f_n(i) = fx(x_mid(i)); % assign new value dari f_n dengan index ke-i dengan nilai dari fungsi y terhadap x, dimana x didapat dari variable new_x, yang mendapatkan nilai x_i+(1/2) untuk memenuhi syarat perhitungan metode midpoint 
                end
                integral = h*sum(f_n); % assign new value dari hasil perhitungan integrasi numerik pada metode mid point
        end
    end
    error = abs( (nilai_eksak - integral) / nilai_eksak ); % hitungan nilai error relatif terhadap nilai_eksak, dengan hasil integrasi numerik
    fprintf('%d\t%-12g%-10g\t%g\n',1,integral,nilai_eksak,error) % print out hasil dari perhitungan tiap iterasi
end
disp('______________________________________')
toc

%% SEPERATED VERSION
%% METODE TRAPESIUM
clc, clear, syms x

fx = @(x) 2*x^4 + 4*x^2; % variable untuk menampung nilai dari fungsi atau persamaan matematik
fx_int = str2func(['@(x)' char(int(fx(x)))]); % conversi ke bentuk string agar function dapat di integralkan
h = 0.5; % toleransi yang diberikan pada proses perhitungan integral secara numerik, semakin kecil toleransi semakin banyak segmen yang akan tergenerate
a = 1; % batas bawah integral
b = 3; % batas atas integral
idx = (b-a)/h; % variable yang digunakan untuk membagi luas dibawah kurva pada function matematik jadi beberapa segmen
x_i = linspace(a,b,idx+1); % men-generate list data dengan nilai awal, akhir, dan step yang diberikan => linspace(nilai min, nilai max, step yang diberikan)
nilai_eksak = fx_int(b) - fx_int(a); % untuk mendapatkan nilai eksak yang akan dijadikan sebagai pembanding

f_n = zeros(1, length(x_i)); % membuat itinial value untuk menampung nilai f_n sebagai perhitungan fungsi terhadap x setiap iterasinya

disp('METODE TRAPESIUM')
disp('__________________________________________________')
fprintf('i\tnumerik\t\teksak\t\terror\t  | x_i\t | f_i\n')
disp('__________________________________________________')
tic
for i = 1:length(x_i)
    f_n(i) = fx(x_i(i)); % assign new value dari f_n dengan index ke-i dengan nilai dari fungsi y terhadap x, dimana x didapat dari variable x_i, dan array x_i diambil nilai berdasarkan nilai i (iterasi dalam kasus ini)
    integral = (h/2)*(f_n(1) + 2*sum(f_n(2:end-1)) + f_n(end)); % variable integral pada metode trapesium, digunakan untuk menampung hasil perhitungan secara komputasi dengan persamaan numerik untuk mendapatkan hasil integrasi, dengan menggunakan persamaan numerik metode trapesium
    error = abs( (nilai_eksak - integral) / nilai_eksak ); % hitungan nilai error relatif terhadap nilai_eksak, dengan hasil integrasi numerik
    fprintf('%d\t%-12g%-10g\t%-10g|\t%g\t | %g\n',i,integral,nilai_eksak,error,x_i(i), fx(x_i(i))) % print out hasil dari perhitungan tiap iterasi
end
disp('__________________________________________________')
toc
%% METODE SIMPSON 1/3
clc, clear, syms x

fx = @(x) 2*x^4 + 4*x^2; % variable untuk menampung nilai dari fungsi atau persamaan matematik
fx_int = str2func(['@(x)' char(int(fx(x)))]); % conversi ke bentuk string agar function dapat di integralkan
h = 0.5; % toleransi yang diberikan pada proses perhitungan integral secara numerik, semakin kecil toleransi semakin banyak segmen yang akan tergenerate
a = 1; % batas bawah integral
b = 3; % batas atas integral
idx = (b-a)/h; % variable yang digunakan untuk membagi luas dibawah kurva pada function matematik jadi beberapa segmen
x_i = linspace(a,b,idx+1); % men-generate list data dengan nilai awal, akhir, dan step yang diberikan => linspace(nilai min, nilai max, step yang diberikan)
nilai_eksak = fx_int(b) - fx_int(a); % untuk mendapatkan nilai eksak yang akan dijadikan sebagai pembanding

f_n = zeros(1, length(x_i)); % membuat itinial value untuk menampung nilai f_n sebagai perhitungan fungsi terhadap x setiap iterasinya

disp('METODE SIMPSON 1/3')
disp('__________________________________________________')
fprintf('i\tnumerik\t\teksak\t\terror\t  | x_i\t | f_i\n')
disp('__________________________________________________')
tic
for i = 1:length(x_i)
    f_n(i) = fx(x_i(i)); % assign new value dari f_n dengan index ke-i dengan nilai dari fungsi y terhadap x, dimana x didapat dari variable x_i, dan array x_i diambil nilai berdasarkan nilai i (iterasi dalam kasus ini)
        if i > 1 && i < length(x_i)&& mod(i,2) == 0 % lakukan pengkondisian jika nilai i > 1 dan nilai i < panjang array x_i dan lakukan operasi modulo(sisa bagi untuk mendapat kan nilai i genap)
            f_n(i) = f_n(i)*4; % assign new value dari f_n dengan index ke i dengan f_n index ke-i dikali 4
        elseif i > 1 && i < length(x_i)&& mod(i,2) == 1 % lakukan pengkondisian jika nilai i > 1 dan nilai i < panjang array x_i dan lakukan operasi modulo(sisa bagi untuk mendapat kan nilai i ganjil)
            f_n(i) = f_n(i)*2; % assign new value dari f_n dengan index ke i dengan f_n index ke-i dikali 2
        end
    integral = (h/3)*(f_n(1) + sum(f_n(2:end-1)) + f_n(end)); % variable integral pada metode simpson 1/3, digunakan untuk menampung hasil perhitungan secara komputasi dengan persamaan numerik untuk mendapatkan hasil integrasi, dengan menggunakan persamaan numerik metode simpson
    error = abs( (nilai_eksak - integral) / nilai_eksak ); % hitungan nilai error relatif terhadap nilai_eksak, dengan hasil integrasi numerik
    fprintf('%d\t%-12g%-10g\t%-10g|\t%g\t | %g\n',i,integral,nilai_eksak,error,x_i(i), fx(x_i(i))) % print out hasil dari perhitungan tiap iterasi
end
disp('__________________________________________________')
toc

%% METODE MID POINT
clc, clear, syms x

fx = @(x) 2*x^4 + 4*x^2; % variable untuk menampung nilai dari fungsi atau persamaan matematik
fx_int = str2func(['@(x)' char(int(fx(x)))]); % conversi ke bentuk string agar function dapat di integralkan
h = 0.5; % toleransi yang diberikan pada proses perhitungan integral secara numerik, semakin kecil toleransi semakin banyak segmen yang akan tergenerate
a = 1; % batas bawah integral
b = 3; % batas atas integral
idx = (b-a)/h; % variable yang digunakan untuk membagi luas dibawah kurva pada function matematik jadi beberapa segmen
x_i = linspace(a,b,idx+1); % men-generate list data dengan nilai awal, akhir, dan step yang diberikan => linspace(nilai min, nilai max, step yang diberikan)
nilai_eksak = fx_int(b) - fx_int(a); % untuk mendapatkan nilai eksak yang akan dijadikan sebagai pembanding

f_n = zeros(1, length(x_i)); % membuat itinial value untuk menampung nilai f_n sebagai perhitungan fungsi terhadap x setiap iterasinya
x_mid = zeros(1, length(x_i)); % membuat itinial value untuk menampung nilai x untuk metode midpoint

disp('METODE MID POINT')
disp('___________________________________________________________')
fprintf('i\tnumerik\t\teksak\t\terror\t\tx_i+1/2\t\tfn_i\n')
disp('___________________________________________________________')
tic
for i = 1:length(x_i)
        if i < length(x_i) % lakukan pengkondisian jika i kurang dari panjang array x_i maka eksekusi program selanjutnya, jika tidak maka skip
            x_mid(i) = x_i(i) + (x_i(i+1) - x_i(i)) / 2; % menghitung nilai x_i+(1/2) untuk mendapatkan nilai setiap fungsi y terhadap x untuk i dari 1 sampai panjang dari array x_i dikurang dengan 1, agar tidak overlap saat indexing i+1
            f_n(i) = fx(x_mid(i)); % assign new value dari f_n dengan index ke-i dengan nilai dari fungsi y terhadap x, dimana x didapat dari variable new_x, yang mendapatkan nilai x_i+(1/2) untuk memenuhi syarat perhitungan metode midpoint 
        end
    integral = h*sum(f_n); % assign new value dari hasil perhitungan integrasi numerik pada metode mid point
    error = abs( (nilai_eksak - integral) / nilai_eksak ); % hitungan nilai error relatif terhadap nilai_eksak, dengan hasil integrasi numerik
    fprintf('%d\t%-12g%-10g\t%g\t%-4g\t\t%g\n',i,integral,nilai_eksak,error,x_mid(i),f_n(i)) % print out hasil dari perhitungan tiap iterasi
end
disp('___________________________________________________________')
toc

%% METODE GAUSS KUADRATUR
clc, clear, syms x u

fx = @(x) 2*x^4 + 4*x^2; % variable untuk menampung nilai dari fungsi atau persamaan matematik
fx_int = str2func(['@(x)' char(int(fx(x)))]); % conversi ke bentuk string agar function dapat di integralkan
h = 0.5; % toleransi yang diberikan pada proses perhitungan integral secara numerik, semakin kecil toleransi semakin banyak segmen yang akan tergenerate
a = 1; % batas bawah integral
b = 3; % batas atas integral
idx = (b-a)/h; % variable yang digunakan untuk membagi luas dibawah kurva pada function matematik jadi beberapa segmen
x_i = linspace(a,b,idx+1); % men-generate list data dengan nilai awal, akhir, dan step yang diberikan => linspace(nilai min, nilai max, step yang diberikan)
nilai_eksak = fx_int(b) - fx_int(a); % untuk mendapatkan nilai eksak yang akan dijadikan sebagai pembanding

n = 2;
f_n = zeros(1, length(x_i)); % membuat itinial value untuk menampung nilai f_n sebagai perhitungan fungsi terhadap x setiap iterasinya
[nodes, weight] = nodes_weight_gauss(n, u);

fprintf('METODE GAUSS KUADRATUR %d TITIK\n', n)
disp('______________________________________')
fprintf('i\tnumerik\t\teksak\t\terror\n')
disp('______________________________________')
tic
for i = 1:length(x_i)
    x_gauss = @(t)((a+b)+(b-a)*t)/2; % mengubah batas integral menjadi -1 sampai 1 dengan manipulasi nilai x pada fungsi fx
    dx = (b-a)/2; % mengubah nilai dx menjadi dt sebagai bentuk transformasi karna perubahan dari batas integral
    integral = zeros(1,n);
    
    for i = 1:n
        integral(i) = weight(i)*dx*( fx(x_gauss(nodes(i))));
    end
end
error = abs( (nilai_eksak - sum(integral)) / nilai_eksak ); % mencari error dari perhitungan integrasi secara numerik terhadap nilai integrasi eksak
fprintf('%d\t%-12g%-10g\t%g\n',1,sum(integral),nilai_eksak,error) % menampilkan nilai dari perhitungan
disp('______________________________________')
toc


% e = @(t) 2*((2 + t)^4) + 4*(2+t)^2;
% ee = e(1/sqrt(3)) + e(-1/sqrt(3));
%% METODE MONTE CARLO
clear, clc
f = @(x) 2*x.^4 + 4*x.^2;

a = 1;
b = 3;
n = 20000;

xx = linspace(a,b,n); 
yy = f(xx);
ymax = max(yy);

accept = 0;
xin = zeros(1,n);
yin = zeros(1,n);
xout = zeros(1,n);
yout = zeros(1,n);
for i = 1:n
    x = unifrnd(a,b);
    y = unifrnd(0,1)*ymax;
    if y <= f(x)
       accept = accept + 1;
       xin(i) = x;
       yin(i) = y;
    else
       xout(i) = x;
       yout(i) = y;
    end
end
luas_pp = (b-a)*ymax;
integral = (accept/n)*luas_pp;

plot(xx, yy, 'k', 'Linewidth', 3)
hold on
plot(xin, yin, 'og');
plot(xout, yout, 'or');
hold off

%% END SEPERATED VERSION
%% FOOT NOTE
clc, clear, syms x
fx = @(x) sin(x)^3*cos(x);
eq = sin(x)^3*cos(x);
h = 0.05;
a = 0;
b = pi/2;
idx = (b-a)/h;
x_i = linspace(a,b,idx+1);

kiri = subs(int(eq), x, b);
kanan = subs(int(eq), x, a);
nilai_eksak = eval(kiri - kanan);

% metode gauss 3 titik
tic
% file_name = 'gauss_legendre.xlsm';
% sheet = 'Sheet1';
% [col, txt, raw] = xlsread(file_name, sheet);
% x = col(:, 1);
% c = col(:, 2);

x_gauss = @(t)((a+b)+(b-a)*t)/2;
dx = (b-a)/2;
% % integral = dx*( fx(x_gauss(1/sqrt(3)))  + fx(x_gauss(-1/sqrt(3))) );
% % integral = 8/9*dx*fx(x_gauss(0))  + 5/9*dx*fx(x_gauss(-sqrt(3/5))) + 5/9*dx*fx(x_gauss(sqrt(3/5)));
% % integral = 0.347854845*dx*fx(x_gauss(-0.8611336312))  + 0.652145155*dx*fx(x_gauss(-0.339981044)) + 0.652145155*dx*fx(x_gauss(0.339981044)) + 0.347854845*dx*fx(x_gauss(0.8611336312));
% integral = 0.5688888888888889*dx*fx(x_gauss(0))  + 0.478628670499366*dx*fx(x_gauss(-0.5384693101056831)) + 0.4786286704993665*dx*fx(x_gauss(0.5384693101056831)) + 0.2369268850561891*dx*fx(x_gauss(-0.9061798459386640)) + + 0.2369268850561891*dx*fx(x_gauss(0.9061798459386640));

% n = 4;
% Sn = (n/2)*(2 + (n-1))-1;
% n_point = c((Sn+1)-n:Sn);
% c_point = x((Sn+1)-n:Sn);
% 
% for i = 1:n
%     integral(i) = n_point(i)*dx*( fx(x_gauss(c_point(i))));
% end
% error = abs( (nilai_eksak - sum(integral)) / nilai_eksak );
% fprintf('%d\t%-12g%-10g\t%g\n',1,sum(integral),nilai_eksak,error)
% toc

% % metode 1/3 simpson
% for i = 1:length(interval)
%     f_n(i) = y(interval(i));
%     if i > 1  & i < length(interval)& mod(i,2) == 0
%         f_n(i) = f_n(i)*4;
%     elseif i > 1  & i < length(interval)& mod(i,2) == 1
%         f_n(i) = f_n(i)*2;
%     end
%     integral = (h/3)*(f_n(1) + sum(f_n(2:end-1)) + f_n(end));
% end
% integral
% 
% % metode midpoint
% f_n = zeros(1,length(x));
% for i = 1:length(x)
%     if i < length(x)
%         new_x(i) = x(i) + (x(i+1) - x(i)) / 2;
%         f_n(i) = y(new_x(i));
%     end
%     integral = h*sum(f_n);
% end


% count = 1;
% num = 2;
% n = 60;
% Sn = (n/2)*(2 + (n-1))

%% FOOT NOTE 2 
% file_name = 'gauss_legendre.xlsm'; % file untuk menyimpan nama file dari nodes dan weigth pada metode gauss legendre
% sheet = 'Sheet1'; % sheet yang di panggil
% [col, txt, raw] = xlsread(file_name, sheet); % function untuk memanggil excel file
% x_nodes = col(:, 1); % mengambil nilai nodes pada file gauss legendre
% c_weigth = col(:, 2); % mengambil nilai weight pada file gauss legendre


% function [nodes, weight] = nodes_weight_gauss(n, u)
%     P = [1 u];
%     for i = 2:n
%         X = @(x) (1/x)*( (2*x-1)*u*P(i) - (x-1)*P(i-1));
%         P(i+1) = X(i);
%     end
%     
%     poly = fliplr(coeffs(expand(P(end))));
%     count = 1;
%     c = zeros(1,n);
%     for i = 1:n+1
%        if mod(i,2) == 1
%            c(i) = poly(count);
%            count = count + 1;
%        end
%        if mod(n,2) == 1
%           c(n+1) = 0; 
%        end
%     end
%     tic
%     dummy_nodes = roots(c);
%     toc
%     P_diff = diff( expand(P(end)) );
%     a = zeros(1,n);
%     b = zeros(1,n);
%     for i = 1:n
%        a(i) = 2 / ( (1-dummy_nodes(i)^2)*(subs(P_diff, u,dummy_nodes(i))^2) );
%        b(i) = dummy_nodes(i);
%     end
%     weight = vpa(a);
%     nodes = vpa(b);
% end
