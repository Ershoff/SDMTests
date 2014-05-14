
function [t, F] = PGM(len, mu, d, e, net, mc, pairs)
   
    L = 1;
    
    t = net(:,3);
     
    [fun, grad] = stohdm(t, d, len, mu, net, mc, pairs); 
    
    %Number of interation
    Num = 1;
    
    for k = 1:Num
        i = 0;
        while true
            M = (2^i) * L;
            t_new = Beta(t, grad, M);
            t_new = proj(net, t_new);
            [f_new, grad_new] = stohdm(t, d, len, mu, net, mc, pairs);
            if f_new <= fun + ...
                    grad' * (t_new - t) + ...
                    (M / 2) * (t_new - t)' * (t_new - t) + ...
                    (1/2) * e
                break;
            end
            i = i + 1;
        end
        grad = grad_new;
        t = t_new;
        L = (2^(i-1)) * L; 
    end
    
    F = f_new;
end

