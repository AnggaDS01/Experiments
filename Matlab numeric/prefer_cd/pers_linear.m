%% INGREDIENTS
clc, clear, format short
N = 3; % shape of matrix
A = zeros(N); % define the matrix A
B = zeros(N,1); % define the matrix B

A(1,1:N) = [ 1  1  1]; % [ 4 -1 1]
A(2,1:N) = [ 1  2  4]; % [ 4 -8 1]
A(3,1:N) = [ 1  3  9]; % [ -2 1 5]
B(:) = [1; -1; 1]; % [ 7 -21 15 ]

C = [A,B];

Imax=100; % maximum iteration
Tol=10^-10; % tolerance of XS and XJ

switching = 1; % toggle for gauss elimination, just has 2 values, that is (0, 1)
               % 0 = for LOWER TRIANGULAR
               % 1 = for UPPER TRIANGULAR
%% METODE GAUSS
if eq(switching,1)
    disp('METODE ELIMINASI GAUSS (UPPER TRIANGULAR)')
    disp('_________________________________________')
    disp(C)
    disp('_________________________________________')
    for p=1:N-1
        for k = p+1:N
            m = C(k,p) / C(p,p);
            C(k,p:N+1) = C(k,p:N+1) - m*C(p,p:N+1);
            disp('_________________________________________')
            disp(C)
            disp('_________________________________________')
        end
    end
elseif eq(switching,0)
    disp('METODE ELIMINASI GAUSS (LOWER TRIANGULAR)')
    disp('______________________________________________________')
    disp(C)
    for k = N-1:-1:1
        for l = 1:k
              t = C(l, k+1) / C(l+1, k+1);
              C(l,1:N+1) = C(l,1:N+1) - t*C(l+1,1:N+1);
              disp('______________________________________________________')
              disp(C)
              disp('______________________________________________________')
        end
    end
end
%% METODE BACK SUBTITUTION DAN FORWARD SUBSTITUTION
Z = C(:,end);
Y = C(:, 1:end-1);
Q = zeros(N,1);

if eq(switching, 1)
    disp('BACKWARD SUBSTITUTION')
    Q(N) = Z(N)/Y(N,N);
    if eq(isnan(Q(N)), 1) ; Q(N) = 0 ;end

    for k = N-1:-1:1 
        Q(k) = ( Z(k) - sum( Y(k ,k+1:end) .* Q(k+1:end)' ) ) / Y(k,k);
    end
    disp('_________________________________________')
    disp(Q)
    disp('_________________________________________')
    disp('hasil akhir =')
    for z=1:N
        fprintf('X%d= %10.7f\n',z,Q(z))
    end
    disp('___________________________________________________')
elseif eq(switching, 0)
    disp('FORWARD SUBSTITUTION')
    if Y(1) == 0; Q(1) = 0; else; Q(1) = Z(1)/Y(1); end
    for k = 2:N
       Q(k) = (Z(k) - sum( Q(1:k-1)'.* Y(k,1:k-1)) ) / Y(k,k);
    end
    disp('_________________________________________')
    disp(Q)
    disp('_________________________________________')
    disp('hasil akhir =')
    for z=1:N
        fprintf('X%d= %10.7f\n',z,Q(z))
    end
    disp('___________________________________________________')
end
%% METODE GAUSS SEIDEL
disp('METODE GAUSS SEIDEL')
% DEFINISI NILAI X
XS=zeros(N,1);
% MENAMPILKAN NILAI X
disp('___________________________________________________')
fprintf('  i  ')
for p=1:N
    fprintf('X%d\t\t\t',p)
end
fprintf('ERROR\n')
disp('___________________________________________________')
for kS=1:Imax
    xinit=XS;
    for i=1:N
        Tot=Tol;
        for j=1:N            
            if i~=j
                Tot=A(i,j)*XS(j)+Tot;
            end
        end
        ZB(i) = XS(i);
        XS(i)=(B(i)-Tot)/A(i,i);
        ZA(i) = XS(i);        
%         fprintf('Err(X%d) = %d\n',i,abs(ZA(i)-ZB(i)))
    end
    ErrorS=norm(abs(xinit-XS));
    fprintf('%3d ',kS)
    for p=1:N 
        fprintf('%10.7f ',XS(p))
    end
    fprintf('%10.7f\n\n',ErrorS)
    if abs(xinit-XS)<Tol 
        break; 
    end
end
disp('___________________________________________________')
disp('hasil akhir =')
fprintf('pada iterasi ke-%d\n',kS)
for z=1:N
    fprintf('X%d= %10.7f\n',z,XS(z))
end
disp('___________________________________________________')

%% METODE JACOBI
disp('METODE JACOBI')
% DEFINISI NILAI X
XJ=zeros(N,1);
% MENAMPILKAN NILAI X
disp('___________________________________________________')
fprintf('  i  ')
for p=1:N
    fprintf('X%d\t\t\t',p)
end
fprintf('ERROR\n')
disp('___________________________________________________')
for kJ=1:Imax
    xinit=XJ;
    for i=1:N
        Tot=Tol;
        for j=1:N
            if i~=j
                Tot=A(i,j)*xinit(j)+Tot;
            end
        end
        JB(i) = XJ(i);
        XJ(i)=(B(i)-Tot)/A(i,i);
        JA(i) = XJ(i);        
%         fprintf('Err(X%d) = %d\n',i,abs(JA(i)-JB(i)))
    end
    ErrorJ=norm(abs(xinit-XJ));
    fprintf('%3d ',kJ)
    for p=1:N
        fprintf('%10.7f ',XJ(p))
    end
    fprintf('%10.7f\n\n',ErrorJ)
    if abs(xinit-XJ)<Tol
        break
    end
end
disp('__________________________________________________')
disp('hasil akhir=')
fprintf('pada iterasi ke-%d\n',kJ)
for z=1:N
    fprintf('X%d=%10.6f\n',z,XJ(z))
end
disp('___________________________________________________')

%% FOOT NOTE
clc, clear, syms x
% for n = 10:-1:1
%    disp(n)
% end

% LOWER TRIANGULAR
% for k = N-1:-1:1
%     for l = 1:k
%           t = C(l, k+1) / C(l+1, k+1);
%           if t == inf
%              t = C(l, k+1) / C(3, k+1);
%              C(l,1:N+1) = C(l,1:N+1) - t*C(3,1:N+1);
%              z = C(l+2, k+1);
%           end
%           z = C(3, k+1);
%           x = C(l, k+1);
%           C(l,1:N+1) = C(l,1:N+1) - t*C(l+1,1:N+1);
%           disp(C)
%           disp([z x t])
%     end
%     disp(C)
% end




