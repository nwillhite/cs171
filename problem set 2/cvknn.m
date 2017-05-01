%{
    Nicholas Willhite
    SID : 861239087
    4/30/17
    CS 171 
    Problem Set 2
%}
function [k,lnorm] = cvknn(Xtrain,Ytrain,Xvalid,Yvalid,maxk)
% 
% a starting shell
% your solution should find the best k (from 1 to maxk, skipping even values)
% and lnorm (1 = Manhattan distance, 2 = Euclidean distance) combination
% for k-nearest neighbor using the supplied training and validation sets
%
% In doing so, it should generate a plot (do *not* call "figure" -- the
% calling function will set up for the right figure window to be active).
% The plot should be as described and illustrated in the problem set. 



%{
    decleared for later use
%}
[validrow,~] = size(Xvalid);
N = size(Xvalid);
manhattanplot = zeros (1, maxk);
euclideanplot = zeros(1, maxk);



%skips even k's so we have all odds and therefore less likely to get a tie
for m = 1:2:maxk
  manhattanerror = 0;
  for mm = 1:N
    %runs manhattan on Xtraing and Xvalid
    manhattanDist = sum(abs(bsxfun(@minus,Xtrain, Xvalid(mm,:))), 2);
    
    %tried using repmat and did not work
    %manhattanDist = sum(abs(Xtrain - repmat(Xvalid, mm)), 2);
    
    %appends the Training set Y to manhattan test
    manhattanDist = [manhattanDist, Ytrain];
    
    %sorts the manhattan test
    manhattanDist = sortrows(manhattanDist);
    
    %counter for how much error we have
    manhattancount = 0;
    for mmm = 1:m
      if manhattanDist(mmm, end) == Yvalid(mm)
         manhattancount = manhattancount + 1;
      end
    end
    %checks to see within the range or not and increments manhattan error
    if manhattancount < m/2
        manhattanerror = manhattanerror + 1;
    end
    
  end %end of for mm
    
  %validates the error and then plots the points for later use
  manhattanerror = manhattanerror / validrow;
  manhattanplot(1, m) = manhattanerror;
  
end %end of manhattan

    
for e = 1:2:maxk
  euclideanerror = 0;
  for ee = 1:N
    %runs manhattan on on Xtraing and Xvalid
    euclideanDist = sqrt(sum(bsxfun(@minus, Xtrain, Xvalid(ee,:)).^2, 2));
    
    %tried using repmat and did not work
    %euclideanDist = sqrt(sum((Xtrain - repmat(Xvalid, mm)).^2, 2));
    
    %appends the Training set Y to euclidean test
    euclideanDist = [euclideanDist, Ytrain];
    
    %sorts the euclidean test
    euclideanDist = sortrows(euclideanDist);
    
    %counter for how much error we have
    euclideancount = 0;
    for eee = 1:e
      if euclideanDist(eee, end) == Yvalid(ee)
         euclideancount = euclideancount + 1;
      end
    end
    
    %checks to see within the range or not and increments euclidean error
    if euclideancount < e/2
        euclideanerror = euclideanerror + 1;
    end
 
  end %end of for ee
    
  %validates the error and then plots the points for later use
  euclideanerror = euclideanerror / validrow;
  euclideanplot(1, e) = euclideanerror;
  
end %end of euclidean


hold on; %allows to plot multiple plots without overriding. 

%plotting the manhattan and euclidean plots
plot((1:2:maxk), manhattanplot(1:2:maxk), 'bo-');
plot((1:2:maxk), euclideanplot(1:2:maxk), 'go-');

%builds the labels and legend for the plots
xlabel('k')
ylabel('error rate')
legend('Manhattan', 'Euclidean', 'Location', 'best')

hold off;


%gives the minimum from both manhattan and euclidean
manhattanK = min(manhattanplot(1:2:maxk));
euclideanK = min(euclideanplot(1:2:maxk));
k = 0;

%compares the previously found minimums against each other to give 
%chosen k value and to give cholse lnorm
if euclideanK <= manhattanK
  for e = 1:2:maxk
    if euclideanK == euclideanplot(e) %if found update k and break out
      k = e;
      break;
    end
  end %end of for loop
  lnorm = 2;
else
  for m = 1:2:maxk
    if manhattanK == manhattanplot(m) %if found update k and break out
      k = m;
      break;
    end
  end %end of for loop
  lnorm = 1; 
end



end %end of file