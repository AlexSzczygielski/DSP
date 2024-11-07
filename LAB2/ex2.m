% dsp01_ex_sine.m
% 2.2 - sampling theorem part 2
% AS

close all; clear all;
% one function plotter to plot the signals
%
% global function to adjust figures within function
global figure_number;
figure_number = 0;
%

fs=1000; Nx=10*fs; % sampling frequency, number of samples
df = 200;
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)


x1 = sin(2*pi*(0*t+0.5*df*t.^2)); % sine as a first signal component
plotter(t,[x1],"");
title("x1, smaller sampling params")
n = 1:100;
plotter(t(n),[x1(n)],"");
title("Signal x1, Showing only a n = 1:100 array of samples (zoom)");

%spectogram showing change of signal's frequency in time
figure_number = figure_number +1;
figure(figure_number)
spectrogram(x1,256,256-64,512,fs);
title("histogram x1");

listen(t,x1,fs,8);


%bigger sampling params
fs=8000; Nx=10*fs; % sampling frequency, number of samples
df = 2000;
dt = 1/fs; % sampling period
t = dt*(0:Nx-1); % sampling times (many moments)


x2 = sin(2*pi*(0*t+0.5*df*t.^2)); % sine as a first signal component
plotter(t,[x2],"");
title("x2 = x1, bigger sampling params")
n = 1:100;
plotter(t(n),[x2(n)],"");
title("Signal x2 = x1, Showing only a n = 1:100 array of samples (zoom)");

%spectogram showing change of signal's frequency in time
figure_number = figure_number +1;
figure(figure_number)
spectrogram(x2,256,256-64,512,fs);
title("histogram x2 (bigger sampling, x1 = x2)")

listen(t,x2,fs,8);