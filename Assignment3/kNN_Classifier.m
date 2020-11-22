function [y,error_rate]=kNN_Classifier(X_Training,T_Training,X_Test,k,T_Test)
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
%kNN classifier
    y = zeros(m,1);
    for z = 1 : m
    distances = zeros(n,1);
    
    for i = 1:n
        val = 0;
        for j = 1:d
            val = val + (X_Training(i,j)- X_Test(z,j))^2;
        end
        val1 = sqrt (val);
        distances(i,1)=val1;
        
    end
     [ordered_dist,index] = sort(distances);
     k_index = index(k,:);
     k_label = T_Training(k_index);
     y(z,1) = mode (k_label);
    end
%if the test set is available we use it to compute the error rate of the classifier 
if nargin == 5
    count_err = 0;
    for i = 1 : m
        if y(i,1) ~= T_Test(i,1)
            count_err = count_err + 1 ;
        end
    end
    error_rate = count_err/m;
    fprintf('The error rate is %d \n',error_rate);
end

end