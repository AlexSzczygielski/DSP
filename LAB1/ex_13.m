clc; clear; close all;

fs=8000; Nx= 3 * fs;                 % sampling frequency, number of samples
dt = 1/fs;                      % sampling period
t = dt*(0:Nx-1);                % sampling times (many moments)

% vals set 1
A1=5; f1=100; p1=pi/4;          % sine: amplitude, frequency and phase
sinus = A1 * sin(2*pi*f1*t+p1);    % sine as a first signal component



s1 = rand(1,Nx);  s1 = 0.1*(2*(s1-0.5)); % uniform; scaling to [-0.1,0.1]
s2 = randn(1,Nx);  s2 = 0.1*s2; % Gaussian; scaling to std=0.1
s2 = s2+sinus;
figure
subplot(221); plot(s1,'.-'); grid; title('Uniform [0,1] noise');
subplot(222); plot(s2,'.-'); grid; title('Gaussian noise');
subplot(223); hist(s1,20); title('Histogram of uniform noise');
subplot(224); hist(s2,20); title('Histogram of Gaussian noise');
