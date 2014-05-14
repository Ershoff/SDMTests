% Convex sum
% Input:
% 1. mat - Matrix n*m, m vectors in R^n.
% 2. flag - flag = 0, then make cvx sum, flag~=0 pick num = flag vector
% from matrix
% Output:
% 1. vec - vector equal to convex sum of m vectors.

function [vec] = convex_sum(mat, flag)
    n = size(mat,2);
    vec = zeros(size(mat,1),1);
    for i = 1:n
        vec = vec + mat(:,i)*(1/n)
    end
end