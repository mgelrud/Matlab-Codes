function out = nu(x, b1, b2);
    
    x = repmat(reshape(x, [1, 1, length(x)]), [size(b1) 1]);
    out = exp(0.5 .* b2 .* (x + b1 ./ b2) .^ 2);

end