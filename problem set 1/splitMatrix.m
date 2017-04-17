%{
    Nicholas Willhite
    SID : 861239087
    4/16/17
    CS 171 
    Problem Set 1
%}
function [x,y] = splitMatrix(fname)

M = dlmread(fname);

msize = size(M,2) - 1;
  
    x = M(:,[1:msize]);
    y = M(:,end);

end