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
[row, col] = size(Mtrain);
msize = size(Mtrain,2) - 1

% Determine the last row number of the top (upper) 65% of rows.
lastRow = int32(floor(0.65 * row));

%splits the x and y for training
%Get first 65%
trainX = Mtrain(1:lastRow,[1:col-1]);
%[trow, tcol] = size(trainX);
trainY = Mtrain(1:lastRow,end);
[trow, tcol] = size(trainY)


%use the last 35% as the pruning set
prunX = Mtrain(lastRow+1:end,[1:col-1]);
%[prow, pcol] = size(prunX);
prunY = Mtrain(lastRow+1:end,end);
%[prow, pcol] = size(prunY)



Y = 0;
dt = 0;
end

