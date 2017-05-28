%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function set = apriori_gen(row,activeSet)

%holder for ruleset
set = [];

for i = 1 : row - 1
    for j = i +1 : row
        
        %check setdifference and returns elements and indexs of those
        [C,ia] = setdiff(activeSet(i,:),activeSet(j,:));
        
        %check to make sure setdiff is only a difference of 1
        if size(C) == 1
            
            %unions the two sets being looked at
            join = union(activeSet(i,:),activeSet(j,:));
            
            %adds it if empty
            if isempty(set)
              set = [set join];
              
            %appends it to the end if not already in set
            else
               set = [set ; join];
            end
            
        end %end of setdiff or 1 check
        
    end % end of for J
    
end %end of for i 

%makes sure all entires are unique across rows
[~, ind] = unique(set(:,:), 'rows');
set = set(ind,:);

end %apriori_gen end

