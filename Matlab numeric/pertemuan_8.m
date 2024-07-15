% pertemuan 8 ELIMINASI GAUSS
clear, clc

% MATRIKS RULE :
    % consider the linear system :
        % A + B + C = 1
        % A + 1B + 4C = -1
        % A + 3B + 9C = 1
        
    % can U bring the above system into the tiangular form?
    % By subtracting the second and third eq. by first eq :
        % A + B + C = 1
        % B + 3C = -1
        % 2B + 8C = 0
        
    % As we see, the 'A' is eliminated from second and third equations :
        % Next, the new third eq is subtracted by the new second eq
        % multiply by 2 :
            % A + B + C = 1
            % B + 3C = -2
            % 2C = 4
        
        % Then, we can solve it by applying back subsitution.
            
    % Other Example :
        % Previous example is 'easy' to solve. Let consider the problem :
           % x1 + x2 + x3 + 4.x4 = 13
           
       % Augmented Matrix
            % the augmented matrix of linear system AX = B is denoted [A|B]
            % Hence, the augmented matrix fom the example is
            
             %| 1 2 1 4 | 13 |
             %| 2 0 4 3 | 28 |
             %| 1 2 1 4 | 13 |
             %| 1 2 1 4 | 13 |
             %| 1 2 1 4 | 13 |

       % The tiangular can be obtained by determine the pivotal elment and
       % then using replacement formula :
            % row'_r = row_r - m_rp * row_p
            
            % first step :
                % pivot --> | 1  2   1   4  |  13 |
                % m_21  --> | 0 -4   2  -5  |   2 |
                % m_31  --> | 0 -6  -2  -15 | -32 |
                % m_41  --> | 0  7   6   14 |  45 |
       
       % Process
            % Input :
                % 1. Determine matrix A
                % 2. Determine matrix A
                % 3. Augmented A & B
                
            % Process :
                % 1. Calculating factor
                % 2. Eliminating matrix component
            
            
%% Soal no 2
clc, clear

n = 4;
A = zeros(n);
B = zeros(n,1);
A(1,1:n) = [4,8,4,0];
A(2,1:n) = [1,5,4,-3];
A(3,1:n) = [1,4,7,-3];
A(4,1:n) = [3,15,12,-9];

B(:) = [8;-4;-10;-12];

C = [A,B];

for p=1:n-1
    for k = p+1:n
        m = C(k,p) / C(p,p);
        C(k,p:n+1) = C(k,p:n+1) - m*C(p,p:n+1);
    end
end

X = C(:,end);
Y = C(:, 1:end-1);
Z = zeros(n,1);

Z(n) = X(n)/Y(n,n);
if isnan(Z(n)) == 1; Z(n) = 0 ;end
for k = n-1:-1:1 
    Z(k) = ( X(k) - sum( Y(k ,k+1:end) .* Z(k+1:end)' ) ) / Y(k,k);
end

Y, Z
%% TEST
clear, clc, syms a b c d e f g h i j k l m n o p q r s t

A = [a,b,c,d ; f,d,g,h ; i,j,k,l ; m,n,o,p]
B = [q ; r ; s ; t]

X = [A,B]

Y = rref(X)


%%
clc, clear

n = 1000;

p = 1;
q = 0;
r = n-1;
s = p+1;
t = p+1;
u = 0;
v = (n^2 - n) / 2;
disp(v)
disp(floor(v/4))
tic
disp('while loop')
while u < floor(v/4)
    if q == r
        p = p + 1;
        r = r - 1;
        q = 0;
    end
    
%     disp([p,s]);
    Y(u+1) = 1;
    if s == n
        s = t;
        t = t + 1;
    end
    s = s + 1;
    q = q + 1;
    u = u + 1;
end
toc


tic
disp('for loop')
for p=1:n-1
    for k = p+1:n
%         disp([p,k]);
        X(p) = k;
    end
end
toc


