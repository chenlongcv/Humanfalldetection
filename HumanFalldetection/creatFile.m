% for fileNum=1:192
% new_folder = ['E:/file/binaryImage' num2str(fileNum)]; % new_folder 保存要创建的文件夹，是绝对路径+文件夹名称
% mkdir(new_folder);  % mkdir()函数创建文件夹
% end

% for i=1:192;
% trainout_file=['Output/trianOutput' num2str(i) '.txt'];
% dlmwrite(trainout_file,i,' ');
% testout_file=['Output/testOutput' num2str(i) '.txt'];
% dlmwrite(testout_file,i,' ');
% end



% for cameraview=1:4
% for outId=1:48
% fidr=fopen(['camera' num2str(cameraview) 'Output/testOutput' num2str(outId) '.txt'],'r');
% fidw=fopen(['Output' num2str(cameraview) '/testOutput' num2str(outId) '.txt'],'w');
% i=1;
% while ~feof(fidr)
%     tline=fgets(fidr,1);
%     if(~isempty(str2num(tline)))
%         if(mod(i,31)==0)
%             flag=fprintf(fidw,'%s\n',tline); 
%             i=i+1;
%         else
%             flag=fprintf(fidw,'%s ',tline); 
%             i=i+1;
%         end
%     end
% end
% fclose('all');
% end
% end



% for cameraview=1:4
% fidr=fopen(['SVMOutput/testOutput' num2str(cameraview) '.txt'],'r');
% fidw=fopen(['testOutput' num2str(cameraview) '.txt'],'w');
% i=1;
% while ~feof(fidr)
%     tline=fgets(fidr,1);
%     if(~isempty(str2num(tline)))
%         if(mod(i,31)==0)
%             flag=fprintf(fidw,'%s\n',tline); 
%             i=i+1;
%         else
%             flag=fprintf(fidw,'%s ',tline); 
%             i=i+1;
%         end
%     end
% end
% fclose('all');
% end



% TrnLabels=a(:,11);
% TrnLabels=double(TrnLabels);
% TrnData=a(:,1:10);
% TrnData=double(TrnData);
% models = train(TrnLabels,TrnData, '-s 1 -q'); 
% [xLabel_est, accuracy, decision_values] = predict(TrnLabels,TrnData, models, '-q');







% clc;  
% clear;  
% close all;   
% for file=1:48
% trainTxt=load(['Output2/testOutput' num2str(file) '.txt']);
% TrnLabels=trainTxt(:,31);
% TrnData=trainTxt(:,1:30);
% camerasequence='2camerasequence';
% if(file==1)
% [B]=xlsread(camerasequence,1,'A:A');
% end
% if(file==2)
% [B]=xlsread(camerasequence,1,'B:B');
% end
% if(file==3)
% [B]=xlsread(camerasequence,1,'C:C');
% end
% if(file==4)
% [B]=xlsread(camerasequence,1,'D:D');
% end
% if(file==5)
% [B]=xlsread(camerasequence,1,'E:E');
% end
% if(file==6)
% [B]=xlsread(camerasequence,1,'F:F');
% end
% if(file==7)
% [B]=xlsread(camerasequence,1,'G:G');
% end
% if(file==8)
% [B]=xlsread(camerasequence,1,'H:H');
% end
% if(file==9)
% [B]=xlsread(camerasequence,1,'I:I');
% end
% if(file==10)
% [B]=xlsread(camerasequence,1,'J:J');
% end
% if(file==11)
% [B]=xlsread(camerasequence,1,'K:K');
% end
% if(file==12)
% [B]=xlsread(camerasequence,1,'L:L');
% end
% if(file==13)
% [B]=xlsread(camerasequence,1,'M:M');
% end
% if(file==14)
% [B]=xlsread(camerasequence,1,'N:N');
% end
% if(file==15)
% [B]=xlsread(camerasequence,1,'O:O');
% end
% if(file==16)
% [B]=xlsread(camerasequence,1,'P:P');
% end
% if(file==17)
% [B]=xlsread(camerasequence,1,'Q:Q');
% end
% if(file==18)
% [B]=xlsread(camerasequence,1,'R:R');
% end
% if(file==19)
% [B]=xlsread(camerasequence,1,'S:S');
% end
% if(file==20)
% [B]=xlsread(camerasequence,1,'T:T');
% end
% if(file==21)
% [B]=xlsread(camerasequence,1,'U:U');
% end
% if(file==22)
% [B]=xlsread(camerasequence,1,'V:V');
% end
% if(file==23)
% [B]=xlsread(camerasequence,1,'W:W');
% end
% if(file==24)
% [B]=xlsread(camerasequence,1,'X:X');
% end
% if(file==25)
% [B]=xlsread(camerasequence,1,'Y:Y');
% end
% if(file==26)
% [B]=xlsread(camerasequence,1,'Z:Z');
% end
% if(file==27)
% [B]=xlsread(camerasequence,1,'AA:AA');
% end
% if(file==28)
% [B]=xlsread(camerasequence,1,'AB:AB');
% end
% if(file==29)
% [B]=xlsread(camerasequence,1,'AC:AC');
% end
% if(file==30)
% [B]=xlsread(camerasequence,1,'AD:AD');
% end
% if(file==31)
% [B]=xlsread(camerasequence,1,'AE:AE');
% end
% if(file==32)
% [B]=xlsread(camerasequence,1,'AF:AF');
% end
% if(file==33)
% [B]=xlsread(camerasequence,1,'AG:AG');
% end
% if(file==34)
% [B]=xlsread(camerasequence,1,'AH:AH');
% end
% if(file==35)
% [B]=xlsread(camerasequence,1,'AI:AI');
% end
% if(file==36)
% [B]=xlsread(camerasequence,1,'AJ:AJ');
% end
% if(file==37)
% [B]=xlsread(camerasequence,1,'AK:AK');
% end
% if(file==38)
% [B]=xlsread(camerasequence,1,'AL:AL');
% end
% if(file==39)
% [B]=xlsread(camerasequence,1,'AM:AM');
% end
% if(file==40)
% [B]=xlsread(camerasequence,1,'AN:AN');
% end
% if(file==41)
% [B]=xlsread(camerasequence,1,'AO:AO');
% end
% if(file==42)
% [B]=xlsread(camerasequence,1,'AP:AP');
% end
% if(file==43)
% [B]=xlsread(camerasequence,1,'AQ:AQ');
% end
% if(file==44)
% [B]=xlsread(camerasequence,1,'AR:AR');
% end
% if(file==45)
% [B]=xlsread(camerasequence,1,'AS:AS');
% end
% if(file==46)
% [B]=xlsread(camerasequence,1,'AT:AT');
% end
% if(file==47)
% [B]=xlsread(camerasequence,1,'AU:AU');
% end
% if(file==48)
% [B]=xlsread(camerasequence,1,'AV:AV');
% end
% 
% TrnData(:,31)=B(:);
% B=[];
% fid=fopen(['Output/testOutput' num2str(file) '.txt'],'w');%写入文件路径
% [m,n]=size(TrnData); %获取矩阵的大小，p为要输出的矩阵
% for i=1:1:m
% for j=1:1:n
% if j==n %如果一行的个数达到n个则换行，否则空格
% fprintf(fid,'%d\n',TrnData(i,j));
% else
% fprintf(fid,'%d ',TrnData(i,j));
% end
% end
% end
% fclose(fid); %关闭文件
% end



% sequencename='2camerasequence';
% [B1]=xlsread(sequencename,1,'A:A');
% [B2]=xlsread(sequencename,1,'B:B');
% [B3]=xlsread(sequencename,1,'C:C');
% [B4]=xlsread(sequencename,1,'D:D');
% [B5]=xlsread(sequencename,1,'E:E');
% [B6]=xlsread(sequencename,1,'F:F');
% [B7]=xlsread(sequencename,1,'G:G');
% [B8]=xlsread(sequencename,1,'H:H');
% [B9]=xlsread(sequencename,1,'I:I');
% [B10]=xlsread(sequencename,1,'J:J');
% [B11]=xlsread(sequencename,1,'K:K');
% [B12]=xlsread(sequencename,1,'L:L');
% [B13]=xlsread(sequencename,1,'M:M');
% [B14]=xlsread(sequencename,1,'N:N');
% [B15]=xlsread(sequencename,1,'O:O');
% [B16]=xlsread(sequencename,1,'P:P');
% [B17]=xlsread(sequencename,1,'Q:Q');
% [B18]=xlsread(sequencename,1,'R:R');
% [B19]=xlsread(sequencename,1,'S:S');
% [B20]=xlsread(sequencename,1,'T:T');
% [B21]=xlsread(sequencename,1,'U:U');
% [B22]=xlsread(sequencename,1,'V:V');
% [B23]=xlsread(sequencename,1,'W:W');
% [B24]=xlsread(sequencename,1,'X:X');
% [B25]=xlsread(sequencename,1,'Y:Y');
% [B26]=xlsread(sequencename,1,'Z:Z');
% [B27]=xlsread(sequencename,1,'AA:AA');
% [B28]=xlsread(sequencename,1,'AB:AB');
% [B29]=xlsread(sequencename,1,'AC:AC');
% [B30]=xlsread(sequencename,1,'AD:AD');
% [B31]=xlsread(sequencename,1,'AE:AE');
% [B32]=xlsread(sequencename,1,'AF:AF');
% [B33]=xlsread(sequencename,1,'AG:AG');
% [B34]=xlsread(sequencename,1,'AH:AH');
% [B35]=xlsread(sequencename,1,'AI:AI');
% [B36]=xlsread(sequencename,1,'AJ:AJ');
% [B37]=xlsread(sequencename,1,'AK:AK');
% [B38]=xlsread(sequencename,1,'AL:AL');
% [B39]=xlsread(sequencename,1,'AM:AM');
% [B40]=xlsread(sequencename,1,'AN:AN');
% [B41]=xlsread(sequencename,1,'AO:AO');
% [B42]=xlsread(sequencename,1,'AP:AP');
% [B43]=xlsread(sequencename,1,'AQ:AQ');
% [B44]=xlsread(sequencename,1,'AR:AR');
% [B45]=xlsread(sequencename,1,'AS:AS');
% [B46]=xlsread(sequencename,1,'AT:AT');
% [B47]=xlsread(sequencename,1,'AU:AU');
% [B48]=xlsread(sequencename,1,'AV:AV');
% sequenceLabels=[B1;B2;B3;B4;B5;B6;B7;B8;B9;B10;B11;B12;B13;B14;B15;B16;B17;B18;B19;B20;B21;B22;B23;B24;B25;B26;B27;B28;B29;B30;B31;B32;B33;B34;B35;B36;B37;B38;B39;B40;B41;B42;B43;B44;B45;B46;B47;B48];
% 
% testTxt=load('testOutput2.txt');
% TrnData=testTxt(:,1:30);
% TrnData(:,31)=sequenceLabels(:);
% sequenceLabels=[];
% fid=fopen('Output2.txt','w');%写入文件路径
% [m,n]=size(TrnData); %获取矩阵的大小，p为要输出的矩阵
% for i=1:1:m
% for j=1:1:n
% if j==n %如果一行的个数达到n个则换行，否则空格
% fprintf(fid,'%d\n',TrnData(i,j));
% else
% fprintf(fid,'%d ',TrnData(i,j));
% end
% end
% end
% fclose(fid); %关闭文件



clc;  
clear;  
close all;   
cameraview=4;
trainTxt=load(['trainData' num2str(cameraview) '.txt']);
TrnLabels=trainTxt(:,31);
TrnData=trainTxt(:,1:30);
svm_struct = svmtrain(TrnData,TrnLabels,'Showplot',true); % training 
sensitivity=0;
specificity=0;
num1=0;
num0=0;
for i=1:48
testTxt=load(['Output' num2str(cameraview) '/testOutput' num2str(i) '.txt']);
TestLabels=testTxt(:,31);
TestData=testTxt(:,1:30);
Group = svmclassify(svm_struct,TestData,'Showplot',true); 
for j=1:length(TestLabels)
fprintf('\n     Avi：%d label:%d  predictLabel:%d', i,TestLabels(j),Group(j));
if(TestLabels(j)==1)
        if(TestLabels(j)==Group(j))
            sensitivity=sensitivity+1;
        end
        num1=num1+1;
end
if(TestLabels(j)==0)
        if(TestLabels(j)==Group(j))
            specificity=specificity+1;
        end
        num0=num0+1;
end
end
end
fprintf('\n     Testing sensitivity rate: %.2f%%    specificity rate: %.2f%%', 100*sensitivity/num1,100*specificity/num0);









