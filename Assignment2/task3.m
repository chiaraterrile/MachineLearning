function [] = task3(turkish,mtcars)
[turkish_subset_5,turkish_subset_95] = subsetCreator(turkish);
[mtcars_subset_5,mtcars_subset_95] = subsetCreator(mtcars);
set_name1 = "turkish";
set_name2 = "mtcars";
[J_mse_1,J_mse_2]=objective (turkish_subset_5,mtcars_subset_5, 5,set_name1,set_name2);
fprintf('The mean square errors(objective) for regression for the 5 %s of the %s set (without interception) is : %d \n','%',set_name1,J_mse_1);
fprintf('The mean square errors(objective) for regression for the 5 %s of the %s set (with interception) is : %d \n','%',set_name2,J_mse_2);

end