% ex 7.3
% A Szczygielski
% listing 7.1
% listing changed to display calculations in subplots

clear all; close all;
fs = 48000; % Sampling rate in samples per second

fc = (fs/2) - (0.1*fs/2) % setting cutoff half of fs and even slightly lower (10%)
                            % to ensure proper characteristic
% fc = 1/2piRC
%250 = 1/2piRC
   b = [1];  % [ b1, b0 ]
   a = [(1/(fc*2*pi)),1];                  % [ a3, a2, a1, a0=1]
   z = roots(b); p = roots(a);     % [b,a] --> [z,p] %roots - calculate roots of 
   disp("My choice")      

figure; plot(real(z),imag(z),'bo', real(p),imag(p),'r*'); grid;
title('Zeros and Poles'); xlabel('Real()'); ylabel('Imag()'); 

%%

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
title('Magnitude Response');


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
sgtitle('Filter Responses'); 
