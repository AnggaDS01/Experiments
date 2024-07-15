clear, clc
% pendeteksi bilangan bulat atau ganjil


% a = input('masukkan angka : ')
% 
% if mod(a, 2) == 0
%     fprintf('%d adalah bilangan genap\n', a)
% else
%     fprintf('%d adalah bilangan genap\n', a)
% end

% a = input('masukkan angka awal : ');
% b = input('masukkan angka akhir: ');
% for i = a:b
%     if ~mod(i, 2)
%         fprintf('bilangan %d adalah genap\n', i)
%     else
%         fprintf('bilangan %d adalah ganjil\n', i) 
%     end
% end



% shortened varsion
a = input('masukan angka : ');
if ~mod(a, 2); str='genap'; else; str='ganjil'; end
fprintf('%d adalah bilangan %s\n', a, str)






















