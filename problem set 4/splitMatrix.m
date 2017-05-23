%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}
function [trainX,trainY,Mtest,prunX,prunY] = splitMatrix()

%load in the data sets
Mtrain = load('banktrain.data');
Mtest = load('banktestX.data');

%grabs coloumn size for Mtrain
[row, col] = size(Mtrain);

% Determine the last row number of the top (upper) 65% of rows.
lastRow = int32(floor(0.65 * row));

%splits the x and y for training
%Get first 65%
trainX = Mtrain(1:lastRow,[1:col-1]);
trainY = Mtrain(1:lastRow,end);

%use the last 35% as the pruning set
prunX = Mtrain(lastRow+1:end,[1:col-1]);
prunY = Mtrain(lastRow+1:end,end);

end
