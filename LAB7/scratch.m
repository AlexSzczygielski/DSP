% ex 7.2
% A Szczygielski
% listing 7.1
% listing changed to display calculations in subplots

clear all; close all;

% Sampling rate
fs = 48000; % Sampling rate in samples per second

% Cutoff frequency
fc = 20000; % Cutoff frequency in Hz

% Design Butterworth filter
[b, a] = butter(6, fc/(fs/2), 'low'); % 6th order Butterworth filter

% Display coefficients
disp("Filter coefficients:")
disp("Numerator (b):")
disp(b)
disp("Denominator (a):")
disp(a)

% Plot zeros and poles
figure;
zplane(b, a);
title('Zeros and Poles');

%% Verification of filter responses(FRs): magnitude, phase, impulse, step
f = 0 : 1 : 24000; % Frequency range up to Nyquist frequency
H = freqz(b, a, f, fs); % Frequency response

% Plotting in subplots
figure;

% Magnitude response
subplot(2,2,1);
plot(f, 20*log10(abs(H)));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
title('Magnitude Response');

% Phase response
subplot(2,2,2);
plot(f, unwrap(angle(H)));
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
grid on;
title('Phase Response');

% Impulse response
subplot(2,2,3);
impulse(b, a);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Impulse Response');

% Step response
subplot(2,2,4);
step(b, a);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Step Response');

% Title for all subplots
sgtitle('Filter Responses');
