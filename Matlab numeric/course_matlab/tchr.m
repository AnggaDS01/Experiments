clc, clear

% membuat string/char
huruf = 'abcdefghijkl';
huruf2 = "abcdefghijkl";

% indexing => '' ~== ""
l = huruf(length(huruf));

% mapping
l_ascii = uint8(l);
huruf_ascii = uint8(huruf)';

% dibalik dari ascii ke char
l_char = char(l_ascii);

% for n = 1:127
%    x(n) = char(n);
% end


% bisa untuk ecripsi
% password = 'angga dwi sunarto'
% char(password + round(randn()*100))


% append
nama = 'angga';
nama(length(nama) + 1) = 'b';
nama;

nama2 = 'sunarto';

% concat
nama_baru = [nama, ' ', nama2];
% nama_baru = {nama, nama2}
% char(nama_baru(2))




