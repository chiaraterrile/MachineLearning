clear all
close all
%% Lab 4a : Single unit neural networks

% Naso Rappis Cristina, Terrile Chiara

%% Task2 


%% Iris data set

load('iris.txt')
dataset = importdata('iris.txt');

index = randperm(size(dataset,1));
dataset = dataset(index(1:size(dataset,1)),:);
[confusion_matrix_perceptron,n_iter_perceptron] = perceptron(dataset,0.1,2,1,-1);
[confusion_matrix_adaline,n_iter_adaline] = adaline(dataset,0.001,2,1,-1);
% [accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_perceptron);
% [accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_adaline);

%% MNIST data set

%  [X,T]= loadMNIST(0);
%  [T] = TaskCreator(T,2); % puts digit 2 equal to 1 and the remaining equal to -1
%  data_set = [ X  T];
%  data_set_reduced = data_set(1:150,:);
% [confusion_matrix_perceptron,n_iter_perceptron] = perceptron(data_set_reduced,0.1,2,1,-1);
% [confusion_matrix_adaline,n_iter_adaline] = adaline(data_set_reduced,0.001,2,1,-1);
% [accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_perceptron);

%% XOR data set

load('xor_data_modified.txt')

% [confusion_matrix_perceptron,n_iter_perceptron] = perceptron(xor_data_modified,0.1,2,1,-1);
% [confusion_matrix_adaline,n_iter_adaline] = adaline(xor_data_modified,0.001,2,1,-1);
%[accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_perceptron);
