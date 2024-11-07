% Ex1
% AGH, Wiet, DSP 2024
% Szczygielski
% dsp08_ex_iir_matlab.m

% problem z plottowaniem na koncu

% stop band
clear all; close all;

fpr=2000; f1=400; f2=600; N=8; Rp=3; Rs=100; % 1) filter design requirements
% Rs - ripple in band stop
% Rp - ripple in pass band
% fpr = fs (sampl freq)
[b,a] = ellip(N, Rp, Rs, [f1,f2]/(fpr/2), 'stop'); % 2) filter design
Npunkt=1000; freqz(b,a,Npunkt,fpr); % 3) verification of filter H(f)
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; % 4) signal parameters
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t); % 5) signal generation
y = filter(b,a,x); % 6) signal filtration - two sums

% 7) filtration result - changed a little to show legend
figure;
plot(t, x, 'b-', t, y, 'r-');
title('We/Wy - stop band');
legend('We', 'Wy', 'Location', 'northeast');
hold on;

%%
% highpass

clear all; close all;

fpr=2000; f1=500; N=8; Rp=3; Rs=80; % 1) filter design requirements
% Rs - ripple in band stop
% Rp - ripple in pass band
% fpr = fs (sampl freq)
[b,a] = ellip(N, Rp, Rs, f1/(fpr/2), 'high'); % 2) filter design
Npunkt=1000; freqz(b,a,Npunkt,fpr); % 3) verification of filter H(f)
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; % 4) signal parameters
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t); % 5) signal generation
y = filter(b,a,x); % 6) signal filtration - two sums

% 7) filtration result - changed a little to show legend
figure;
plot(t, x, 'b-', t, y, 'r-');
title('We/Wy - highpass');
legend('We', 'Wy', 'Location', 'northeast');

%%
% alternative - filter builder
clear all; close all;
%filterBuilder

% stop band
clear all; close all;

fpr=2000;
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; % 4) signal parameters
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t); % 5) signal generation

% filter the signal using the Filter Builder script
yy = band_stop_ex1(x);

% 7) filtration result - changed a little to show legend
figure;
plot(t, x, 'b-', t, yy, 'r-');
title('We/Wy - stop band, Filter Builder');
legend('We', 'Wy', 'Location', 'northeast');

