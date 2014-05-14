
function B = Beta(x, grad, M)

    B = -(grad - M * x)/M;
    
end

