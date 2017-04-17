%{
    Nicholas Willhite
    SID : 861239087
    4/16/17
    CS 171 
    Problem Set 1
%}
function error = llserr(X, Y, w, b)

%getting mxn size of matrix X passed in
[m,n] = size(X);

%appends a column of 1's to front of matrix X
x = [ones(m,1) X];

%places b back into the (1,1) position of matrix w 
w = [b ; w];

% f(x) = wTx
y = w'*x';

%l(y, f) = (y ? f)^2
error = (Y - y').^2;

% for getting average
error = error/m;

% L = sum of ( l(yi, f(xi)) ) 
error = sum(error(:));

end

