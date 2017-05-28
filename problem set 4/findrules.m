%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function [ruleSet] = findrules(D,smin, amin)
I = items(D);
buildingSet = items(D)';
ruleSet = {};
numExam = numexamples(D);
%num = getcount(I(8),D);
C = {};

while 1
    temp = buildingSet;
    buildingSet = [];
    [trow,~] = size(temp);
    
    %gathers the support for each and if greater than smin adds to 
    %building set
    for i = 1:trow
      [s,sup] = support(temp(i,:), D, numExam, smin);
      if s == 1
        buildingSet = [buildingSet; temp(i,:)];
      end
    end
    
    %grabs size of the building set
    [brow,~] = size(buildingSet);
    
    %sends the size of buildingSet row and building set to apri_gen
    set = apriori_gen(brow,buildingSet);
    
    %sets buildingSet to the set generated from apri_gen
    buildingSet = set;

    %adds buildingSet to ruleSet{}
    ruleSet = [ruleSet buildingSet];
    
    %checks to see if building set is empty to break out of while 1 loop
    if isempty(buildingSet)
        break
    end

end

s = [];
c = []; 
rule = [];
[~, testcol] = size(ruleSet);
for i = 1:testcol

    testing = ruleSet{i};
    [rowT, ~] = size(testing);

    for j = 1:rowT

        cSet = testing(j,:);
        [~,coltest] = size(cSet);
        count = 1;
        [~,sup] = support(cSet, D, numExam, smin);
        for k = 1: coltest -1

            for m = 1: coltest - k  + 1
                %sup = support(cSet, D, numExam, smin);
                x = cSet(:, m:m+(count-1));
                [C,ia] = setdiff(cSet,x);

                %check to make sure setdiff is only a difference of 1
                if size(C) == 1
                   %check setdifference and returns elements and indexs of those 
                   y = setdiff(cSet, x);
                   denom = getcount(x, D); %denominator
                   num = getcount(union(x,y), D);
                   con = num/denom;
                end

                if(con > amin && sup > smin)
                s = [s ; sup];
                c = [c ; con];
                %disp(out);
                rule = [rule ; {rule2str(x,y,D)}];
                
            end


            end %end for m
        count = count + 1;

        end %end for k

        %sup = support(cSet, D, numExam, smin);
        %if sup == 1
        %    buildingSet = [buildingSet; cSet];
        %end   

    end %end for j
    
end %end for i 
   
tblA = table(c,s,rule);
tblB = sortrows(tblA,'c');
tblB.Properties.VariableNames = {'Confidence' 'Support' 'Rule'};
disp(tblB);

end %findrules end