%%
%Description:
%Build vextor size of nonsero position with element equal to nonzero
%position in line_find.
%
%%

function [mass] = nonzero_pos (line_find)

a = zeros(1,0);
count = 1;
for i = 1:length(line_find)
    if(line_find(i) ~= 0)
        a(count) = i;
        count = count + 1;
    end
end

mass = a;