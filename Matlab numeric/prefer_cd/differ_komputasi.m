%% TGS2 FISIKA KOMPUTASI
clear, clc
% Nama : Angga Dwi Sunarto
% Nim : 24040119140105
% Tugas 2 : Fisika Komputasi

% penjelasan Program Differensial:
% program ini merupakan program untuk melakukan perhitungan secara komputasi dengan pendekatan numerik
% methode yang digunakan pada program ini adalah :
    % Symmetric Difference dengan persamaan, f' = (f_1 - f_-1) / 2*h,
    % Forward Difference dengan persamaan, f' = (f_1 - f_0) / h
    % Backward Difference dengan persamaan, f' = (f_0 - f_1) / h
    % Double Precision dengan persamaan, f' = (1/12*h)( f_-2 - 8*f_-1 + 8*f_1 + f_2 )

fx = @(x) x^2; % input fungsi yang ingin dicari hasil dari differensial-nya 
                         % note: saya menggunakan function handle yang
                         % memiliki notasi @('symbol')
x0 = 3; % variable untuk persamaan atau fungsi yang ingin di turunkan terhadap x
eksak = 78; % nilai dari perhitungan eksak dengan penurunan langsung
h(1) = 0; % nilai awal untuk h atau step yang ingin diberikan pada fungsi yang diketahui
% tol = 0.5; % toleransi yang diberikan atau step yang ingin di buat dalam proses perhitungan (sebagai h dalam persamaan exact)
tol = 0.001; 

methode = 'forward difference'; % variable ini adalah sebagai pengendali dari methode yang ingin digunakan
                                % yakni ada beberapa methode yaitu: 
                                    % symmetric difference,
                                    % forward difference,
                                    % backward difference,
                                    % double precision
                                % perlu diingat bahwa value dari variable methode
                                % harus specific sehingga jika ingin
                                % mengurangi kesalahan dalam penamaan di
                                % sarankan cukup 'copy and paste'
fprintf('i | eksak\t | numeric\t | error\n')
fprintf('_________________________________________\n')
for i=2:10 % lakukan iterasi dari 2 sampai 10
    % pada proses looping disini saya memberikan conditional statement seperti if, else if, menjadi flowcontrol dari jalannya program 
    % strcmp merupakan operasi komparasi untuk string misal : 'A' == 'A'
    
    h(i) = h(i-1)+tol; % assign nilai baru setiap looping yaitu i pada h
    if strcmp(methode ,'symmetric difference') % jika variable methode sama dengan 'symmetric difference' maka jalan kan program selanjutnya, jika tidak maka skip
        diff = ( fx(x0+h(i)) - fx(x0-h(i)) ) / (2*h(i)); % persamaaan methode symmetric difference dalam komputasi
    elseif strcmp(methode,'forward difference') % jika variable methode sama dengan 'forward difference' maka jalan kan program selanjutnya, jika tidak maka skip
        diff = ( fx(x0+h(i)) - fx(x0) ) / (h(i) ); % persamaaan methode forward difference dalam komputasi
    elseif strcmp(methode,'backward difference') % jika variable methode sama dengan 'backward difference' maka jalan kan program selanjutnya, jika tidak maka skip
        diff = ( fx(x0) - fx(x0-h(i)) ) / (h(i) ); % persamaaan methode backward difference dalam komputasi
    elseif strcmp(methode,'double precision') % jika variable methode sama dengan 'double precision' maka jalan kan program selanjutnya, jika tidak maka skip
        diff = ( 1/( 12*h(i)) )*( fx(x0-2*h(i)) - 8*fx(x0-h(i)) + 8*fx(x0+h(i)) - fx(x0+2*h(i)) ); % persamaaan methode double precision dalam komputasi
    end
    error(i) = abs(diff-eksak)*100/diff; % error yang didapatkan saat proses perhitungan dalam iterasi
    fprintf('%g | %g\t\t | %-9g | %g%%\n',i-1,eksak, diff, error(i)) % print out nilai dari variable diff dan error pada hasil iterasi
end
fprintf('_________________________________________\n')

plot(h, error,'r--'); % membuat plot pada matlab
grid() % membuat grid atau garis kotak kotak pada axes
title('Grafik Error Derivatif dari f=2*x^3+4*x^2+6'); % menambahkan judul pada figure
xlabel('h'); % menambah label pada sumbu x
ylabel('error'); % menambah label pada sumbu x
legend('garis yang dibentuk dari h terhadap error'); % menambahkan keterangan dari line chart

%% METODE SYMMETRIX DIFFERENCE
clear, clc, syms x

n = 3;
fx = @(x) 8*x^2 + x^2;
x0 = 1;
eksak = str2func(['@(x)' char(diff(fx(x)))]);
h = [0 zeros(1,n-1)]
tol = 0.1;

disp('METODE SYMMETRIX DIFFERENCE')
disp('____________________________________________________________')
fprintf('i\t | eksak | numeric\t | f(x+h) | f(x-h) | error\n')
disp('____________________________________________________________')
for i = 2:n+1
   h(i) = h(1) + (i-1)*tol;
   diff = ( fx(x0+h(i)) - fx(x0-h(i)) ) / (2*h(i));
   error(i) = abs(diff-eksak(x0))*100/diff;
   fprintf('%g\t | %g\t | %-9g | %5g  | %5g  | %g%%\n',i-1,eksak(x0), diff, fx(x0+h(i)), fx(x0-h(i)),error(i))
end
disp('____________________________________________________________')

plot(h, error,'r--'); % membuat plot pada matlab
grid() % membuat grid atau garis kotak kotak pada axes
title('Grafik Error Derivatif dari f=2*x^3+4*x^2+6'); % menambahkan judul pada figure
xlabel('h'); % menambah label pada sumbu x
ylabel('error'); % menambah label pada sumbu x
legend('garis yang dibentuk dari h terhadap error'); % menambahkan keterangan dari line chart

%% METODE FORWARD DIFFERENCE
clear, clc, syms x

n = 10;
fx = @(x) 2*x^2+5*x;
x0 = 1;
eksak = str2func(['@(x)' char(diff(fx(x)))]);
h(1) = 0.01;

disp('METODE FORWARD DIFFERENCE')
disp('____________________________________________________________')
fprintf('i\t | eksak | numeric\t | fx(x0+h(i) | f(x-h) | error\n')
disp('____________________________________________________________')
for i = 2:n+1
   h(i) = h(1)*(i-1);
   diff = ( fx(x0+h(i)) - fx(x0) ) / (h(i) );
   error(i) = abs(diff-eksak(x0))*100/diff;
   fprintf('%g\t | %g\t | %-9g | %5g\t  | %-5g  | %g%%\n',i-1,eksak(x0), diff, fx(x0+h(i)), fx(x0),error(i))
end

disp('____________________________________________________________')
plot(h, error,'r--'); % membuat plot pada matlab
grid() % membuat grid atau garis kotak kotak pada axes
title('Grafik Error Derivatif dari f=2*x^3+4*x^2+6'); % menambahkan judul pada figure
xlabel('h'); % menambah label pada sumbu x
ylabel('error'); % menambah label pada sumbu x
legend('garis yang dibentuk dari h terhadap error'); % menambahkan keterangan dari line chart

%% METODE BACKWARD DIFFERENCE
clear, clc, syms x

n = 10;
fx = @(x) 2*x^2+5*x;
x0 = 1;
eksak = str2func(['@(x)' char(diff(fx(x)))]);
h(1) = 10;

disp('METODE BACKWARD DIFFERENCE')
disp('____________________________________________________________')
fprintf('i\t | eksak | numeric\t | fx(x0+h(i) | f(x-h) | error\n')
disp('____________________________________________________________')
for i = 2:n+1
   h(i) = h(1)*(i-1);
   diff = ( fx(x0) - fx(x0-h(i)) ) / (h(i) );
   error(i) = abs(diff-eksak(x0))*100/diff;
   fprintf('%g\t | %g\t | %-9g | %-5g  | %-5g  | %g%%\n',i-1,eksak(x0), diff, fx(x0), fx(x0-h(i)),error(i))
end
disp('____________________________________________________________')

plot(h, error,'r--'); % membuat plot pada matlab
grid() % membuat grid atau garis kotak kotak pada axes
title('Grafik Error Derivatif dari f=2*x^3+4*x^2+6'); % menambahkan judul pada figure
xlabel('h'); % menambah label pada sumbu x
ylabel('error'); % menambah label pada sumbu x
legend('garis yang dibentuk dari h terhadap error'); % menambahkan keterangan dari line chart

%% METODE DOUBLE PRECISION
clear, clc, syms x

n = 10;
fx = @(x) 2*x^2+5*x;
x0 = 1;
eksak = str2func(['@(x)' char(diff(fx(x)))]);
h(1) = 10;

disp('METODE DOUBLE PRECISION')
disp('________________________________________________________________________')
fprintf('i\t | eksak | numeric\t | fx_-2  | fx_-1  | fx_1\t| fx_2\t | error\n')
disp('________________________________________________________________________')
for i = 2:n+1
   h(i) = h(1)*(i-1);
   diff = ( 1/( 12*h(i)) )*( fx(x0-2*h(i)) - 8*fx(x0-h(i)) + 8*fx(x0+h(i)) - fx(x0+2*h(i)) );
   error(i) = abs(diff-eksak(x0))*100/diff;
   fprintf('%g\t | %g\t | %-9g | %-5g  | %-5g  | %-5g  | %-5g  | %g%%\n',i-1,eksak(x0), diff, fx(x0-2*h(i)), fx(x0-h(i)), fx(x0+h(i)), fx(x0+2*h(i)), error(i))
end
disp('________________________________________________________________________')

plot(h, error,'r--'); % membuat plot pada matlab
grid() % membuat grid atau garis kotak kotak pada axes
title('Grafik Error Derivatif dari f=2*x^3+4*x^2+6'); % menambahkan judul pada figure
xlabel('h'); % menambah label pada sumbu x
ylabel('error'); % menambah label pada sumbu x
legend('garis yang dibentuk dari h terhadap error'); % menambahkan keterangan dari line chart