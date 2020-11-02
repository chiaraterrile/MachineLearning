function [J_mse_1,J_mse_2] = objective (set1,set2,percentage,set_name1,set_name2)
[r1,c1] = size (set1);
[r2,c2] = size (set2);

%regression without interception (point 2.1)
flag = 0;
[w1,x1]= oneDimRegression(set1,flag);
y1 = w1 * x1 ;

figure
plot(x1, y1, 'blue');
hold on
plot(x1,set1(:,c1),'xr');
xlabel('x');
ylabel('t');
str = sprintf('Linear Regression for for the %d %s of the %s set (without interception)', percentage,"%",set_name1);
title(str)


%regression without interception (point 2.3)
set2 = set2(:, [1, c2]);
set2 =[ set2(:,2) set2(:,1)] ;
[w2,x2]= oneDimRegression(set2,1);
y2 = w2(2)*x2+w2(1);
figure
plot(x2, y2, 'blue');
hold on
plot(x2,set2(:,2),'xr');
xlabel('x');
ylabel('t');
str = sprintf('Linear Regression for for the %d %s of the %s set (with interception)', percentage,"%",set_name2);
title(str)

J_mse_1 = 0; %mean square error without interception
J_mse_2 = 0; %mean square error with interception
for i = 1 : r1
    J_mse_1 = J_mse_1 + (set1(i,c1)-y1(i))^2;
    
end
for i = 1 : r2
J_mse_2 = J_mse_2 + (set2(i,2)-y2(i))^2;
end
J_mse_1 = J_mse_1 / r1;
J_mse_2 = J_mse_2 / r2;

end