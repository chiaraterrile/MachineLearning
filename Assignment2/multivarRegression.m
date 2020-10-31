function [w,X] = multivarRegression (set)
[r,c]= size(set);
X = set (:,1 :(c-1));
t = set(:,c);
w = pinv(X)*t;

end