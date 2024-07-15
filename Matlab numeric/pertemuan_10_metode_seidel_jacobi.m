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

%% metode gauss seidel

clc, clear

N = 3;

A = zeros(N,N); % determine matrix A
B = zeros(N,1); % determine matrix B
P = zeros(N,1); % initial value
A(1,1:N) = [9, -3,  1];
A(2,1:N) = [1,  9,  1];
A(3,1:N) = [1,  0,  9];
B(:) = [1; 1; -1;];

max1 = 50; % max itetation 
tol = 10^-7; % tolerance of P

fprintf('%-16s%-16s%-17s%-17s','x1','x2','x3','x4')
fprintf('______________________________________________________\n')
for k=1:max1
    for j=1:N
        if j == 1
            X(1) = ( B(1) - A(1,2:N)*P(2:N)) / A(1,1);
        elseif j == N
            X(N) = ( B(N) - A(N,1:N-1)*(X(1:N-1))' ) / A(N,N);
        else
            X(j) = ( B(j) - sum([ A(j,1:j-1)*X(1:j-1)' A(j,j+1:N)*P(j+1:N)]) ) / A(j,j);
%             X(j) = ( B(j) - A(j,1:j-1)*X(1:j-1)' - A(j,j+1:N)*P(j+1:N) ) / A(j,j);
        end
    end
    relerr = abs(norm(X'-P))/norm(X);
    P = X';
    fprintf('%e\t',P)

    if(relerr < tol); break; end
end
fprintf('______________________________________________________\n\n')
A, B, P;


%%
clc, clear
N = 4;
j = 2;
k = 3;

A = zeros(N,N); % determine matrix A
B = zeros(N,1); % determine matrix B
P = zeros(N,1); % initial value
A(1,1:N) = [4 1 1 2];
A(2,1:N) = [0 6 2 3];
A(3,1:N) = [1 2 8 4];
A(4,1:N) = [1 1 2 3];
B(:) = [9 18 29 4];
P(:) = [0 0 0 0]; 

X(1) = ( B(1) - A(1,2:N)*P(2:N) ) / A(1,1);
X(j) = ( B(j) - A(j,1:j-1)*X(1:j-1)' - A(j,j+1:N)*P(j+1:N) ) / A(j,j);
X(k) = ( B(k) - A(k,1:k-1)*X(1:k-1)' - A(k,k+1:N)*P(k+1:N) ) / A(k,k);
X(N) = ( B(N) - A(N,1:N-1)*(X(1:N-1))' ) / A(N,N);

x2 = ( B(k) - sum([ A(k,1:k-1)*X(1:k-1)' A(k,k+1:end)*P(k+1:end) ]) ) / A(k,k);

A; B; X;

%%
clear, clc
N = 3;

A = zeros(N,N); % determine matrix A
B = zeros(N,1); % determine matrix B
P = zeros(N,1); % initial value

A(1,1:N) = [4 1 1];
A(2,1:N) = [0 6 2];
A(3,1:N) = [1 2 8];
B(:) = [9 18 29]; 
P(:) = [0 0 0];

% x1 = B(1) -  / A(1,1)
% 
% x1 = ( B(1) - sum(A(1,2:end).*P(2:end)') ) / A(1,1);
% P(1) = x1;
x2 = [A(2,1:2-1) A(2,2+1:end)]

C = A(1,1:end);
% x1 = C(C ~= A(1,1)).*P(1:end-1)'

A,B,P
