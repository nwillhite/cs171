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
      sup = support(temp(i,:), D, numExam, smin);
      if sup == 1
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

   

end %findrules end