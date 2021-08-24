%%
clc;clear;
close all;
im = imread('baby_GT.bmp');


X    = 120; 
Y    = 60; 
dX   = 80;    
dY   = 80;  
bbox = [X, Y, dX, dY];
im_1 = insertShape(im, 'Rectangle', bbox, 'LineWidth', 2, ...
    'Color', 'red');
p    = 'rt'; % lr, rb, lt, rt
% type = 'jpg' % jpg, png
%% 
scale     = 3;
im_crop   = imcrop(im, bbox); 
im_crop_b = imresize(im_crop, scale, 'bicubic'); 

%% 
[row_1, col_1, ~]                     = size(im);
[row_2, col_2, ~]                     = size(im_crop_b);
im_2                                  = im_1;


if p == 'lr' % left bottom 
    
   im_2(row_1-row_2+1:row_1, 1:col_2, :) = im_crop_b;
   bbox  = [1,row_1-row_2+1,col_2,row_2];
   
elseif p == 'rb' % right bottom
   
   im_2(row_1-row_2+1:row_1, col_1 - col_2 + 1:col_1, :) = im_crop_b;
   bbox  = [col_1-col_2+1,row_1-row_2+1,col_1,row_2];
   
elseif p == 'lt' % left top
    
   im_2(1:row_2, 1:col_2, :) = im_crop_b;
   bbox  = [1,1,row_2,col_2];
   
elseif p == 'rt' % right top
    
   im_2(1:row_2, col_1-col_2+1:col_1, :) = im_crop_b; % fig
   bbox  = [col_1-col_2+1,1,col_1,row_2]; % rectangle
   
end;
im_2  = insertShape(im_2, 'Rectangle', bbox, 'LineWidth', 2, ...
    'Color', 'red');
figure;imshow(im_2);
imwrite(im_2, 'baby_GT_local_show.bmp');






