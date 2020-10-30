clear all
clc
format short
stepLength=0.0001;
startPoint=[1,2];
threshold=10^(-6);
penaltyValue=[0,1, 10, 100, 1000];
matrixTable=[];

for k=1:5
my=penaltyValue(k);
iteratedTable=RunGradientDescent(startPoint, my, stepLength, threshold);
matrixTable(k,:)=iteratedTable;

end

matrixTable;
T=array2table(matrixTable,'VariableNames',{'my','x1','x2'})


