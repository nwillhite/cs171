%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}
function [trainX,trainY,testX,prunX,prunY] = splitMatrix()

%load in the data sets
train = load('banktrain.data');
testX = load('banktestX.data');

%grabs coloumn size for Mtrain
[row, col] = size(train);

% Determine the last row number of the top (upper) 65% of rows.
cutoff = int32(floor(0.65 * row));

%splits the x and y for training
%Get first 65%
trainX = train(1:cutoff,1:col-1);
trainY = train(1:cutoff,end);

%use the last 35% as the pruning set
prunX = train(cutoff+1:end,1:col-1);
prunY = train(cutoff+1:end,end);

end
