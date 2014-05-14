function [val, grad] = exfun(x)

%% ||x||^2     
    val = x'*x;
    grad = 2*x;
%% exp(||x||^2)
%     val = exp(x'*x);
%     grad = 2.*x.*exp(x'*x);
end