%{
    Nicholas Willhite
    SID : 861239087
    4/30/17
    CS 171 
    Problem Set 2
%}
function [err,C] = knntest(TrainX, TrainY, TestX, TestY, k, lnorm)
%
% a stub
% your solution should report the total number of errors on the Test
% set using k-nearest neighbors with the supplied k and lnorm
% (lnorm=1 for Manhattan and 2 for Euclidean)
% It should also report C, the confusion matrix.  The i-j element of
% C is the fraction of the total examples who were labeled as class i
% and the true label was class j

%{
    decleared for later use
%}
N = size(TestX);
[ytestRow,~] = size(TestY);
C = zeros(3);


for i = 1:N
	setosa = 0;
	versicolor = 0;
	viriginica = 0;

  if lnorm == 1
    totaldistance = sum(abs(bsxfun(@minus,TrainX, TestX(i,:))), 2);
    %totaldistance = sum(abs(Xtrain - repmat(Xvalid, i, 1)), 2);
        
  elseif lnorm == 2
     totaldistance = sqrt(sum(bsxfun(@minus, TrainX, TestX(i,:)).^2, 2));
    %totaldistance = sqrt(sum((Xtrain - repmat(Xvalid, i, 1)).^2, 2));
  end
  
  %appends the Traing Y to the end of the totaldistance matrix
  totaldistance = [totaldistance,TrainY];
  %sorts the rows within the totaldistance matrix
  totaldistance = sortrows(totaldistance); 
  
  % totals up each when found equal to 0,1, or 2
  for ii = 1:k
    if totaldistance(ii, end) == 0
      setosa = setosa + 1;
    elseif totaldistance(ii, end) == 1
      versicolor = versicolor + 1; 
    elseif totaldistance(ii, end) == 2
      viriginica = viriginica + 1;
    end
  end

  %creates matrix of totals calculated
  m = [setosa, versicolor, viriginica];
  
  %pulls the index of the max value within m
  [~, mindex] = max(m);
  
  %shifts the index
  C(mindex, TestY(i)+1) = C(mindex, TestY(i)+1)+1;

end %end of for loop

%perfroms Element-wise right division on C with ytestRow
C = rdivide(C,ytestRow);
%find the difference in the errors within C
err = 1 - C(1, 1) - C(2, 2) - C(3, 3);

end %end of file
      