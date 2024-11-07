% ex 5.5
clc; clear; close all; clc;

% Checking FFT and IFFT error

N = 8; % Length of the signal
x = randn(N, 1); % Random signal
x = x';

% Calculate FFT
X = FFT_choice(x, 1,N);

% Calculate Inverse FFT
xr = FFT_choice(X, -1,N);

% Compare results
err = max(abs(x - xr));

% Display error
fprintf('error between original and reconstructed %e\n', max(err));
