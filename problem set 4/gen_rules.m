%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function [supp,conf,rules] = gen_rules(ruleSet,D,numExam,smin,amin)

supp = [];
conf = []; 
rules = {};
[~, rulecol] = size(ruleSet);

%goes through all cells of ruleset
for i = 1:rulecol
    
    %current ruleSet cell at pos i
    rSet = ruleSet{i};
    %size of ruleSet cell at pos i
    [rowT, ~] = size(rSet);
    
    for j = 1:rowT
        
        %takes all rows with rSet for testing rules
        cSet = rSet(j,:);
        [~,coltest] = size(cSet);
        count = 1;

        for k = 1: coltest -1

            for m = 1: coltest - k  + 1
                %gathers the support for each and if greater than smin adds to 
                %building set
                [s,sup] = support(cSet, D, numExam, smin);
                if s == 1
                    %grabs all possible x sets in cSet
                    x = cSet(:, m:m+(count-1));

                    %check setdifference and returns elements and indexs of those
                    [C,ia] = setdiff(cSet,x);

                %check to make sure setdiff is only a difference of 1
                if size(C) == 1
                    %check setdifference returns element 
                    y = setdiff(cSet, x);
                    
                    %grabs the numerator
                    numerator = getcount(union(x,y), D);
                    
                    %grabs the denominator
                    denominator = getcount(x, D);
                    
                    %takes confindence
                    con = numerator/denominator;
                    
                    %check to see if smin and amin conditions are met
                    if(sup > smin && con > amin)
                        supp = [supp ; sup];
                        conf = [conf ; con];
                        rules = [rules ; rule2str(x,y,D)];
                    end
                    
                end %end of if checking size(C)

                end %end of if checking s == 1

            end %end for m

        count = count + 1;

        end %end for k 

    end %end for j

end %end for i


end

