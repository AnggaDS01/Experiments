clear, clc

file_name = 'data2.xlsx';
sheet = 'Sheet1';
range = 'A1:B50';

[num, txt, raw] = xlsread(file_name, sheet, range);

x = num(:, 1);
y = num(:, 2);

plot(x,y)

xlabel(txt(1));
ylabel(txt(2));