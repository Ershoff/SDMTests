%% Description: Computing potential function for all net.
% Input:
% 1. net - information about network [node_o, node_d, time, flow]
% 2. mc - connectivity matrix
% 3. t - arc time vector
% 4. L - length of the max path
% 5. mu - constant of the model
% Output:
% 1. fun - value of the potential function
%% algo:
function [value] = phi(t, d, L, mu, net, mc, pairs)
    value = 0;
    for p = 1 : length(mc)
        a = BFa(p, t/mu, L, mu, net, mc);
        for k = 1 : length(mc)
            if p ~= k
                value = value + d(find_arc_by_nodes(pairs, p, k))*a(k)
            end
        end
    end
    value = -mu*log(value);  
end