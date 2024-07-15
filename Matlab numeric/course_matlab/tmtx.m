clear, clc

% skalar
% a = 7

% vector
% b = [1,2,2,3,4,5,6,7] % vector kolom
% c = [1;2;3;4;45;6] % vektor baris

% Matrix
d = [1,2,3,4;1,2,7,8];
% d' % matriks transpose

% penjumlahan vector
a = [1:5];
b = [1:5];

% perkalian vector dot 
% dot(a,b)

% perkalian vector cross
e = [1:3];
f = [4:6];
% cross(e,f)

% penggabungan dua vektor
g = [e, f];
h = [b;a];

% MATRIKS
A = [1,2;3,4];
B = [5,6;7,8];

% INDEXING
% A(:,2) % row 1 column 2

% PERKALIAN MATRIKS
C = A*B;

% KUADRAT MATRIKS
D = A^2;

% PERKALIAN TERKORESPONDENSI SATU SATU
E = A.*B;

% MATRIKS INVERS
% A*X = C, CARI NILAI X
% LEFT DIVISON
X = A\C;

% RIGHT DIVISION
Y = C/B;



















































