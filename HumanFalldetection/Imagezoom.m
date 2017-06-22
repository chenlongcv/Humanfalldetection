for i=1:64
    inputFileName=['Data/' num2str(i) '.png'];
    outFileName=[num2str(i) '.png'];
    I=imread(inputFileName);
    img= imresize(I,0.125);
    imwrite(img,outFileName);
end
