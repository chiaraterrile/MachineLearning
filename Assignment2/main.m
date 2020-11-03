%% Task 1 : Get data
clear all 
close all
mtcars = load('mtcarsdata-4features.txt');
turkish = load('turkish-se.txt');
%% Task 2 : Fit a linear regression model
task2(turkish,mtcars);

%% Task 3
J = ones(6,10);
for i= 1:10
J(:,i) = task3(turkish,mtcars,i);
end
%table containing the mean square errors for 10 random splits
T = array2table(J,'VariableNames',{'Attempt1','Attempt2','Attempt3','Attempt4','Attempt5','Attempt6','Attempt7','Attempt8','Attempt9','Attempt10'},'RowNames',{'J_mse_1_5(1D without int)','J_mse_2_5(1D with int)','J_mse_3_5(multidim)','J_mse_1_95(1D without int)','J_mse_2_95(1D with int)','J_mse_3_95(multidim)'});