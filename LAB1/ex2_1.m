% dsp01_ex_sine.m
clear all; close all;
fs=8000; Nx=3*fs; % sampling frequency, number of samples
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)


A1=2; f1=1; p1=1; % sine: amplitude, frequency and phase
A2= 2; f2=fs+f1; p2=1; % second sinusoid params
A3 = 2; f3 = 2*fs+f1; p3 = 1; %3rd sinusoid params
calc_sine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,1);
title("f1 = 1 and adding (sine)");
calc_cosine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,1);
title("f1 = 1 and adding (cosine)");


f1 = 1; f2 = fs - f1; f3 = 2*fs-f1;
calc_sine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,2);
title("f1 = 1 and decrementing");
calc_cosine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,2);
title("f1 = 1 and decrementing");


f1 = 5; f2=fs+f1; f3 = 2*fs+f1;
calc_sine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,3);
title("f1 = 5 and adding");
calc_cosine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,3);
title("f1 = 5 and adding");

f1 = 5; f2 = fs - f1; f3 = 2*fs-f1;
calc_sine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,4);
title("f1 = 5 and decrementing");
calc_cosine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,4);
title("f1 = 5 and decrementing");

