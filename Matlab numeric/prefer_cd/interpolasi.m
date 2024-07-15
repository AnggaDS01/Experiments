clc, clear
% INGREDIENTS
% Known value of x and y
Xa = [1 3 5 7];
Ya = [-20 55 90 150];

Xb = [2 4 6]; % value of x want to find
n = length(Xa); % maximum iteration

F = 0; % initial value

% TO DO
for i = 1:n
    L = 1;
    for j = 1:n
        if i ~= j
            T = ((Xb-Xa(j))/(Xa(i)-Xa(j)));
            disp(Xb-Xa(j));
            L = L.*T;
        end
    end
    F=F+Ya(i)*L;
end
fprintf('\n');
% % PRINT THE RESULT
% disp(Xb)
% disp(F)
% disp('__________________________________________')
% fprintf('Hasil Interpolasi :\n\n')
% for p = 1:length(F)
%    fprintf('Dengan Nilai X = %g maka Y = %g \n',Xb(p), F(p)) 
% end
% disp('__________________________________________')

%%
Xa = [1 3 5 7];
Ya = [-20 55 90 150];

Xb = [2 4 6]; % value of x want to find
n = length(Xa); % maximum iteration

F = 0; % initial value

% TO DO
for i = 1:n
   for j = 1:n
       if i ~= j
        disp(Xa(j));
       end
   end
end


