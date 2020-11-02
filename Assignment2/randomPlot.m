function [] = randomPlot (set,row_Sub)
y = ones (row_Sub,100);
x = ones (row_Sub,100);

for i = 1:100
[y(:,i),x(:,i)] = randomGenerator (set,row_Sub);
end
figure
plot(x(:,1), y(:,1), 'blue');
hold on
for i = 2:100
plot(x(:,i), y(:,i), 'blue');
hold on;
end
xlabel('x');
ylabel('t');
title('Linear Regression for turkish for a random subset (without interception)')

end