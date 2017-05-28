%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function s = support(item,D,numExam,smin)

%returns count of item
num = getcount(item,D);

%calculates support
support = num/numExam;

    % if greater 1 if not 0
    if support > smin
        s = 1;
    else
        s = 0;
    end
    
end %support end