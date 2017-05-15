%{
    Nicholas Willhite
    SID : 861239087
    5/14/17
    CS 171 
    Problem Set 3
%}

function newdelta = backwardpropagate(d, z, w)
    
    newdelta = (w' * d) .* (z .* (1 - z))';
    newdelta = newdelta(2:end, :);
    
end

