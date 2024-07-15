function B = gen_mat_B_pdp_eliptik(w1_0, w2_0, w3_0, w0_1, w0_2, w0_3, w1_4, w2_4, w3_4, w4_1, w4_2, w4_3)
    w11 = w0_1 + w1_0;
    w21 = w2_0;
    w31 = w3_0 + w4_1;
    w12 = w0_2;
    w22 = 0;
    w32 = w4_2;
    w13 = w0_3 + w1_4;
    w23 = w2_4;
    w33 = w4_3+ w3_4;
    B = [w11; w21; w31; w12; w22; w32; w13; w23; w33];
end