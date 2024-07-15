clear, clc

r = 5;
posx = 0;
posy = 0;

[x1, y1] = tmod(r, posx, posy);
[x2, y2] = tmod(1, 2, 0);
[x3, y3] = tmod(1, -2, 0);

figure(1)
plot(x1, y1)
hold on
    plot(x2, y2)
    plot(x3, y3)
hold off