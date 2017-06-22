clear
clc
tic
root = '/home/hd/桌面/longlong/';

namedir = dir(root);
namedir = namedir(3:end);

for i = 1:length(namedir)
% for i = 1
%     disp(['Processing ' namedir(i).name '......']);
    name_i_dir = dir([root namedir(i).name '/']);
    name_i_dir = name_i_dir(3:end);
    for j = 1:length(name_i_dir)
%     for j = 1
        disp(['Processing ' namedir(i).name '---' name_i_dir(j).name '......']);
        image_ij_root = [root namedir(i).name '/' name_i_dir(j).name '/'];
        origin_list = dir([image_ij_root 'image/*.png']);
        sortnum = zeros(length(origin_list), 1);
        for k = 1:length(origin_list)
            sortnum(k, 1) = str2num( origin_list(k).name(1:end-4) );
        end
        [sored, ind] = sort(sortnum);
        
        % change the name of the origin image file
        for c_i = 1:length(origin_list)
                ori_image = imread([image_ij_root 'image/' origin_list( ind(c_i) ).name]);
                imwrite(ori_image, [image_ij_root 'image/' num2str(c_i) '.png'] );
                delete([image_ij_root 'image/' origin_list( ind(c_i) ).name]);
        end
        
        % create the little folder
        sizefold = 30;
        for n = 1:ceil(length(origin_list) / sizefold)
            if isdir([image_ij_root num2str(n)])
                rmdir([image_ij_root num2str(n)], 's');
            end
            mkdir( [image_ij_root num2str(n)] );
        end
        
        %copy image to the corresponding  folder
        origin_list2 = dir([image_ij_root 'image/*.png']);
        sortnum2 = zeros(length(origin_list2), 1);
        for k = 1:length(origin_list2)
            sortnum2(k, 1) = str2num( origin_list2(k).name(1:end-4) );
        end
        [sored, ind] = sort(sortnum2);
        
        for m = 1:length(origin_list2)
%         for m = 1
            dir_m = [image_ij_root num2str( floor((m-1)/30) + 1 ) '/'];
            ori_image = imread([image_ij_root 'image/' origin_list2( ind(m) ).name]);
%             origin_list( ind(m) ).name
            imwrite(ori_image, [dir_m num2str( mod(m-1, 30) + 1 ) '.png']);
%             copyfile([image_ij_root 'image/' origin_list( ind(m) ).name], dir_m);
        end
        
    end
end

toc