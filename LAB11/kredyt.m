close all; clear all; clc;

% R - rata miesieczna
% r_m - oprocentowanie (miesieczne)
% N - okres kredytowania (miesieczny)
R=0;
%KosztL = 182650;
KosztL = 161650;
KosztK = 166550;
Rabat = 15000;
KosztL = ((KosztL-Rabat)/2)
KosztK = (KosztK-Rabat)/2
r_m = 0.0399/12;
%r_m = 0.099/12
N = 36;
%N = 48;

disp('Rata miesieczna liftback:')
dane(KosztL,r_m,N)

disp('Rata miesieczna kombi:')
dane(KosztK,r_m,N)

