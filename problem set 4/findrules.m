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
%C = {};

while 1
    buildingSet = [];
    temp = buildingSet;
    [trow,~] = size(temp);

    for i = 1:trow
      sup = support(temp(i,:), D, numExam, smin);
      if sup == 1
        buildingSet = [buildingSet; temp(i,:)];
      end
    end

    [brow,~] = size(buildingSet);

    set = apriori_gen(brow,buildingSet);

    buildingSet = set;

    ruleSet = [ruleSet buildingSet];
    
    if isempty(buildingSet)
        break
    end

end

end %findrules end