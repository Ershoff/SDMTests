function [grad] = phi_grad(t, d, L, mu, net, mc, pairs)
    step = min(t)/max(t)/10;
    grad = zeros(length(t),1);
    for i = 1:length(t)
        g = t;
        g(i) = g(i) + step;
        grad(i) = (phi(g, d, L, mu, net, mc,pairs) - phi(t, d, L, mu, net, mc, pairs))/step;
        g(i) = g(i) - step;
    end
end