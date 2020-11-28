function [confusion_matrix] = perceptron(data_set,eta,k)

[m,g] = size(data_set); % m is the number of observations
d = g-1; %number of feautures
 if (eta < 0)
     error('negative values of eta are not accepted')
 end
x = data_set(:,1:d);
t = data_set(:,g);
w = rand(1,d)';
theta = 0.001; %threshold
% newx = [];
% neww = [];
r = [];
a = [];
for l = 1:m
%     newx(l) = [x(l,:),1];
%     neww(l) = [w(1,l); -teta];
%     r(l) = newx + neww;
%     a(l) = sign(r(l));
r(l) = w(l)*x(l,:)-theta;
a(l) = sign(r(l));
delta = 0.5*(t(l)-a(l));
dw = eta *delta*x(l,:);
w(l) = w(l) + dw;
end
 % bisogna capire cosa fare con a e r una volta finito il for e cosa
 % centrano con la confusion matrix
 if nargin == 3
     if k <2 || k>n
         error('invalid value of k')
     end
     
     if k == 2 % split into one training set and one test set of equal size
         half =floor( m/2) ;
         training_set = data_set(1:half, :);
         test_set = data_set(half+1 : 2*half,:);
     end
     
     if k == n % leave-one-out cross validation
         %slides pag 16 (blocco6)
     end
 end
 
    
end