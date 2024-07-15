function [x, y] = tmod(r, posx, posy)
% LINGKARAN adalah fungsi untuk membuat lingkaran
%     [x, y] = lingkaran(r, posx, posy)
%     
%     r = radius
%     posx = adalah titik pusat x_0
%     posy = adalah titik pusat y_0

    theta = linspace(0, 2*pi, 100);
    x = r*cos(theta) + posx;
    y = r*sin(theta) + posy;
    
end