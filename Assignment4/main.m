clear all
close all

load('iris.txt')
%prova = iris(46:55,:);
[confusion_matrix_perceptron] = perceptron(iris,0.1,2);
[confusion_matrix_adaline] = adaline(iris,0.01,2);
%% 

[X,T]= loadMNIST(0);
[T] = TaskCreator(T,2); % puts digit 2 equal to 1 and the remaining equal to -1
data_set = [ X  T];
data_set_reduced = data_set(1:150,:);
%[confusion_matrix] = perceptron(data_set_reduced,0.1,2);

