close all
clear all 
%% Lab 5a of Machine Learning : AUTOENCODERS

% Naso Rappis Cristina, Terrile Chiara

%% Task 1:

% 1. split data into subsets (case 1 and 8)

[X,T]= loadMNIST(0);
data_set = [ X , T ] ;
%randomize the data set
index = randperm(size(data_set,1));
data_set = data_set(index(1:size(data_set,1)),:);
data_set = data_set(1:600,:);
digit1 = 1;
digit2 = 8;
[subset1, subset2,target1,target2] = subsetCreator (data_set,digit1,digit2);

% 2. creation of the training set
TrainingSet = [subset1 ; subset2];
TargetSet = [target1 ; target2];

% 3. training the autoencoder
myAutoencoder = trainAutoencoder ( TrainingSet',2);

% 4. encode the different classes
myEncodedData = encode (myAutoencoder, TrainingSet');

% 5. plot the data
str = sprintf('Digit %d vs Digit %d ', digit1, digit2);
plotcl(myEncodedData', TargetSet),title(str);
