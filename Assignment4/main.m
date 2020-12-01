clear all
close all

load('iris.txt')
prova = iris(46:55,:);
[prova,confusion_matrix] = perceptron(iris,0.1,150);
