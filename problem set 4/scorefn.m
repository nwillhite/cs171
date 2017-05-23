%{
    Nicholas Willhite
    SID : 861239087
    5/28/17
    CS 171 
    Problem Set 4
%}

function gini_score = scorefn(input)

%input_size = size(input);

%grabs size of inputs rows
[inputRow,~] = size(input);
%tracks my index for going through the rows
index = 1;
%holder for the total score
gini_score = 0;

while index <= inputRow
    gini_score = gini_score + (input(index) * (1 - input(index)));
    index = index + 1;
end

end

