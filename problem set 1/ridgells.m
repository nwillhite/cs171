%{
    Nicholas Willhite
    SID : 861239087
    4/16/17
    CS 171 
    Problem Set 1
%}
function [w, b] = ridgells(X,Y,lambda)

%getting mxn size of matrix X passed in
[m,n] = size(X);

%appends a column of 1's to front of matrix X
X = [ones(m,1) X];

%gives identity matrix n+1 size(this case 14) 
identity = eye(n+1);

%sets identity matrix row 1 to 0
identity(1,:) = 0;

%w = (xTx + kI)^1xTy
w = ( ( (X' * X) + (lambda * identity) )^-1) * (X' * Y);

%takes the first entry in w and stores it into b
b = w(1,1);

%logical indexing to remove b from w
w = w(w~=b);

end

