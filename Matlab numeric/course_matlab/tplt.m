clear, clc

x = linspace(0, 2*pi, 100);
y1 = sin(x);
y2 = sin(x + .5);
y3 = sin(x + 1);
y5 = sin(2*x)
y4 = cos(x);
y6 = cos(2*x + 1)

% % plot single line
% figure(1)
% plot(x,y1)
% 
% % plot multilines
% figure(2)
% plot(x,y1, x,y4)
% 
% % plot multi lines dengan warna custom
% figure(3)
% plot(x,y1,'b', x,y2,'y', x,y3,'g');

% plot multi lines dengan warna dan tipe garis
% figure(4)
subplot(2, 2, 1)
plot(x,y1,'b--', x,y2,'r-', x,y3,'g:.');
axis([0 2*pi -2 2]);
title('plot sin(x)');
xlabel('radiant');
ylabel('magnituda');



% SUB PLOT
% hold on

subplot(2, 2, 2)
plot(x, y5, 'ko')
subplot(2, 2, 3)
plot(x, y4, 'c-')
subplot(2, 2, 4)
plot(x, y6, 'Color', [0 0 1])

% hold off















