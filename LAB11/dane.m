function [] = dane(K,r_m,N)
R = 0;
U = 4000;
%U = 5400;
K = K + U;
R = (K*r_m*((r_m+1)^N));
R = R/(((r_m+1)^N)-1);
format long g
R
end

