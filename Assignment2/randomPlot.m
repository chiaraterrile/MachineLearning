function [] = randomPlot (set,row_Sub)
y = ones (row_Sub,10);
x = ones (row_Sub,10);

for i = 1:10
[y(:,i),x(:,i)] = randomGenerator (set,row_Sub);
end
figure
plot(x(:,1), y(:,1), 'blue');
hold on
for i = 2:10
plot(x(:,i), y(:,i), 'blue');
hold on;
end
xlabel('x');
ylabel('t');
title('Linear Regression for turkish for a random subset (without interception)')

end