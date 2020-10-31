%% Task 1 : Get data
clear all 
close all
mtcars = load('mtcarsdata-4features.txt');
turkish = load('turkish-se.txt');
%% Task 2 : Fit a linear regression model

%2.1 and 2.2
[r,c] = size (turkish);
row_Sub = round(r *0.1);
turkish_subset1 = turkish(1:row_Sub, :);
turkish_subset2 = turkish((r - row_Sub+1) : r ,:);
flag_turkish = 0;
[w,x]= oneDimRegression(turkish_subset1,flag_turkish);
y = w * x;
[w2,x2]= oneDimRegression(turkish_subset2,flag_turkish);
y2 = w2 * x2;

figure
plot(x, y, 'blue');
hold on
plot(x2,y2,'red');
xlabel('x');
ylabel('t');
legend('first subset','second subset')
title('Linear Regression for turkish')

%2.3
mtcars_set = mtcars(:, [1, 4]);
mtcars_set =[ mtcars_set(:,2) mtcars_set(:,1)] ;
flag_mtcars = 1 ;
[w3,x3]= oneDimRegression(mtcars_set,flag_mtcars);
y3 = w3(2)*x3+w3(1);
figure
plot(x3, y3, 'blue');
xlabel('x');
ylabel('t');
title('Linear Regression for mtcars')

%2.4
mtcars_set_multivar = [ mtcars(:,2) mtcars(:,3) mtcars(:,4)  mtcars(:,1)] ;
[w4,x4] = multivarRegression (mtcars_set_multivar);
y4 =x4 * w4;
figure
plot(x4(1), y4);
xlabel('x');
ylabel('t');
title('Linear Regression for mtcars multivariable')