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

TrnSize = 10000; 
ImgSize = 32; 

%% Loading data from CIFAR10 (50000 training, 10000 testing) 
DataPath = './cifar-10-batches-mat';
% CIFAR10 dataset can be downloaded at http://www.cs.toronto.edu/~kriz/cifar.html

TrnLabels = [];
TrnData = [];
for i = 1:5
    load(fullfile(DataPath,['data_batch_' num2str(i) '.mat']));
    TrnData = [TrnData, data'];
    TrnLabels = [TrnLabels; labels];
end
load(fullfile(DataPath,'test_batch.mat'));
TestData = data';
TestLabels = labels;

ImgFormat = 'color'; %'gray'

TrnLabels = double(TrnLabels);
TestLabels = double(TestLabels);

%% For this demo, we subsample the Training and Testing sets 
% plz comment out the following four lines for a complete test.
% when you want to do so, please ensure that your computer memory is more than 64GB. 
% training linear SVM classifier on large amount of high dimensional data would 
% requires lots of memory. 
TrnData = TrnData(:,1:50:end);  % sample around 1000 training samples
TrnLabels = TrnLabels(1:50:end); % 
TestData = TestData(:,1:10:end);  % sample around 1000 test samples  
TestLabels = TestLabels(1:10:end); 
%%%%%%%%%%%%%%%%%%%%%%%%
nTestImg = length(TestLabels);


%% PCANet parameters (they should be funed based on validation set; i.e., ValData & ValLabel)
PCANet.NumStages = 2;
PCANet.PatchSize = [5 5];
PCANet.NumFilters = [40 8];
PCANet.HistBlockSize = [8 8];
PCANet.BlkOverLapRatio = 0.5;
PCANet.Pyramid = [4 2 1];

fprintf('\n ====== PCANet Parameters ======= \n')
PCANet

%% PCANet Training with 10000 samples
fprintf('\n ====== PCANet Training ======= \n')
TrnData_ImgCell = mat2imgcell(double(TrnData),ImgSize,ImgSize,ImgFormat); % convert columns in TrnData to cells 
tic; 
[ftrain, V, BlkIdx] = PCANet_train(TrnData_ImgCell,PCANet,1); % BlkIdx serves the purpose of learning block-wise DR projection matrix; e.g., WPCA
PCANet_TrnTime = toc;


%% PCA hashing over histograms
c = 10; 
fprintf('\n ====== Training Linear SVM Classifier ======= \n')
display(['now testing c = ' num2str(c) '...'])
tic;
models = train(TrnLabels, ftrain', ['-s 1 -c ' num2str(c) ' -q']); % we use linear SVM classifier (C = 10), calling liblinear library
LinearSVM_TrnTime = toc;


%% PCANet Feature Extraction and Testing 

TestData_ImgCell = mat2imgcell(TestData,ImgSize,ImgSize,ImgFormat); % convert columns in TestData to cells 
clear TestData; 

fprintf('\n ====== PCANet Testing ======= \n')

nCorrRecog = 0;
RecHistory = zeros(nTestImg,1);

tic; 
for idx = 1:1:nTestImg
    ftest = PCANet_FeaExt(TestData_ImgCell(idx),V,PCANet); % extract a test feature using trained PCANet model 

    [xLabel_est, accuracy, decision_values] = predict(TestLabels(idx),...
        sparse(ftest'), models, '-q');
    
    if xLabel_est == TestLabels(idx)
        RecHistory(idx) = 1;
        nCorrRecog = nCorrRecog + 1;
    end
    
    if 0==mod(idx,nTestImg/1000); 
        fprintf('Accuracy up to %d tests is %.2f%%; taking %.2f secs per testing sample on average. \n',...
            [idx 100*nCorrRecog/idx toc/idx]); 
    end 
    
    TestData_ImgCell{idx} = [];
    
end
Averaged_TimeperTest = toc/nTestImg;
Accuracy = nCorrRecog/nTestImg; 
ErRate = 1 - Accuracy;

%% Results display
fprintf('\n ===== Results of PCANet, followed by a linear SVM classifier =====');
fprintf('\n     PCANet training time: %.2f secs.', PCANet_TrnTime);
fprintf('\n     Linear SVM training time: %.2f secs.', LinearSVM_TrnTime);
fprintf('\n     Testing error rate: %.2f%%', 100*ErRate);
fprintf('\n     Average testing time %.2f secs per test sample. \n\n',Averaged_TimeperTest);



    