clc, clear

% METHODE JACOBI
    % keunggulan metode iteratif :
        % teknik iteratif jarang digunakan untuk menterlasikan SPL yang berukuran kecil. karena
        % metode perhitungan langsung lebih efisiesn dari pada metode
        % iteratif. akan tetapi untuk SPL yang berukuran besar metode
        % iteratif lebih efisien dari pada metode perhitungan langsung
        % dalam hal waktu komputasi
        
        
    % Metode jacobi
        % Prinsip dari metode ini adalah menyatakan setiap variable ke
        % dalam semua variable ke dalam semua variabel sisanya
        % 2x + y = 10; x = (10 - y) / 2
        
    % syarat kedua metode konvergen
        % metode jacobi dan gauss seidel konvergen untuk setiap SPL yang
        % memiliki matriks koefesien bersifat "dominan secara diagonal"
        % |a_i,i| > |a_i,j| + |a_i,j|; i = 1,2,3,4...n
        
N = 4;
A = zeros(N,N);
B = zeros(N,1);
P = zeros(N,1);

A(1,1:N) = [-4 0 1 3];
A(2,1:N) = [1 6 1 0];
A(3,1:N) = [0 1 6 1];
A(4,1:N) = [3 1 0 -3];
B(:) = [1 1 1 1];

max1 = 50; % iteration max
delta = 10^-7; % tolerance for P

% % fprintf('\n%-20s%-15s%-15s%-15s\n', 'P', 'x1', 'x2', 'iterasi')
for k=1:max1
   for j=1:N
      X(j) = (B(j) - A(j, [1:j-1, j+1:N]) * P([1:j-1, j+1:N])) / A(j,j);
   end
   fprintf('%13d\n', P)
   err = abs(norm(X'-P));
   relerr = err/norm(X);
   P=X';
   
   if relerr < delta; break ;end
end
X = X'


