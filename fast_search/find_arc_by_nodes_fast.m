function [arc] = find_arc_by_nodes_fast(net, node_o, node_d)
    n = size(net,1)
    first = 1;
    last = n;
    a = net(:,1);
    while (first < last) 
        mid = fix(first + (last - first) / 2);
 
        if (node_o <= a(mid))
            last = mid;
        else
            first = mid + 1;
        end
    end
    
    j = 1;
    if (a(last) == node_o) 
        for i = 1:10
            if a(last -5 + i) == node_o
                mass(j) = last -5 + i;
                j = j + 1;
            end
        end
    end
    
    for i = 1:length(mass)
        if(net(mass(i),2) == node_d)
            arc = mass(i)
            break
        else
            arc = -1;
        end
    end
                
end