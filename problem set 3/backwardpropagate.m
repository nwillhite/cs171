%{
    Nicholas Willhite
    SID : 861239087
    5/14/17
    CS 171 
    Problem Set 3
%}

function newdelta = backwardpropagate(d, z, w)
    
    %formula to calculate the new set of deltas
    newdelta = (w' * d) .* (z .* (1 - z))';
    
    %chops off the added ones from the forward
    newdelta = newdelta(2:end, :);
    
end

