%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function findrules(D,smin, amin)
ruleSet = {};
numExam = numexamples(D);
buildingSet = items(D)';
I = items(D);
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

[supp,conf,rules] = gen_rules(ruleSet,D,numExam,smin,amin);
   
tblA = table(conf,supp,rules);
tblB = sortrows(tblA,'conf');
tblB.Properties.VariableNames = {'Confidence' 'Support' 'Rules'};
disp(tblB);

end %findrules end