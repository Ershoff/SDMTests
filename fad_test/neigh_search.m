%% Finding neighborhoods which follows to given node
% Input:
% 1. mc - conectivity matrix
% 2. node - given node
% Output:
% 1. neigh_nodes - node numbers

function [neigh_nodes] = neigh_search(mc,node)
    count = 0;
    neigh_nodes = zeros(0,1);
    for i = 1:size(mc,1)
        if((mc(i, node) == 1) && (node ~= i))
            count = count + 1;
            neigh_nodes(count) = i;    %need to preallocate memmory, 
            % but don't know how, cause can't predict the size of vector
        end  
    end
end