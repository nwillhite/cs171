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

%load in the data sets
Mtrain = load('banktrain.data');
Mtest = load('banktestX.data');

%grabs coloumn size for Mtrain
msize = size(Mtrain,2) - 1;

%splits the x and y for training
trainX = Mtrain(:,[1:msize]);
trainY = Mtrain(:,end);





end

