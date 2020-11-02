function[y,x] = randomGenerator (set,row_Sub)
[r,c] = size (set);
allIndices = randperm(r);
randomSubset = allIndices (1 : row_Sub);
random_set = set(randomSubset,:);
[w,x]= oneDimRegression(random_set,0);
y = w * x;
end