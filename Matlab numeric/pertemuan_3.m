clear, clc

% methode iterative, introduction
% persamaan linear : bisa direpresentasikan dengan:
% Ax = B
% persamaan yang tidak linear :
% f(x) = 0
% contoh ax^2 + bx + c = 0


% Nemurical methode
    % iteration solving
        % fundamental principle in computer science anda numerical calculation
        % a process is repeated until an answer is achieved
        % in this topic, we study the process of iteration using repeated
        % substistution

        % contoh :
            % the function of g(x) is needed togerher with initial p_0
            % A sequence of (Pi) is generated
            % iterative rule : P_k+1 = g(P_k)

        % contoh :
            % p_0 = 1 and p_k+1 = 1.001 p_k

            % persamaan yang memilki sifat konvergen(semakin besar) pasti
            % memilki solusi sebaliknya divergen
    
    % fixed point if g(x) s real P such that  P = g(P)
    % deometrically,  its is a point of intersection of y = g(x) abd y = x
    
    % theorem 1
        % assume g is continue and (P_n|inf and n=0) is generated sequenced. if then P is fixed point
        
        % ant e.g:
            % consider P_0 P_k+1 = e^-Pk

    % theorem 2
    
    % langkah metode iterasi
        % define the function
        % define initial condition, P_1 = P_0
        % define tolerance and max iteration
        % calculate P_2 = g(P_1) or P_k = g(P_k-1)
        % calculate calculate relative errror between P_1 and P_2
        % if rel err < tol atau k > max iteration process is stopped

% Contoh kasus : g(x) = 1 + - x^2 with g'(x) = 1-x/2
% case P = 2
% start with = P_0 = 1.6


% since g'(x) < 1/2 on [1,3], by theorem 3, the sequence will converge to
% P = 2


% % latihan iterative method
% P_0 = 1.6; % nilai awal
% tol = 0.001; % error relative
% max_iter = 2; % maximum iterative
% g = [];
% 
% test = [P_0:tol:max_iter];
% 
% for n = 1:length(P_0:tol:max_iter)
%     g(n) = test(n)^2 
% end
% 


for n = 1:100
%     x(n) = n;
%     y(n) = x(n) ^ 2;
    y(n) = n.^2
end






