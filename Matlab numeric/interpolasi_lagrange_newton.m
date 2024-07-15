clc, clear

x = [ 1 4 6 8];
y = [ 0 1.386294 1.79176 2.23451];
n = length(x);


xp = 5;
sm = 0;
for k = 1:n
    pr = 1;
   for l = 1:n
        if l~=k
            pr = pr*(xp - x(l)) / (x(k) - x(l));
        end
   end
   sm = sm+y(k)*pr;
end

yp = sm