% ex 7.9
% A Szczygielski

clear all; close all;

% Verification of filter responses(FRs): amplitude, phase, impulse, step
f = 0 : 1 : 10^6;                  % frequency in hertz
w = 2*pi*f;                        % pulsation, radial frequency
s = j*w;                           % Laplace transform variable

%transfer function, multiplied by 10 for values to be the same as in the LT
%SPICE simulation
H = 10*(3042184930 ./ (s.^2 + 34088.3*s + 3042184930)) .* (3042184930 ./ (s.^2 + 89244.3*s + 3042184930)) .* (55156 ./ (s+55156));

% Plotting in subplots
figure;
semilogx(f, abs(H));
xlabel('f [Hz]');
ylabel('|H(f)| magnitude');
grid on;
title('Magnitude Response');
