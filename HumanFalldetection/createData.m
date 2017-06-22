% ͳ��totalNumͼƬ����,ÿ���ļ����µ�ͼƬ��Ŀ������imageNum��

for cameraview=1:4
    
beginFile=1;
endFile=48;
totalNum=0;
imageNum=zeros(endFile,1);
for fileNum=beginFile:endFile
    fileName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/image/'];
    DIRS=dir([fileName,'*.png']);
    imageNum(fileNum,1)=length(DIRS);
    totalNum=totalNum+length(DIRS);
end
%����ͼƬ����totalData
totalData=cell(totalNum,1);
totalPicNum=1;
for fileNum=beginFile:endFile
    fileName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/image/'];
    DIRS=dir([fileName,'*.png']); 
    picNum=length(DIRS);
for n=1:picNum
    picName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/image/' num2str(n) '.png'];
    img=imread(picName);
    img=double(img(1:60,1:60));
    totalData{totalPicNum}=img(:);
    totalPicNum=totalPicNum+1;
end
end
totalData=[totalData{:}];
totalData=totalData';
matname=['./MNISTdata/totalDataCamera' num2str(cameraview) '.mat'];
savematname=['totalDataCamera' num2str(cameraview)];
save(matname,savematname);


% %  ͳ����Ƶ��������
totalsequencelNum=0;
sequenceNum=zeros(endFile,1);
for fileNum=beginFile:endFile
    fileName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/'];
    DIRS=dir(fileName);
    sequenceNum(fileNum,1)=length(DIRS)-3;%-3�Ǽ�ȥ2��.��..����image�ļ���
    totalsequencelNum=totalsequencelNum+sequenceNum(fileNum,1);
end

%������Ƶ������ݼ�?
sequenceImageNum=totalsequencelNum*30;
sequenceData=cell(sequenceImageNum,1);
j=1;%ͼƬ����
for fileNum=1:endFile
   seriseNum=sequenceNum(fileNum,1);
for n=1:seriseNum
for m=1:30
    seriseName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/' num2str(n) '/' num2str(m) '.png'];
    img=imread(seriseName);
    img=double(img(1:60,1:60));
    sequenceData{j}=img(:);
    j=j+1;
end
end
end
sequenceData=[sequenceData{:}];
sequenceData=sequenceData';
sequencematname=['./MNISTdata/sequenceDataCamera' num2str(cameraview) '.mat'];
savesequencematname=['sequenceDataCamera' num2str(cameraview)];
save(sequencematname,savesequencematname);


%�������б�ǩ
sequencename=[num2str(cameraview) 'camerasequence'  ];
[B1]=xlsread(sequencename,1,'A:A');
[B2]=xlsread(sequencename,1,'B:B');
[B3]=xlsread(sequencename,1,'C:C');
[B4]=xlsread(sequencename,1,'D:D');
[B5]=xlsread(sequencename,1,'E:E');
[B6]=xlsread(sequencename,1,'F:F');
[B7]=xlsread(sequencename,1,'G:G');
[B8]=xlsread(sequencename,1,'H:H');
[B9]=xlsread(sequencename,1,'I:I');
[B10]=xlsread(sequencename,1,'J:J');
[B11]=xlsread(sequencename,1,'K:K');
[B12]=xlsread(sequencename,1,'L:L');
[B13]=xlsread(sequencename,1,'M:M');
[B14]=xlsread(sequencename,1,'N:N');
[B15]=xlsread(sequencename,1,'O:O');
[B16]=xlsread(sequencename,1,'P:P');
[B17]=xlsread(sequencename,1,'Q:Q');
[B18]=xlsread(sequencename,1,'R:R');
[B19]=xlsread(sequencename,1,'S:S');
[B20]=xlsread(sequencename,1,'T:T');
[B21]=xlsread(sequencename,1,'U:U');
[B22]=xlsread(sequencename,1,'V:V');
[B23]=xlsread(sequencename,1,'W:W');
[B24]=xlsread(sequencename,1,'X:X');
[B25]=xlsread(sequencename,1,'Y:Y');
[B26]=xlsread(sequencename,1,'Z:Z');
[B27]=xlsread(sequencename,1,'AA:AA');
[B28]=xlsread(sequencename,1,'AB:AB');
[B29]=xlsread(sequencename,1,'AC:AC');
[B30]=xlsread(sequencename,1,'AD:AD');
[B31]=xlsread(sequencename,1,'AE:AE');
[B32]=xlsread(sequencename,1,'AF:AF');
[B33]=xlsread(sequencename,1,'AG:AG');
[B34]=xlsread(sequencename,1,'AH:AH');
[B35]=xlsread(sequencename,1,'AI:AI');
[B36]=xlsread(sequencename,1,'AJ:AJ');
[B37]=xlsread(sequencename,1,'AK:AK');
[B38]=xlsread(sequencename,1,'AL:AL');
[B39]=xlsread(sequencename,1,'AM:AM');
[B40]=xlsread(sequencename,1,'AN:AN');
[B41]=xlsread(sequencename,1,'AO:AO');
[B42]=xlsread(sequencename,1,'AP:AP');
[B43]=xlsread(sequencename,1,'AQ:AQ');
[B44]=xlsread(sequencename,1,'AR:AR');
[B45]=xlsread(sequencename,1,'AS:AS');
[B46]=xlsread(sequencename,1,'AT:AT');
[B47]=xlsread(sequencename,1,'AU:AU');
[B48]=xlsread(sequencename,1,'AV:AV');
sequenceLabels=[B1;B2;B3;B4;B5;B6;B7;B8;B9;B10;B11;B12;B13;B14;B15;B16;B17;B18;B19;B20;B21;B22;B23;B24;B25;B26;B27;B28;B29;B30;B31;B32;B33;B34;B35;B36;B37;B38;B39;B40;B41;B42;B43;B44;B45;B46;B47;B48];
save(['./MNISTdata/sequenceLabelsCamera' num2str(cameraview) '.mat'],['sequenceLabelsCamera' num2str(cameraview)]);
%���뵥�ű�ǩ
name=['camera' num2str(cameraview) ];
[A1]=xlsread(name,1,'A:A');
[A2]=xlsread(name,1,'B:B');
[A3]=xlsread(name,1,'C:C');
[A4]=xlsread(name,1,'D:D');
[A5]=xlsread(name,1,'E:E');
[A6]=xlsread(name,1,'F:F');
[A7]=xlsread(name,1,'G:G');
[A8]=xlsread(name,1,'H:H');
[A9]=xlsread(name,1,'I:I');
[A10]=xlsread(name,1,'J:J');
[A11]=xlsread(name,1,'K:K');
[A12]=xlsread(name,1,'L:L');
[A13]=xlsread(name,1,'M:M');
[A14]=xlsread(name,1,'N:N');
[A15]=xlsread(name,1,'O:O');
[A16]=xlsread(name,1,'P:P');
[A17]=xlsread(name,1,'Q:Q');
[A18]=xlsread(name,1,'R:R');
[A19]=xlsread(name,1,'S:S');
[A20]=xlsread(name,1,'T:T');
[A21]=xlsread(name,1,'U:U');
[A22]=xlsread(name,1,'V:V');
[A23]=xlsread(name,1,'W:W');
[A24]=xlsread(name,1,'X:X');
[A25]=xlsread(name,1,'Y:Y');
[A26]=xlsread(name,1,'Z:Z');
[A27]=xlsread(name,1,'AA:AA');
[A28]=xlsread(name,1,'AB:AB');
[A29]=xlsread(name,1,'AC:AC');
[A30]=xlsread(name,1,'AD:AD');
[A31]=xlsread(name,1,'AE:AE');
[A32]=xlsread(name,1,'AF:AF');
[A33]=xlsread(name,1,'AG:AG');
[A34]=xlsread(name,1,'AH:AH');
[A35]=xlsread(name,1,'AI:AI');
[A36]=xlsread(name,1,'AJ:AJ');
[A37]=xlsread(name,1,'AK:AK');
[A38]=xlsread(name,1,'AL:AL');
[A39]=xlsread(name,1,'AM:AM');
[A40]=xlsread(name,1,'AN:AN');
[A41]=xlsread(name,1,'AO:AO');
[A42]=xlsread(name,1,'AP:AP');
[A43]=xlsread(name,1,'AQ:AQ');
[A44]=xlsread(name,1,'AR:AR');
[A45]=xlsread(name,1,'AS:AS');
[A46]=xlsread(name,1,'AT:AT');
[A47]=xlsread(name,1,'AU:AU');
[A48]=xlsread(name,1,'AV:AV');
totalLabels=[A1;A2;A3;A4;A5;A6;A7;A8;A9;A10;A11;A12;A13;A14;A15;A16;A17;A18;A19;A20;A21;A22;A23;A24;A25;A26;A27;A28;A29;A30;A31;A32;A33;A34;A35;A36;A37;A38;A39;A40;A41;A42;A43;A44;A45;A46;A47;A48];
save(['./MNISTdata/totalLabelsCamera' num2str(cameraview) '.mat'],['totalLabelsCamera' num2str(cameraview)]);
end


























% 
% totalSeriesData=cell(6350,1);
% totalSeriesNum=1;
% for fileNum=2:22
%   for interFileNum=1:8;
%     fileName=['Series/' num2str(fileNum) '/' num2str(interFileNum) '/'];
%     DIRS=dir([fileName,'*.png']); 
%     picNum=length(DIRS); 
%     for n=1:picNum
%      picName=['Series/' num2str(fileNum) '/' num2str(interFileNum) '/' num2str(n) '.png'];
%      img=imread(picName);
%      img=double(img(1:60,1:60));
%      totalSeriesData{totalSeriesNum}=img(:)
%      totalSeriesNum=totalSeriesNum+1;
%     end
%   end
% end
% totalSeriesData=[totalSeriesData{:}];
% totalSeriesData=totalSeriesData';
% save('./MNISTdata/totalSeriesData.mat','totalSeriesData');











