%{
    Nicholas Willhite
    SID : 861239087
    5/14/17
    CS 171 
    Problem Set 3
%}

function [W1, W2] = trainneuralnet(X,Y,nhid,lambda)

%getting row size of matrix X
[Xrow,Xcol] = size(X);

%for keeping track of every 1000 iterations
pbreak = 0;

% load in and set up trainX as the training X pts and trainY as the Y pts
gridX = getgridpts(X);
[gridXrow,~] = size(gridX); %getting row size of matrix gridX

%mean and unit std deviation values
mean = 0;
usd = 1;

%Create a vector of (nhid by size of Xcol) random values drawn
%from a normal distribution with a mean of 0 and a standard deviation of 2.
W1 = usd.*randn(nhid, Xcol+1) + mean;
%[W1row,W1col] = size(W1);

%Create a vector of (nhid+1 by 1) random values drawn
%from a normal distribution with a mean of 0 and a standard deviation of 2.
W2 = usd.*randn(1, nhid+1) + mean;
%[W2row,W2col] = size(W2);


while 1 
  
  %zero matrix for the deltaWs 
  gradientW1 = zeros(size(W1));
  gradientW2 = zeros(size(W2));
    
  %counter for 1000 iterations break
  pbreak = pbreak + 1;  
    
  % n = 0.1
  eta = 0.1;
 
  for i = 1:Xrow
    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % forward and backward block                                 %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
      
    %uses forward propagation to go forward through the neruralnetwork
    [f, z] = forwardpropagate(X(i,:),W1,W2); 

    %calculates delta by subtracting f for y at current position
    delta = f - Y(i);
    
    %uses backward propagation to go forward through the neruralnetwork
    newdelta = backwardpropagate(delta,z,W2);
    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Block for updating the weights                             %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    %used to update the new weights to add to the gradient weights
    dXw2 = delta * z;
    dXw1 = newdelta * [1 X(i,:)];
  
    %adds in the new calculated weights into the gradient
    gradientW1 = gradientW1 + dXw1;
    gradientW2 = gradientW2 + dXw2;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
  end % end of for loop ii
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %  Regulate and check gradient weight before adding eta      %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
  %Check the maximum gradient element (before multiplying it by eta). 
  %If it is less than 1e - 4, stop the algorithm.
  gradientW1 = (gradientW1./Xrow) + (2 .* lambda .* W1);
  gradientW2 = (gradientW2./Xrow) + (2 .* lambda .* W2);
  
  %grabs the max of the absolute value of the gradient
  max1 = max(abs(gradientW1));
  max2 = max(abs(gradientW2));
  
  %checks for the breaking condition of the max of the max of the grabbed
  %above
  if max(max1) < 0.0001 && max(max2) < 0.0001
     break;
  end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
  %adding in the eta into the weights
  W1 = W1 + (-eta .* gradientW1);
  W2 = W2 + (-eta .* gradientW2);

  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Generating the plots for 1000 iterations for test          %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  plotsurface = mod(pbreak,1000);
  
  %{
  if plotsurface == 0
    gridY = [];
     
    for ii = 1:gridXrow
      [f, ~] = forwardpropagate(gridX(ii, :), W1, W2);
      gridY = [gridY ; f];
    end
    plotdecision(X, Y, gridX, gridY);
    drawnow;
  end
  %}

end % end while loop
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %      Final output block for generating the plots           %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  gridY = [];
  
  for iii = 1:gridXrow
    [f, ~] = forwardpropagate(gridX(iii, :), W1, W2);
    gridY = [gridY ; f];
  end
  
  plotdecision(X, Y, gridX, gridY);
  drawnow;
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
   
end % end function

