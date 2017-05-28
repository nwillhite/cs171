function [supp,conf,rules] = gen_rules(ruleSet,D,numExam,smin,amin)

supp = [];
conf = []; 
rules = {};
[~, testcol] = size(ruleSet);
for i = 1:testcol

testing = ruleSet{i};
[rowT, ~] = size(testing);

    for j = 1:rowT

    cSet = testing(j,:);
    [~,coltest] = size(cSet);
    count = 1;

        for k = 1: coltest -1

            for m = 1: coltest - k  + 1
                %gathers the support for each and if greater than smin adds to 
                %building set
                [s,sup] = support(cSet, D, numExam, smin);
                if s == 1
                    x = cSet(:, m:m+(count-1));

                    %check setdifference and returns elements and indexs of those
                    [C,ia] = setdiff(cSet,x);

                %check to make sure setdiff is only a difference of 1
                if size(C) == 1
                    %check setdifference and returns elements and indexs of those 
                    y = setdiff(cSet, x);

                    num = getcount(union(x,y), D);

                    denom = getcount(x, D);

                    con = num/denom;

                    if(con > amin && sup > smin)
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

