function [] = task2(turkish,mtcars)
%2.1 and 2.2
[r,c] = size (turkish);
%applying the regression to the whole set
flag_turkish = 0;
[w,x]= oneDimRegression(turkish,flag_turkish);
y = w * x ;

figure
plot(x, y, 'blue');
hold on
plot(x,turkish(:,2),'xr');
xlabel('x');
ylabel('t');
title('Linear Regression for for the whole turkish set (without interception)')

row_Sub = round(r *0.1);

randomPlot (turkish,row_Sub);

%taking the first 10% of the subset and the last 10% of the subset

turkish_subset1 = turkish(1:row_Sub, :);
turkish_subset2 = turkish((r - row_Sub+1) : r ,:);
[w1,x1]= oneDimRegression(turkish_subset1,flag_turkish);
y1 = w1 * x1;
[w2,x2]= oneDimRegression(turkish_subset2,flag_turkish);
y2 = w2 * x2;

figure
plot(x1, y1, 'blue');
hold on
plot(x1,turkish_subset1(:,2),'xr');
xlabel('x');
ylabel('t');
title('Linear Regression for turkish subset1 (without interception)')

figure
plot(x2, y2, 'blue');
hold on
plot(x2,turkish_subset2(:,2),'xr');
xlabel('x');
ylabel('t');
title('Linear Regression for turkish subset2 (without interception)')


figure
plot(x1, y1, 'blue');
hold on
plot(x2,y2,'red');
xlabel('x');
ylabel('t');
legend('first subset','second subset')
title('Linear Regression for turkish comparing the two subsets (without interception)')

%2.3
mtcars_set = mtcars(:, [1, 4]);
mtcars_set =[ mtcars_set(:,2) mtcars_set(:,1)] ;
flag_mtcars = 1 ;
[w3,x3]= oneDimRegression(mtcars_set,flag_mtcars);
y3 = w3(2)*x3+w3(1);
figure
plot(x3, y3, 'blue');
hold on
plot(x3,mtcars_set(:,2),'xr');
xlabel('x');
ylabel('t');
title('Linear Regression for mtcars (with interception)')

%2.4
mtcars_set_multivar = [ mtcars(:,2) mtcars(:,3) mtcars(:,4)  mtcars(:,1)] ;
[w4,x4] = multivarRegression (mtcars_set_multivar);
y4 =x4 * w4;
% figure
% plot(x4(1), y4);
% xlabel('x');
% ylabel('t');
% title('Linear Regression for mtcars multivariable')
end