% generate_y_awal_pdp_hiperbolik adalah function yang digunakan untuk men-generate nilai y awal pada pengukuran untuk kasus PDP hiperbolik,
% pada function ini digunakan 4 parameter yaitu:
%     1. y0 adalah tinggi awal pada saat senar ditarik
%     2. x0 adalah jarak senar ditarik pada jarak x0 dari titik awal pengukuran yaitu nol
%     3. x adalah total panjang senar
%     4. delta_x adalah beda jarak antara titik pengukuran sekarang dan selanjutnya

function y = generate_y_awal_pdp_hiperbolik(y0, x0, x, delta_x)
    
    x1_1 = [0:delta_x:x0];
    y1 = zeros(1,length(x1_1)-1);
    for i = 1:length(x1_1)
       y1(i) =  y0 * x1_1(i) / x0;
    end

    x1_2 = [0:delta_x:x-x0];
    y2 = zeros(1,length(x1_2));
    for i = 1:length(x1_2)
       y2(i) =  y0 * x1_2(i) / (x-x0);
    end
    y = [y1(1:end-1) sort(y2, 'descend')];
end