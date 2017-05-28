%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function [s,sup] = support(item,D,numExam,smin)

%returns count of item
num = getcount(item,D);

%calculates support
sup = num/numExam;

    % if greater 1 if not 0
    if sup > smin
        s = 1;
    else
        s = 0;
    end
    
end %support end