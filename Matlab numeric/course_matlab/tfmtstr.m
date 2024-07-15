%% generic syntax
clear, clc

% bentuk umum untuk penggunaan format teks
% A = 5;
% teks_format = sprintf('nilai A = %d\n', A); % formating teks
% fprintf(teks_format);
% teks_format2 = fprintf('nilai A = %d\n', A);

A = 5;
B = 5.25;
C = 6.25;
D = 1000;
E = 23.4546543;

% umumnya ada 6 specifier data (d, f, g, e, c, s)
% d = decimal, f = fixed point, g = real number, e = exponensial
teks = fprintf('A = %d, B = %.2f, D = %g, F = %d , E = %e \n', A,B,C,D,E);


% specifier c dan s // c = char and s = string
karakter = 'Zetta';
karakter2 = 'Zetta';
teks_karakter = fprintf('karakter %c \n', karakter);
teks_karakter2 = fprintf('karakter2 %s \n', karakter2);


%% precision
clear, clc

data = pi;
teks_presisi = fprintf('nilai pi %.1f \n', data);

%% panjang data yang akan ditampilkan (bisa spasi atau juga nol)
clear, clc

data = pi;
teks_width = fprintf('nilai pi %07.2f \n', data);

%% flag berfungsi untuk bagaimana kita menampilkan data
clear, clc

% tanda + dan tanda -
teks_standard = fprintf('nilai pi adalah |%7.2f|\n', pi);

teks_plus = fprintf('nilai pi adalah |%+7.2f|\n', pi);
teks_minus = fprintf('nilai pi adalah |%-7.2f|\n', pi);

teks_plusstring = fprintf('rata kanan teks : |%-40s|\n', 'ini adalah teks dummy');

%% studi kasus
clear, clc

url = 'http://www.youtube.com/c/kelasterbuka';
sitename = 'kelas terbuka';

link = fprintf('<a href="%s">%s</a>\n', url, sitename);

%% studi kasus 2
clear, clc

x = linspace(-4, 4, 20);

disp('  y    |   x');
disp('-------|------');
for n = 1:length(x)
   y(n) = parabola(x(n));
   
   pause(.15)
   teks = fprintf('%5.2f, | %5.2f\n', y(n), x(n));
end

% plot(x,y)


function y = parabola(x)
    y = x^2;
end





















