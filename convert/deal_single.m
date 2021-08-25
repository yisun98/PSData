
folder_name = '';

mul_file_name = '';
gen_mul_file_name = '';

I = imread(strcat(folder_name, mul_file_name));
[h, w, b] = size(I);
h, w, b
R = I(:,:,1); G = I(:,:,2); B = I(:,:,3); NIR = I(:,:,4);
T = zeros(h,w,b);
T(:,:,1)=B; T(:,:,2)=G; T(:,:,3)=R; T(:,:,4)=NIR; 
imwrite(uint8(T), strcat(save_folder_name,   gen_mul_file_name, '.tif'), 'tif')

pan_file_name = ''
gen_pan_file_name = ''

I = imread(strcat(folder_name, pan_file_name));
[h, w, b] = size(I);
h, w, b
imwrite(uint8(I), strcat(save_folder_name,   gen_pan_file_name, '.tif'), 'tif')