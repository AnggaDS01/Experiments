%% PERSAMAAN DIFFERENTIAL PARTIAL (PERSAMAAN LAPLACE)
clc, clear, close all
% ==========================CONTOH KASUS===================================
% Misalnya kita dimintamensimulasikan distribusi panas pada lempengan logamberukuran 0, 5
% m x 0, 5 m. Temperatur pada 2 sisi tepi lempengan logam dijaga pada 0◦C, sementara pada 2
% sisi tepi lempengan logam yang lain, temperaturnya diatur meningkat secara linear dari 0◦C
% hingga 100◦C.
% ==========================SELESAI===================================
n = 9;

W = [
    75  75  75;  % [ w0_1  w0_2  w0_3 ]
    0   0   0;   % [ w1_0  w2_0  w3_0 ]
    50  50  50;  % [ w4_1  w4_2  w4_3 ]
    100 100 100; % [ w1_4  w2_4  w3_4 ]
];

A = gen_mat_A_pdp_eliptik(n);
B = gen_mat_B_pdp_eliptik(W(1,1), W(1,2), W(1,3), W(2,1), W(2,2), W(2,3), W(3,1), W(3,2), W(3,3), W(4,1), W(4,2), W(4,3));
C = [A B]; 

w = zeros(n,1);
% ================= UPPER TRIANGULAR ===================
for p=1:n-1
    for k = p+1:n
        m = C(k,p) / C(p,p);
        C(k,p:n+1) = C(k,p:n+1) - m*C(p,p:n+1);
    end
end

A = C(:, 1:end-1);
B = C(:,end);
w(n) = B(n)/A(n,n);

% ================= BACKWARD SUBSTITUTION ===================
if eq(isnan(w(n)), 1)
    w(n) = 0;
else
    for k = n-1:-1:1 
        w(k) = ( B(k) - sum( A(k ,k+1:end) .* w(k+1:end)' ) ) / A(k,k);
    end
end

count = 1;
for i = 1:length(w)/3
   for j = length(w)/3:-1:1
       K(j,i) = w(count);
       count = count + 1;
   end
end
K
%% KONDUKSI PANAS(PDP PARABOLIK)
clear, clc, close all
% Nama: Angga Dwi Sunarto
% Nim: 24040119140105

% ==========================CONTOH KASUS===================================
% Sebuah elemen batang aluminium tipis sepanjang 10 cm memiliki nilai karakteristik
% k’ = 0.49 kal/(s.cm.0C), C = 0.2174 kal/(gr.0C) dan ρ = 2.7 gr/cm3. Dengan mengambil
% Δx = 2cm dan Δt = 0.1s, serta diketahui pada waktu t = 0s, temperatur batang = nol,
% dan kondisi batas dijaga tetap, yaitu T(0) = 100 0C dan T(10) = 50 0C. Hitunglah
% distribusi temperatur dalam batang setelah 1s.
% ==========================SELESAI===================================

delta_x = 2; %cm
x = 10;% cm
t = 10;% sekon
delta_t = zeros(1,round(x/delta_x)+1);
t_total = t; % sekon
delta_t(1) = 1;% sekon

kk = 0.49;% kal/(s.cm.0C)
rho = 2.7;% gr/cm^3
C = 0.2174;% kal/gr.0C
k = kk/(rho*C); % cm^2/s

% Cek Syarat 
C = (delta_x^2)/(2*k);
lambda = (k*delta_t(1))/delta_x^2;

T_awal = zeros(1,(floor(x/delta_x)+1));
T_awal(1) = 100;
T_awal(end) = 50;

T = zeros((floor(t/delta_t(1)))+1, length(T_awal));
T(1,:) = T_awal;
T(:,1) = T_awal(1);
T(:,end) = T_awal(end);

i = 1;
if delta_t(1) <= C && lambda < 1/2
    while delta_t <= t_total
       for j=1:length(T_awal)
            if j > 1 && j < length(T_awal)
               T(i+1,j) = T(i,j) + lambda*(T(i,j+1) - 2*T(i,j) + T(i,j-1));
            end
       end

       i = i+1;
       if T(i,1) == 0 && T(i,end) == 0
            T(i,1) = T(i-1,1) + lambda*(T(i-1,2) - 2*T(i-1,1) + T(i-1,1));
            T(i,end) = T(i-1,end) + lambda*(T(i-1,end) - 2*T(i-1,end) + T(i-1,end-1));
       end
       delta_t(i) = delta_t(1)*i;
    end
    
    xx = linspace(0, x, length(T_awal));
    plot(xx,T(10,:))
    T
    hold on
    for k=2:length(T)
        plot(xx, T(k,:))
    end
    hold off
else
    disp('Δt atau λ tidak memenuhi syarat, silakan cek lagi!!')
end


%% PERSAMAAN GELOMGANG (PDP HIPERBOLIK)
clear, clc, close all
% Nama: Angga Dwi Sunarto
% Nim: 24040119140105
% TGS Bonus Fisika Matematika

% ==========================CONTOH KASUS===================================
%   Sebuah senar panjang 80 cm dengan berat 1,0 g. Senar direntangkan
% dengan gaya tarik 40000g. Pada jarak 20 cm dari ujung , senar ditarik
% hingga 0.6 cm dari kedudukan semula dan kemudian dilepaskan. Hitung
% perpindahan yang terjadi sepanjang senar sebagai fungsi waktu? Berapa
% waktu yang diperlukan senar untuk menjalani satu siklus penuh? Hitung pula
% frekuensi getaran dari senar (ambil Δx = 10 cm)
% ==========================SELESAI===================================

y0 = 0.6; % (cm) tinggi awal pada saat senar ditarik
x0 = 20; % (cm) jarak senar ditarik pada jarak x0 dari titik awal pengukuran yaitu nol
x = 80; % (cm) total panjang senar
delta_x = 10; % (cm) beda jarak antara titike pengukuran sekarang dan selanjutnya

T = 40000; % gram
g = 980; % cm/s^2
w = 1/80; % gram/cm (linear mass density)
delta_t = sqrt((delta_x^2 * w)/ (T*g)); % mencari nilai Δt
gx = 5; % kecepatan awal (cm/s) pada t = 0

% ================== PROGRAM UTAMA ==================
tic
y_awal = generate_y_awal_pdp_hiperbolik(y0, x0, x, delta_x); % nilai y awal
Y(1,:) = y_awal; % memasukkan nilai y_awal pada baris pertama matriks Y

i = 1; 
col = find(Y(1,:)==y0); % menemukan index dari nilai y0 pada matriks Y
Y_icol = ""; % untuk menyimpan nilai matriks Y dengan baris ke i dan colomn ke col yang diubah ke string
Y_1col = sprintf('%.4f', Y(1,col)); % untuk menyimpan nilai matriks Y dengan baris ke 1 dan colomn ke col yang diubah ke string
while ~isequal(Y_icol,Y_1col) % hal ini dilakukan untuk mendapatkan 1 siklus (jika variabel Sum tidak sama dengan jumlah pada matriks Y dengan baris ke i maka jalankan program dibawahnya)
    for j = 1:length(y_awal)
       if j > 1 && j < length(y_awal) % pengkondisian jika j > 1 dan j < panjang dari array y_awal jalankan perintah dibawahnya
         if i < 2 % pengkondisian jika i < 2
            Y(2,j) = 1/2*(Y(1,j+1) + Y(1,j-1)) + gx*delta_t; % persamaan untuk mendapatkan nilai pada baris kedua
         else
            Y(i+1,j) = Y(i,j+1) + Y(i,j-1) - Y(i-1,j); % persamaan untuk mendapatkan nilai pada baris > 2
         end
       end
   end
   i=i+1; % increment nilai i
   Y_icol = sprintf('%.4f', Y(i,col)); % mengubah nilai matriks Y baris ke "i" dan colom ke "col" menjadi string
end

% ==================== menampilkan hasil ==============================
fprintf('\tt\t0cm\t   10cm\t\t 20cm\t   30cm\t\t 40cm\t   50cm\t\t 60cm\t   70cm\t\t  80cm\n')
disp('____________________________________________________________________________________________') 
for l = 1:length(Y(:,1))
   disp(Y(l,:)) 
end
disp('____________________________________________________________________________________________') 

f_num = 1/((length(Y)-1)*delta_t); % f numerik (frekuensi dihitung dengan cara numerik)
f_eksak = sqrt((T*g)/w)/(2*x); % f eksak (frekuensi dihitung dengan cara eksak)
disp('__________________________________')
fprintf('\tf_eksak\t\tf_numerik(1/%dΔt)\n',length(Y)-1)
disp('__________________________________')
fprintf('\t %g\t\t  %g\n', f_eksak, f_num)
disp('__________________________________')
toc

xx = 0:delta_x:x;
plot(xx, Y(1,:))
hold on
    for i = 2:length(Y)
       plot(xx, Y(i,:)) 
    end
hold off

%% FUNCTION PDB ELIPTIK
% function [AA, BB, w] = pdb_eliptik(n, w_bawah, w_kiri, w_atas, w_kanan) 
%     AA = gen_mat_A(n);
%     BB = gen_mat_B(w_bawah, w_kiri, w_atas, w_kanan);
%     C = [AA BB]; 
%     w = gauss_elimination(C, n);
% 
%     function w = gauss_elimination(mat_AB, n)
%         w = zeros(n,1);
%         % ================= UPPER TRIANGULAR ===================
%         for p=1:n-1
%             for k = p+1:n
%                 m = mat_AB(k,p) / mat_AB(p,p);
%                 mat_AB(k,p:n+1) = mat_AB(k,p:n+1) - m*mat_AB(p,p:n+1);
%             end
%         end
% 
%         A = mat_AB(:, 1:end-1);
%         B = mat_AB(:,end);
%         w(n) = B(n)/A(n,n);
% 
%         % ================= BACKWARD SUBSTITUTION ===================
%         if eq(isnan(w(n)), 1)
%             w(n) = 0;
%         else
%             for k = n-1:-1:1 
%                 w(k) = ( B(k) - sum( A(k ,k+1:end) .* w(k+1:end)' ) ) / A(k,k);
%             end
%         end
%     end
%     function A = gen_mat_A(n)
%         W = zeros(n,n);
%         count = 0;
%         for i = 1:n
%             count = count + 1;
%             W(i,i) = 4;
%             W(i,i+3) = -1;
%             W(i+3,i) = -1;
%             if count == 3
%                 count = 0;
%                 W(i,i+1) = 0;
%                 W(i+1,i) = 0;
%             else
%                 W(i,i+1) = -1;
%                 W(i+1,i) = -1;
%             end
%         end
%         A = W(1:n,1:n);
%     end
%     function B = gen_mat_B(w_bawah, w_kiri, w_atas, w_kanan)
%         w11 = w_kiri + w_bawah;
%         w21 = w_bawah;
%         w31 = w_bawah + w_kanan;
%         w12 = w_kiri;
%         w22 = 0;
%         w32 = w_kanan;
%         w13 = w_kiri + w_atas;
%         w23 = w_atas;
%         w33 = w_kanan + w_atas;
%         B = [w11; w21; w31; w12; w22; w32; w13; w23; w33];
%     end
% end
% MANUAL VALUE INPUT
% A(1,:) = [ 4 -1  0 -1  0  0  0  0  0];
% A(2,:) = [-1  4 -1  0 -1  0  0  0  0];
% A(3,:) = [ 0 -1  4  0  0 -1  0  0  0];
% A(4,:) = [-1  0  0  4 -1  0 -1  0  0];
% A(5,:) = [ 0 -1  0 -1  4 -1  0 -1  0];
% A(6,:) = [ 0  0 -1  0   -1  4  0  0 -1];
% A(7,:) = [ 0  0  0 -1  0  0  4 -1  0];
% A(8,:) = [ 0  0  0  0 -1  0 -1  4 -1];
% A(9,:) = [ 0  0  0  0  0 -1  0 -1  4];
% B(:) = [75; 0; 50; 75; 0; 50; 175; 100; 150];
% END MANUAL VALUE INPUT









