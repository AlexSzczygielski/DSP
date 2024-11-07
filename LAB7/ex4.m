% ex 7.4
% A Szczygielski
% listing 7.2
%dsp07_ex_analog_butter.m - analog Butterworth filters
clear all; close all;

% Design/choice of filter coefficients - low-pass Butterworth
N = 7; % number of TF poles
%Each TF pole increases negative slope of the filter transition edge by 
% 20 decibels per frequency decade (10× increase of frequency)
fc = 100; % cut-off frequency of low-pass filter

%frequency response that is as flat as possible in the passband
alpha = pi/N; % angle of one ‘‘piece of cake’’
beta = pi/2 + alpha/2 + alpha*(0:N-1); % angles of poles
R = 2*pi*fc; % circle radius
p = R*exp(j*beta); % poles placed on circle, left half-plane
%%%% choose LPF or HPF
%z = []; gain = prod(-p); % LOW-PASS: TF zeros are not used, gain
z = zeros(1,N); gain = 1; % HIGH-PASS: N TF zeros in zero, gain
%%%% 
b = gain*poly(z); a=poly(p); % [z,p] --> [b,a]
b = real(b); a=real(a); %

%circle equations (for plotting)
x = 0:pi/1000:2*pi;
c = R*cos(x);
s = R*sin(x);

%Plotting zeros and poles
figure; plot(real(z),imag(z),'bo',real(p),imag(p),'r*'); grid on; hold on
plot(c,s,'-');
title('Zeros and Poles'); xlabel('Real'); ylabel('Imaginary')

% Verification of filter responses(FRs): amplitude, phase, impulse, step
f = 0 : 1 : 1000;                  % frequency in hertz
w = 2*pi*f;                        % pulsation, radial frequency
s = j*w;                           % Laplace transform variable
H = polyval(b,s) ./ polyval(a,s);  % FR=TF for s=j*w: ratio of two polynomials

% Plotting in subplots
figure;
% Magnitude response subplot
%plot(f, abs(H));
plot(f, 20*log10(abs(H)));
xlabel('f [Hz]');
ylabel('|H(f)| [dB]');
grid on;
title('Magnitude Response in Decibels (My function)');


figure;
% Magnitude response subplot
subplot(2,2,1);
%plot(f, 20*log10(abs(H)));
semilogx(f, abs(H));
xlabel('f [Hz]');
ylabel('|H(f)| magnitude');
grid on;
title('Magnitude Response');

% Phase response subplot
subplot(2,2,2);
plot(f, unwrap(angle(H)));
xlabel('f [Hz]');
ylabel('angle(H(f)) [rad]');
grid on;
title('Phase Response');

% Impulse response subplot
subplot(2,2,3);
impulse(b, a);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Filter Response to Impulse');

% Step response subplot
subplot(2,2,4);
step(b, a);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Filter Response to Step Change');

% title
sgtitle('Filter Responses, My Function'); 

% Compare with built - in
[b2,a2]=butter(N,2*pi*fc,'low','s'); % (low or high)
H2 = polyval(b2,s) ./ polyval(a2,s);  % FR=TF for s=j*w: ratio of two polynomials

% Compare signal obtained with butter and with my implementation (zeros and
% poles)
% Plotting in subplots
figure;
% Magnitude response subplot
%plot(f, abs(H));
plot(f, 20*log10(abs(H2)));
xlabel('f [Hz]');
ylabel('|H2(f)| [dB]');
grid on;
title('Magnitude Response, Matlab Implementation (butter), Decibels');


figure;
% Magnitude response subplot
subplot(2,2,1);
%plot(f, 20*log10(abs(H2)));
semilogx(f, abs(H2));
xlabel('f [Hz]');
ylabel('|H2(f)| magnitude');
grid on;
title('Magnitude Response');

% Phase response subplot
subplot(2,2,2);
plot(f, unwrap(angle(H2)));
xlabel('f [Hz]');
ylabel('angle(H2(f)) [rad]');
grid on;
title('Phase Response');

% Impulse response subplot
subplot(2,2,3);
impulse(b2, a2);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Filter Response to Impulse');

% Step response subplot
subplot(2,2,4);
step(b2, a2);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Filter Response to Step Change');

% title
sgtitle('Filter Responses, Matlab Implementation (butter)'); 

