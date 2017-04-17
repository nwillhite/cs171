%{
    Nicholas Willhite
    SID : 861239087
    4/16/17
    CS 171 
    Problem Set 1
%}
function plotdata(fname)

%reads in file
M = dlmread(fname);
%gives size of columns
msize = size(M,2) - 1;
%size of circles in scatter plots
sz = 10;

for i = 1:msize
    
    x = M(:,i);
    y = M(:,end);

    sub = subplot(5,5,i);
    scatter(sub,x,y,sz,'filled'); 
    line = lsline(sub);
    set(line,'color','r');
    
end   

end