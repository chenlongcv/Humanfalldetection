% for fileNum=19:23
%  fileName=['NEW/chute' num2str(fileNum) '/'];
%  DIRS=dir([fileName,'*.png']);
%  picNum=length(DIRS);
%  for i=1:picNum
%      picName=[num2str(fileNum) '/0 (' num2str(i+1) ').png'];
%      A = imread(picName);
%      B = imresize(A, 0.6);
%      savepicName=[num2str(fileNum) '/' num2str(i) '.png'];
%      imwrite(B,savepicName);
%  end      
% end

for fileNum=16:18
 for interFileNum=1:8
     fileName=['NEW/chute' num2str(fileNum) '/' num2str(interFileNum) '/'];
     DIRS=dir([fileName,'*.png']);
     picNum=length(DIRS);
    for i=1:picNum
     picName=['NEW/chute' num2str(fileNum) '/' num2str(interFileNum) '/' num2str(i) '.png'];
     A = imread(picName);
     B = imresize(A, 0.6);
     savepicName=['NEW/' num2str(fileNum) '/' num2str(interFileNum) '/' num2str(i) '.png'];
     imwrite(B,savepicName);
    end
 end      
end





