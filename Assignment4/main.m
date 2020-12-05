clear all
close all

load('iris.txt')
%prova = iris(46:55,:);
 %[confusion_matrix_perceptron] = perceptron(iris,0.1,15);
% [confusion_matrix_adaline] = adaline(iris,0.001,2);
% [accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_perceptron);
%% 

% [X,T]= loadMNIST(0);
% [T] = TaskCreator(T,2); % puts digit 2 equal to 1 and the remaining equal to -1
% data_set = [ X  T];
% data_set_reduced = data_set(1:150,:);
% [confusion_matrix_perceptron] = perceptron(data_set_reduced,0.1,2);
% [confusion_matrix_adaline] = adaline(data_set_reduced,0.001,2);
% [accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_perceptron);

%%
load('xor_data.txt')

[confusion_matrix_perceptron] = perceptron(xor_data,0.1,2);
%[confusion_matrix_adaline] = adaline(xor_data,0.001,2);
%[accuracy,error_rate,sensitivity,specificity,precision]=equality_indexes(confusion_matrix_perceptron);
