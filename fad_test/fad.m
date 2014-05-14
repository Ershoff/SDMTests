%% Fast automatic differentiation

function [grad] = fad(p, a, ah, L, d, t, net, mc, pairs, mu)
% Initial setting
    n = size(a,1);
    dt = zeros(size(t,1),1);
    da = zeros(n,1);
    dah = zeros(n,1);
    
    p;
    for k = 1:n
        if k ~= p;
            k;
            dah(k) = d(find_arc_by_nodes_fast(pairs, p, k));
        end
    end
    
% Iteration        
 
    for l = L:-1:2
        l;
        for k = 1:n
            k;
            tau = 1/(1 + exp(- a(k,l) + ah(k,l-1)./mu));
            dah_temp(k) = dah(k) * tau;
            da_temp(k) = (1 - tau) * dah(k);    %what has to be summarized?
        end
        da = da_temp;
        dah = dah_temp;
        for k = 1:n
            k;
            
%% Trick part.      
            neigh_nodes = neigh_search(mc,k);
            NN = length(neigh_nodes);
            alpha = zeros(NN,1);
            arg = zeros(NN,1);
            for i = 1:NN
                alpha(i) = find_arc_by_nodes_fast(net, neigh_nodes(i), k);
                arg(i) = a(neigh_nodes(i),l-1) + t(alpha(i));
            end

%counting psi
            psi = ones(NN,1);
            sum_index = zeros(NN-1,1);
            for s = 1:NN
                g = 0;
                cnt = 1;
                for j = 1:NN
                    if j ~= s
                        sum_index(cnt) = j;
                        cnt = cnt + 1;
                    end
                end
                
                for j = 1:(NN-1)
                    g = g + exp(-(arg(sum_index(j)) - arg(s))/mu );
                end
                psi(s) = 1/(1+g);
            end

% dt counting            
            for s = 1:NN
                dt(alpha(s)) = dt(alpha(s)) + psi(s)*da(k);
                da_temp(neigh_nodes(s)) = da(k)*psi(s);
            end
        end
        da = da_temp;
    end

% Termination    
    for k = 1:n
        alpha = find_arc_by_nodes(net, p, k);
        if alpha ~= -1
            dt(alpha) = dt(alpha) + da(k); % tetta = 1 always in our graph.
        end 
    end
    
    grad = - dt;
end