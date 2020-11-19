%% Assignment 3 of Machine Learning 
% Naso Rappis Cristina, Terrile Chiara

%% Task 1 : Obtain a data set
clear all
close all
[X_Training,T_Training]= loadMNIST(0);
[X_Test,T_test]= loadMNIST(1);

%% Task 2 : Build a kNN classifier
k=4;
%[y,distances]=kNN_Classifier(X_Training,T_Training,X_Test,3);
[n,d] = size(X_Training);
m = size(X_Test,1); 
%controls on the input values
if size(T_Training) ~= n
    error (' the size of the class label in the training set is incorrect');
end
if size(X_Test,2) ~= d
    error (' the size of the test set is incorrect');
end
if k<0 || k >= n
    error (' the k value is not valid');
end



    y = zeros(m,1);
    for z = 1 : m
    X_bar=X_Test(z,:);
    distances = zeros(n,1);
    val = 0;
    for i = 1:n
        for j = 1:d
            val = val + (X_Training(i,j)- X_bar(1,j))^2;
        end
        val = sqrt (val);
        distances(i,1)=val;
        
    end
     [ordered_dist,index] = sort(distances);
     k_index = index(k,:);
     k_label = T_Training(k_index);
     y(z,1) = mode (k_label);
    end
