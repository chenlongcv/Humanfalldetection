% ==== PCANet Demo =======
% T.-H. Chan, K. Jia, S. Gao, J. Lu, Z. Zeng, and Y. Ma, 
% "PCANet: A simple deep learning baseline for image classification?" submitted to IEEE TIP. 
% ArXiv eprint: http://arxiv.org/abs/1404.3606 

% Tsung-Han Chan [thchan@ieee.org]
% Please email me if you find bugs, or have suggestions or questions!
% ========================

clear all; close all; clc; 
addpath('./Utils');
addpath('./Liblinear');



ImgSize = 60; 
ImgFormat = 'gray'; %'color' or 'gray'

%% Loading data from MNIST Basic (10000 training, 2000 validation, 50000 testing) 
% % load mnist_basic data
% load('./MNISTdata/mnist_basic'); 
% 
% % ===== Reshuffle the training data =====
% % Randnidx = randperm(size(mnist_train,1)); 
% % mnist_train = mnist_train(Randnidx,:); 
% % =======================================
% 
% TrnData = mnist_train(1:TrnSize,1:end-1)';  % partition the data into training set and validation set
% TrnLabels = mnist_train(1:TrnSize,end);
% ValData = mnist_train(TrnSize+1:end,1:end-1)';
% ValLabels = mnist_train(TrnSize+1:end,end);
% clear mnist_train;
% 
% TestData = mnist_test(:,1:end-1)';
% TestLabels = mnist_test(:,end);
% clear mnist_test;


% load mnist_basic data
% load('./MNISTdata/myData'); 
% load('./MNISTdata/LabelsFor23Methods'); 
load('./MNISTdata/totalDataCamera1'); 
load('./MNISTdata/totalLabelsCamera1');
load('./MNISTdata/sequenceLabelsCamera1');
load('./MNISTdata/sequenceDataCamera1');

load('./MNISTdata/totalDataCamera2'); 
load('./MNISTdata/totalLabelsCamera2');
load('./MNISTdata/sequenceLabelsCamera2');
load('./MNISTdata/sequenceDataCamera2');

load('./MNISTdata/totalDataCamera3'); 
load('./MNISTdata/totalLabelsCamera3');
load('./MNISTdata/sequenceLabelsCamera3');
load('./MNISTdata/sequenceDataCamera3');


load('./MNISTdata/totalDataCamera4'); 
load('./MNISTdata/totalLabelsCamera4');
load('./MNISTdata/sequenceLabelsCamera4');
load('./MNISTdata/sequenceDataCamera4');


for cameraview=1:1
Num=48;%������Ƶ����
% for testId=1:Num;
%����ѵ������Ƶ���?-Num
%imageNum������118����Ƶ�и�ͼƬ��Ŀ
%sequenceNum������118����Ƶ����Ƶ���е���Ŀ
% ͳ��ÿ���ļ����µ�ͼƬ��Ŀ������imageNum��
totalimgNum=0;
imageNum=zeros(Num,1);
for fileNum=1:Num
    fileName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/image/'];
    DIRS=dir([fileName,'*.png']);
    imageNum(fileNum,1)=length(DIRS);
    totalimgNum=totalimgNum+imageNum(fileNum,1);
end
%  ͳ��ÿ���ļ����µ���Ƶ������Ŀ������imageNum��
totalsequenceNum=0;
sequenceNum=zeros(Num,1);
for fileNum=1:Num
    fileName=['camera' num2str(cameraview) '/image' num2str(fileNum) '/'];
    DIRS=dir(fileName);
    sequenceNum(fileNum,1)=length(DIRS)-3;%-3�Ǽ�ȥ2��.��..����image�ļ���
    totalsequenceNum=totalsequenceNum+sequenceNum(fileNum,1);
end


totalData=double(totalData);
sequenceData=double(sequenceData);
imageBegin=zeros(Num,1);
imageEnd=zeros(Num,1);
sequenceBegin=zeros(Num,1);
sequenceEnd=zeros(Num,1);
sequenceImgBegin=zeros(Num,1);
sequenceImgEnd=zeros(Num,1);

for id=1:Num
    if id==1  
    imageBegin(id,1)=1;
    imageEnd(id,1)=imageNum(id,1);
    sequenceBegin(id,1)=1;
    sequenceEnd(id,1)=sequenceNum(id,1);
    sequenceImgBegin(id,1)=1;
    sequenceImgEnd(id,1)=sequenceNum(id,1)*30;
    else
    imageBegin(id,1)=imageEnd(id-1,1)+1;
    imageEnd(id,1)=imageBegin(id,1)+imageNum(id,1)-1;
    sequenceBegin(id,1)=sequenceEnd(id-1,1)+1;
    sequenceEnd(id,1)=sequenceBegin(id,1)+sequenceNum(id,1)-1;
    sequenceImgBegin(id,1)=sequenceImgEnd(id-1,1)+1;
    sequenceImgEnd(id,1)=sequenceImgBegin(id,1)+sequenceNum(id,1)*30-1;
    end
end


% TestData = sequenceData(sequenceImgBegin(testId,1):sequenceImgEnd(testId,1),:)';
% testSequenceLabels=sequenceLabels(sequenceBegin(testId,1):sequenceEnd(testId,1));
% TestLabels=totalLabels(imageBegin(testId,1):(imageBegin(testId,1)+sequenceNum(testId,1)*30-1));
if(camerview==1)
TrnData = totalDataCamera1;
% TrnData(imageBegin(testId,1):imageEnd(testId,1),:)=[];
TrnData = TrnData(1:400:end,:);
TrnData=TrnData';
TrnLabels=totalLabelsCamera1;
% TrnLabels(imageBegin(testId,1):imageEnd(testId,1))=[];
TrnLabels = TrnLabels(1:400:end);

testSequenceLabels=sequenceLabelsCamera1;
TestData = sequenceDataCamera1';
end

if(camerview==2)
TrnData = totalDataCamera2;
% TrnData(imageBegin(testId,1):imageEnd(testId,1),:)=[];
TrnData = TrnData(1:4:end,:);
TrnData=TrnData';
TrnLabels=totalLabelsCamera2;
% TrnLabels(imageBegin(testId,1):imageEnd(testId,1))=[];
TrnLabels = TrnLabels(1:4:end);

testSequenceLabels=sequenceLabelsCamera2;
TestData = sequenceDataCamera2';
end

if(camerview==3)
TrnData = totalDataCamera3;
% TrnData(imageBegin(testId,1):imageEnd(testId,1),:)=[];
TrnData = TrnData(1:4:end,:);
TrnData=TrnData';
TrnLabels=totalLabelsCamera3;
% TrnLabels(imageBegin(testId,1):imageEnd(testId,1))=[];
TrnLabels = TrnLabels(1:4:end);

testSequenceLabels=sequenceLabelsCamera3;
TestData = sequenceDataCamera3';
end

if(camerview==4)
TrnData = totalDataCamera4;
% TrnData(imageBegin(testId,1):imageEnd(testId,1),:)=[];
TrnData = TrnData(1:4:end,:);
TrnData=TrnData';
TrnLabels=totalLabelsCamera4;
% TrnLabels(imageBegin(testId,1):imageEnd(testId,1))=[];
TrnLabels = TrnLabels(1:4:end);

testSequenceLabels=sequenceLabelsCamera4;
TestData = sequenceDataCamera4';
end

%ѵ����Ͳ���������?
TrnSize = length(TrnLabels); 
nTestImg = totalsequenceNum*30;
testSequenceSize=length(testSequenceLabels);



%% PCANet parameters (they should be funed based on validation set; i.e., ValData & ValLabel)
% We use the parameters in our IEEE TPAMI submission
PCANet.NumStages = 2;
PCANet.PatchSize = [7 7];
PCANet.NumFilters = [8 8];
PCANet.HistBlockSize = [7 7]; 
PCANet.BlkOverLapRatio = 0.5;
PCANet.Pyramid = [];

fprintf('\n ====== PCANet Parameters ======= \n')
PCANet

%% PCANet Training with 10000 samples

fprintf('\n ====== PCANet Training ======= \n')
TrnData_ImgCell = mat2imgcell(TrnData,ImgSize,ImgSize,ImgFormat); % convert columns in TrnData to cells 
clear TrnData; 
tic;
[ftrain V BlkIdx] = PCANet_train(TrnData_ImgCell,PCANet,1); % BlkIdx serves the purpose of learning block-wise DR projection matrix; e.g., WPCA
PCANet_TrnTime = toc;
clear TrnData_ImgCell; 


fprintf('\n ====== Training Linear SVM Classifier ======= \n')
tic;
models = train(TrnLabels, ftrain', '-s 1 -q'); % we use linear SVM classifier (C = 1), calling libsvm library
LinearSVM_TrnTime = toc;
clear ftrain; 


%% PCANet Feature Extraction and Testing 

TestData_ImgCell = mat2imgcell(TestData,ImgSize,ImgSize,ImgFormat); % convert columns in TestData to cells 
clear TestData; 

fprintf('\n ====== PCANet Testing ======= \n')

nCorrRecog = 0;
RecHistory = zeros(nTestImg,1);
tic; 

testoutLabels=zeros(testSequenceSize,31);
for index=1:1:testSequenceSize
    testoutLabels(index,31)=testSequenceLabels(index);
end

for idx = 1:1:nTestImg
    ftest = PCANet_FeaExt(TestData_ImgCell(idx),V,PCANet); % extract a test feature using trained PCANet model 
    [xLabel_est, accuracy, decision_values] = predict(0,...
        sparse(ftest'), models, '-q');
%     [xLabel_est, accuracy, decision_values] = predict(TestLabels(idx),...
%         sparse(ftest'), models, '-q'); % label predictoin by libsvm
%    fprintf('Idx:%d primativeLabel:%d  testLable:%d\n',[idx TestLabels(idx) xLabel_est]);
    i=floor(idx/30)+1;
    j=mod(idx,30);
    if j==0
        i=i-1;
        j=30;
    end
   testoutLabels(i,j) =xLabel_est;

   
%     if xLabel_est == TestLabels(idx)
%         RecHistory(idx) = 1;
%         nCorrRecog = nCorrRecog + 1;
%     end
%     
%     if 0==mod(idx,nTestImg/100); 
%         fprintf('Accuracy up to %d tests is %.2f%%; taking %.2f secs per testing sample on average. \n',...
%             [idx 100*nCorrRecog/idx toc/idx]); 
%     end 
%     
%     TestData_ImgCell{idx} = [];
%     
end
% Averaged_TimeperTest = toc/nTestImg;
% Accuracy = nCorrRecog/nTestImg; 
% ErRate = 1 - Accuracy;
% 
% %% Results display
% fprintf('\n ===== Results of PCANet, followed by a linear SVM classifier =====');
% fprintf('\n     PCANet training time: %.2f secs.', PCANet_TrnTime);
% fprintf('\n     Linear SVM training time: %.2f secs.', LinearSVM_TrnTime);
% fprintf('\n     Testing error rate: %.2f%%', 100*ErRate);
% fprintf('\n     Average testing time %.2f secs per test sample. \n\n',Averaged_TimeperTest);



testOutName=['Output/testOutput' num2str(cameraview) '.txt'];
testOut=testoutLabels(1:testSequenceSize,:);


% fid=fopen(trainOutName,'w');
% [m,n]=size(trainOut);
% for i=1:1:m
% for j=1:1:n
% if j==n
% fprintf(fid,'%d\n',trainOut(i,j));
% else
% fprintf(fid,'%d',trainOut(i,j));
% end
% end
% end
% fclose(fid);

fid=fopen(testOutName,'w');  
[m,n]=size(testOut);
for i=1:1:m
for j=1:1:n
if j==n
fprintf(fid,'%d\n',testOut(i,j));
else
fprintf(fid,'%d',testOut(i,j));
end
end
end
fclose(fid);

end
    