DataSet=load ("WeatherDataSetNumbers.txt");
[r,c] = size(DataSet);
P = randperm(r); %vector of random values used to extract submatrices in a random way
pTraining = P(1:10);
pTest = P(11:r);
TrainingSet = DataSet(pTraining, :);
TestSet = DataSet(pTest, :);
%% NaiveBayesClassifier
NaiveBayesClassifier(TrainingSet, TestSet);

%% preparation of data for Classifier with LaplaceSmoothing
levels = [3 3 2 2 2];
TrainingSetNew = [ levels ; TrainingSet] ;
TestSetNew = [levels ; TestSet];
NaiveBayesClassifierLaplace(TrainingSetNew,TestSetNew);




