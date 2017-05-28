%{
    Nicholas Willhite
    SID : 861239087
    4/30/17
    CS 171 
    Problem Set 2
%}
function runq1()


%{
    decleared for later use
%}

%lambdas = logspace(-1,5,20);  
lambdas = [.001, .01, 1, 100, 1000, 10000];

%getting coloumn size of matrix lambdas
%[lrow,lcol] = size(lambdas);

totalerror = zeros(2, size(lambdas, 2));

M = load('phishing.dat');

%gives size of columns
msize = size(M,2) - 1;

%makes X a matrix of size all rows by number of columns - 1 (8000,30)
X = M(:,1:msize);

%getting row size of matrix X
[xrow,xcol] = size(X);

%appends a column of 1's to front of matrix X
linearX = [ones(xrow,1) X];
quadraticX = [ones(xrow,1) X];

%using the built in bsxfun funtion which does X1*X1, x1*x2 so so forth
%I create a new quadratic X matrix by appending the newfeatures to the end
%of it
for i = 1:xcol
    newfeatures = bsxfun(@times, X(:, i), X(:, i:end));
    quadraticX = [quadraticX newfeatures];
end

%makes Y a matrix of size rows by last column (8000,1)
Y = M(:,end);

%getting row size of matrix Y
[yrow,~] = size(Y);


%{
    start of program
%}

%linear for loop to check for the errors
for l = 1:size(lambdas, 2)  
    weight = learnlogreg(linearX, Y, lambdas(1,l)); 
    regulizer = linearX * weight;
    count = 0;
    
    for row = 1:yrow
        if regulizer(row, 1) * Y(row, 1) > 1
            count = count + 1;
        end
    end
    
    totalerror(1, l) = count / yrow;
    
end

%quadratic for loop to check for the errors
for l = 1:size(lambdas, 2)  
    weight = learnlogreg(quadraticX, Y, lambdas(1,l)); 
    regulizer = quadraticX * weight;
    count = 0;
    
    for row = 1:yrow
        if regulizer(row, 1) * Y(row, 1) > 1
            count = count + 1;
        end
    end
    
    totalerror(2, l) = count / yrow; 
end


maxerror = ones(size(totalerror)) - totalerror;

%grabs the index from linear and quadratic
[~, Lindex] = max(maxerror(1, :));
[~, Qindex] = max(maxerror(2, :));

%gets the index from the max error
[~,index] = max(maxerror(:));

%check is the max degree is even
maxindex = mod(index,2);

%if even it's quadratic else it's linear
if maxindex == 0
    degree = 'quadratic';
    lambdaIndex = Qindex;
else
    degree = 'linear';
    lambdaIndex = Lindex;
end

%finds the value at the lambdaIndex
lambdaval = lambdas(1, lambdaIndex);
    
model = ['Model Selected : ', degree];
regularization = ['regularization strength : ', num2str(lambdaval)];
    
disp(model);
disp(regularization);

    
end