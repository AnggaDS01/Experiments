function A = gen_mat_A_pdp_eliptik(n)
    W = zeros(n,n);
    count = 0;
    for i = 1:n
        count = count + 1;
        W(i,i) = 4;
        W(i,i+3) = -1;
        W(i+3,i) = -1;
        if count == 3
            count = 0;
            W(i,i+1) = 0;
            W(i+1,i) = 0;
        else
            W(i,i+1) = -1;
            W(i+1,i) = -1;
        end
    end
    A = W(1:n,1:n);
end