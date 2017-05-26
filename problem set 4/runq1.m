%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function [Y,dt] = runq1()

%For the bank dataset the vector should be 
%(you may hard-code this into your function)
ftype= [0 12 4 8 3 3 3 2 0 0 0 0 0 3 0 0 0 0 0];

%function for splitting up the training and pruning data
[trainX,trainY,testX,prunX,prunY] = splitMatrix();

dt = learndt(trainX, trainY, ftype, @scorefn);
pdt = prunedt(dt,prunX,prunY);
Y = predictdt(pdt,testX);
drawdt(pdt);

end
