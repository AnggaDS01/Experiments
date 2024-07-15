function [nodes, weight] = nodes_weight_gauss(n, u)
    poly = legendreP(n, u);
    coeff = fliplr(coeffs(poly));
    nodes = zeros(1, n);
    weight = zeros(1, n);
%     c = zeros(n,1);
    
    count = 1;
    for i = 1:n+1
        if mod(i,2) == 1
           c(i) = coeff(count);
           count = count + 1;
        end
        if mod(n,2) == 1
          c(n+1) = 0; 
        end
    end

    dummy_nodes = roots(c);
    P_diff = diff( expand(poly) );
    for i = 1:n
        weight(i) = 2 / ( (1-dummy_nodes(i)^2)*(subs(P_diff,u, dummy_nodes(i))^2) );
        nodes(i) = dummy_nodes(i);
    end
end