%% Assignment 3 of Machine Learning 
% Naso Rappis Cristina, Terrile Chiara

%% Task 1 : Obtain a data set
clear all
close all
[X_Training,T_Training]= loadMNIST(0);
[X_Test,T_Test]= loadMNIST(1);
% X_Training=gpuArray(X_Training);
% X_Test=gpuArray(X_Test);
% T_Training = gpuArray(T_Training);
% T_Test = gpuArray(T_Test);

 X_Training=X_Training(1:2000,:);
 X_Test=X_Test(1:1000,:);
 T_Training = T_Training(1:2000,:);
 T_Test = T_Test(1:1000,:);
 
% X_Training = [ 3 5 9 1; 6 2 9 5 ; 6 2 4  3; 9 2 2 1; 8 7 8 3; 1 4 2 7 ];
% T_Training = [ 1 3 2 1 1 3]';
% X_Test=[ 6 2 9 5 ;1 4 2 7  ;6 2 9 5];
% T_Test=[1,3,1]';
% T_Training = [ 0 1 3 5 0 3 0 4 7 9 10 3 4 2 2 8 6 5 ]';
% T_Test = [1 2 4 5 2 7 8 9 10 0 2 6 7]';
%% Task 2 : Build a kNN classifier
% [y]=kNN_Classifier(X_Training,T_Training,X_Test,3,T_Test);
%[y]=kNN_Classifier(X_Training,T_Training,X_Test,3);
%  reshape(X_Training(1,:), 28, 28);
%  imshow(reshape(X_Test(1,:), 28, 28))
%% Task 3:Test the kNN classifier
  accuracy=[];
  k = [1,2,3,4,5,10,15,20,30,40,50]';
  
  for i= 1 : size(k) %dim di k
      for j= 1 :10 %digits
  [T_Training_new,T_Test_new] = TaskCreator(T_Training,T_Test,j);
  [y,error_rate]=kNN_Classifier(X_Training,T_Training_new,X_Test,k(i,1),T_Test_new);
  accuracy(i,j)=error_rate;
  
      end
  end
T = array2table(accuracy,'VariableNames',{'digit = 1','digit = 2','digit = 3','digit = 4','digit = 5','digit = 6','digit = 7','digit = 8','digit = 9','digit = 10'},'RowNames',{'k = 1','k = 2','k = 3','k =  4','k = 5','k = 10','k = 15','k = 20','k = 30','k = 40','k = 50'});

