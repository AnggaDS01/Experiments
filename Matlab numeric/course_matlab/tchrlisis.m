clear, clc

data = '4l4y B4n93t!?#$';
data2 = '100 derajat';
% built in function
% menganalisa data char

a = ischar(data);
b = isletter(data);
c = isspace(data2);

d = isstrprop(data, 'alpha');
e = isstrprop(data, 'alphanum');
f = isstrprop(data, 'digit');
g = isstrprop(data, 'lower');
h = isstrprop(data, 'upper');
i = isstrprop(data, 'punct');
j = isstrprop(data, 'wspace');

nama = 'james bond 007';
data_huruf = 0;
data_angka = 0;

for n = 1:length(nama)
    if isletter(nama(n))
       data_huruf = data_huruf + 1;
       huruf(data_huruf) = nama(n);
    elseif isstrprop(nama(n), 'digit')
        data_angka = data_angka + 1;
        angka(data_angka) = nama(n);
    end
end


% data_huruf, data_angka, huruf, angka

cast_to_num = str2num(angka);



% KOMPARASI
hari = input('masukkan hari : ', 's');


if strcmp(hari, 'senin')
    disp('bangun pagi');
elseif strcmp(hari, 'sabtu')
    disp('santai aja jadi bangun telat aja');
end





















