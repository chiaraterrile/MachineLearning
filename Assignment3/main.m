%% Assignment 3 of Machine Learning 
% Naso Rappis Cristina, Terrile Chiara

%% Task 1 : Obtain a data set
clear all
close all
[X_Training,T_Training]= loadMNIST(0);
[X_Test,T_Test]= loadMNIST(1);
% X_Training = [ 3 5 9 1; 6 2 9 5 ; 6 2 4  3; 9 2 2 1; 8 7 8 3; 1 4 2 7 ];
% T_Training = [ 1 3 2 1 1 3]';
% X_Test=[ 6 2 9 5 ;1 4 2 7  ;6 2 9 5];
% T_Test=[1,3,1]';
% T_Training = [ 0 1 3 5 0 3 0 4 7 9 10 3 4 2 2 8 6 5 ]';
% T_Test = [1 2 4 5 2 7 8 9 10 0 2 6 7]';
%% Task 2 : Build a kNN classifier
% [y]=kNN_Classifier(X_Training,T_Training,X_Test,3,T_Test);
%[y]=kNN_Classifier(X_Training,T_Training,X_Test,3);

%% Task 3:Test the kNN classifier

[T_Training,T_Test] = TaskCreator(T_Training,T_Test,0);
[y]=kNN_Classifier(X_Training,T_Training,X_Test,3,T_Test);
