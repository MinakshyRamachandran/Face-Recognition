% This is a sample script
% It demos the face expression recognition using the Eigenface method

disp('Face Expression Recognition Demo Using the Eigenface Method')
%disp('After your face appeared in the camera window, please left click your mouse to take a picture of youself')
%disp('Please save your cute picture to D:\CS6527-Computer Vision\Final Project\Project Code\TestImage')

%pictureCapture

TrainImagePath = 'C:\Users\samru\Documents\MATLAB\FE-master\Facial-Expression-Recognition-master\Project Code\TrainingImage';
TestImagePath = 'C:\Users\samru\Documents\MATLAB\FE-master\Facial-Expression-Recognition-master\Project Code\TestImage';
LabelPath = 'C:\Users\samru\Documents\MATLAB\FE-master\Facial-Expression-Recognition-master\Project Code\ImageLabel.txt';

[NumTrainImg,TrainImg] = loadImage( TrainImagePath );
[NumTestImg,TestImg] = loadImage( TestImagePath );

[C,minDist,minDistIndex] = eigenFaceRecognition(TrainImg,TestImg,NumTrainImg,NumTestImg );

% Display the result
RecognizedExpression = strcat(int2str(minDistIndex),'.jpg');
    % read in the image label
    fid=fopen(LabelPath);
    imageLabel=textscan(fid,'%s %s','whitespace',',');
    fclose(fid);
    
    % export the matched label
    Best_Match = cell2mat(imageLabel{1,1}(minDistIndex));
    ExprLabel = cell2mat(imageLabel{1,2}(minDistIndex));

str1 = strcat('Your face expression is like this one:  ',RecognizedExpression);
str2 = strcat('It tells me that you are:  ',ExprLabel);
disp(str1)
disp(str2)

%SelectedImage = strcat(TrainImagePath,'\',RecognizedExpression);
%SelectedImage = imread(SelectedImage);
%imshow(SelectedImage)