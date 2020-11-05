function [J_mse_1,J_mse_2,J_mse_3,w1,w2,w3] = objective_95 (set1,set2,percentage,set_name1,set_name2,w1,w2,w3)
%if you want to see the plots in this case, simply uncomment, we have
%decided not to plot to make the code running faster

%For all the computations of the y (predicted values) it has been used the
%w (w1,w2,w3) obtained from the model of the 5% of the data set

[r1,c1] = size (set1);
[r2,c2] = size (set2);


x1= set1(:,1);
y1 = w1 * x1 ;

% figure
% plot(x1, y1, 'blue');
% hold on
% plot(x1,set1(:,c1),'xr');
% xlabel('x');
% ylabel('t');
% str = sprintf('Linear Regression for for the %d %s of the %s set (without interception)', percentage,"%",set_name1);
% title(str)


set2_new =[ set2(:,4) set2(:,1)] ;
x2 = set2_new(:,1);
y2 = w2(2)*x2+w2(1);

% figure
% plot(x2, y2, 'blue');
% hold on
% plot(x2,set2_new(:,2),'xr');
% xlabel('x');
% ylabel('t');
% str = sprintf('Linear Regression for for the %d %s of the %s set (with interception)', percentage,"%",set_name2);
% title(str)


set_multivar = [ set2(:,2) set2(:,3) set2(:,4)  set2(:,1)] ;
x3 = set_multivar(:, 1:3);
y3 =x3 * w3;

J_mse_1 = 0; %mean square error without interception (1D)
J_mse_2 = 0; %mean square error with interception (1D)
J_mse_3 = 0; %mean square error for multidimensional

for i = 1 : r1
    J_mse_1 = J_mse_1 + (set1(i,c1)-y1(i))^2;
    
end
for i = 1 : r2
    J_mse_2 = J_mse_2 + (set2_new(i,2)-y2(i))^2;
end
for i = 1 : r2
    J_mse_3 = J_mse_3 + (set_multivar(i,4)-y3(i))^2;
end

J_mse_1 = J_mse_1 / r1;
J_mse_2 = J_mse_2 / r2;
J_mse_3 = J_mse_3 / r2;
end
