function f=find_file
    folder_name      = 'D:\BaiduNetdiskDownload\PSData3\GF-2\tmp\'; % source
    save_folder_name = 'D:\BaiduNetdiskDownload\PSData3\GF-2\'; % generate
    x                = dir(folder_name);
    len              = length(x);
    count            = zeros(len,1);
    pan_file_end = 'PAN-step2.tif';
    ms_file_end = 'MUL-step2.tif'
    for i=1:len
       if strfind(x(i).name,'PAN-step2.tif')
            I = imread(strcat(folder_name, x(i).name));
            %x(i).name
            [h, w, b] = size(I);
            h, w, b
            imwrite(uint8(I), strcat(save_folder_name,   x(i).name(1:5), '.tif'), 'tif')
       else if strfind(x(i).name,'MUL-step2.tif')
            I = imread(strcat(folder_name, x(i).name));
            [h, w, b] = size(I);
            h, w, b
            R = I(:,:,1); G = I(:,:,2); B = I(:,:,3); NIR = I(:,:,4);
            T = zeros(h,w,b);
            T(:,:,1)=B; T(:,:,2)=G; T(:,:,3)=R; T(:,:,4)=NIR; 
            %T(:,:,1)=R; T(:,:,2)=G; T(:,:,3)=B; T(:,:,4)=NIR; % stop using
            imwrite(uint8(T), strcat(save_folder_name,   x(i).name(1:5), '.tif'), 'tif')
       end
    end
end
f=strcat('finish');