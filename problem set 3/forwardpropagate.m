%{
    Nicholas Willhite
    SID : 861239087
    5/14/17
    CS 171 
    Problem Set 3
%}

function [f, z] = forwardpropagate(X, W1, W2)

%appends a 1 to the front of the X value 
x = [1 X];

%multiply W1 to X to get first set of A's
a = x * W1';

%sigmoidal function to get z
%z = sigmf(a,[1 0])
z = 1 ./ (1 + exp(-1 .* a))

%appends a row of 1's to top of matrix z
%z = [1 ; z];
z = [1 z];

%multiply W2 transposed to z to get second set of A's
a1 = z * W2';

%sigmoidal function to get f
f = 1 ./ (1 + exp(-1 .* a1))
%f = sigmf(a1,[1 0])


end