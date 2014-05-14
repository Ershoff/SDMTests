%test banch for universal primal gradient method
    clc; clear;
    
    e = 0.1;
    L = 1;
    
    x = [1;2;3];
    [f, grad] = exfun(x);
    
    %Number of interation
    Num = 2002;
    
    for k = 1:Num
        i = 0;
        while true
            M = (2^i) * L;
            x_new = Beta(x, grad, M);
            [f_new, grad_new] = exfun(x_new);
            f,f_new
%             f,x,M,f_new,x_new;
            if (f_new < (f + e/2))
                break;
            end
            i = i + 1;  
        end
        f = f_new;
        grad = grad_new;
        x = x_new;
        L = M/2; 
    end
    
    F = f_new;
    x_res = x
    grad;

