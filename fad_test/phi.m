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
function [fun, grad_res] = phi(t, d, L, mu, net, mc, pairs)
    value = 0; 
    grad = 0;
    for p = 1 : length(mc)
        [a, ah] = BFa(p, t, L, mu, net, mc);
        b = ah(:,L);
        
        
        for l = 1:L
            for i = 1:size(mc,1)
                if(a(i,l) == Inf)
                    a(i,l) = 100000;
                end
            end
        end
        fad_res = fad(p, a, ah, L, d, t, net, mc, pairs, mu);
        grad = grad + fad_res;
        for k = 1 : length(mc)
            if p ~= k
                
%% kostyl'
                if(b(k) ~= Inf)
                    d_comp = find_arc_by_nodes(pairs, p, k);
                    
                    if d_comp ~= -1
                        value = value + d(d_comp)*b(k);
                    end
                end
            end
        end
    end  
    fun =  - value;
    grad_res = grad;
end