function [J] = task3(turkish,mtcars,i)
%generating subsets at 5% and 95% of the whole set
[turkish_subset_5,turkish_subset_95] = subsetCreator(turkish);
[mtcars_subset_5,mtcars_subset_95] = subsetCreator(mtcars);
set_name1 = "turkish";
set_name2 = "mtcars";

%means square error computed on the 5% of the training data
[J_mse_1_5,J_mse_2_5,J_mse_3_5,w1,w2,w3]=objective_5 (turkish_subset_5,mtcars_subset_5, 5,set_name1,set_name2);
fprintf('ATTEMPT %d \n' ,i);
fprintf('The mean square errors(objective) for regression for the 5 %s of the %s set (1D without interception) is : %d \n','%',set_name1,J_mse_1_5);
fprintf('The mean square errors(objective) for regression for the 5 %s of the %s set (1D with interception) is : %d \n','%',set_name2,J_mse_2_5);
fprintf('The mean square errors(objective) for regression for the 5 %s of the %s set (multidimensional) is : %d \n','%',set_name2,J_mse_3_5);

%means square error computed on the 95% of the training data
[J_mse_1_95,J_mse_2_95,J_mse_3_95]=objective_95 (turkish_subset_95,mtcars_subset_95, 95,set_name1,set_name2,w1,w2,w3);
fprintf('The mean square errors(objective) for regression for the 95 %s of the %s set (1D without interception) is : %d \n','%',set_name1,J_mse_1_95);
fprintf('The mean square errors(objective) for regression for the 95 %s of the %s set (1D with interception) is : %d \n','%',set_name2,J_mse_2_95);
fprintf('The mean square errors(objective) for regression for the 95 %s of the %s set (multidimensional) is : %d \n','%',set_name2,J_mse_3_95);

J = [J_mse_1_5,J_mse_2_5,J_mse_3_5,J_mse_1_95,J_mse_2_95,J_mse_3_95];
end