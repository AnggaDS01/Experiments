clear, clc
% 
% for i = 1:20
%     
%     if i == 10
%         disp(i)
%         disp('angka 10 ditemukan')
% %       break
%         continue
%     end
%     
%     pause(.5)
%     disp(i)
%     disp('ulang loop')
% end
% 
% disp('akhir dari looping')


for n = 1:10
   if n == 5
        fprintf('angka %d ditemukan\n', n)
%         break
%         continue
   end
   pause(.5)
   fprintf('ini adalah looping yang ke %d\n', n)
end

disp('akhir dari loop')




























