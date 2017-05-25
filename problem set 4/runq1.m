%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function [Y,dt,pdt] = runq1()

%For the bank dataset the vector should be 
%(you may hard-code this into your function)
ftype= [0 12 4 8 3 3 3 2 0 0 0 0 0 3 0 0 0 0 0];

[trainX,trainY,Mtest,prunX,prunY] = splitMatrix();

dt = learndt(trainX, trainY, ftype, @scorefn);
%drawdt(dt);
pdt = prunedt(dt,prunX,prunY);
%drawdt(pdt);
Y = predictdt(pdt,Mtest);
drawdt(pdt);

end
