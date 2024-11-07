% ex 7.1
% A Szczygielski
% listing 7.1
% listing changed to display calculations in subplots

clear all; close all;

choice = 0;
% Design/choice of filter coefficients - transfer function (TF) polynomials
if(choice)  % choosing polynomial coefficients
   b = [2,1];                      % [ b1, b0 ]
   a = [5,4,3,1];                  % [ a3, a2, a1, a0=1]
   z = roots(b); p = roots(a);     % [b,a] --> [z,p] %roots - calculate roots of 
   disp("My choice")                                 % polynommial with                                                % such coeffs
else   % choosing polynomial roots
   disp("roots from polynomial (from provided frequency)")
   %gain = 0.001;
   gain = 5;
   z = j*2*pi*[0,300];         z = [z conj(z)]; % z = j2pi*f
   p = [-1,-1] + j*2*pi*[400]; p = [p conj(p)];
   b = gain*poly(z);  a = poly(p); % [z,p] --> [b,a]
end
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
subplot(2,2,1);
%plot(f, abs(H));
plot(f, 20*log10(abs(H)));
xlabel('f [Hz]');
ylabel('|H(f)| [dB]');
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
