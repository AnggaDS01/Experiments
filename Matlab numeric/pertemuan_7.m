%% SISTEM PERSAMAAN LINEAR
clc, clear
n = 4;
A = zeros(n);
B = zeros(n,1);
X = zeros(n,1);

A(1,1:n) = [4, -1, 2, 3];
A(2,2:n) = [-2, 7, -4];
A(3,3:n) = [6, 5];
A(4,4:n) = [3];

B(:) = [20, -7, 4, 6];

X(n) = B(n)/A(n,n);

for k = n-1:-1:1
   X(k) =( B(k) - sum( A(k,k+1:end) .* X(k+1:end)' ) ) / A(k,k);
end

% for c=n-1:-1:1
%     X(c)=(B(c)-A(c,c+1:n)*X(c+1:n))/A(c,c)
% end

res = inv(A)*B;

A,B,X,res

%% LATIHAN
clc, clear

% INGREDIENTS
n = 4;
A = zeros(n);
B = zeros(n,1);
X = zeros(n,1);

% ASSIGN VALUE TO ARRAYS
A(1,1:n-3) = [5];
A(2,1:n-2) = [-1, 4];
A(3,1:n-1) = [3, -2, -1];
A(4,1:n-0) = [1, -2, 6, 3];

B(:) = [10, 5, 4, -2];

% INIT VALUE FOR X(1)
X(n-3) = B(n-3)/A(n-3);

% START PROBLEM SOLVING

% use - FOR LOOP
for k = n-2:n
   X(k) = (B(k) - sum(A(k,1:k-1) .* X(1:k-1)') ) / A(k,k);
end

% use - INV MATRIX
res = inv(A) * B;

% END PROBLEM SOLVING

% RESULT
A, B, X, res

%% LOGIC PROBLEM
clear, clc

% X(n-3) = B(n-3)/A(n-3);
% C = (B(2) - sum(A(2,1:1) .* X(1:1)') ) / A(2,2);
% X(n-2) = C;

% D = ( B(3) - sum(A(3,1:2) .* X(1:2)') ) / A(3,3);
% X(n-1) = D;
 
% E = ( B(4) - sum(A(4,1:3) .* X(1:3)') ) / A(4,4);
% X(n) = E;

% A,B,X






