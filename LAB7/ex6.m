% ex 7.6
% A Szczygielski
clc; clear; close all;

N = 5;                   % number of transfer function poles
fc=10;  f1=10;  f2=100;  % frequencies in Hz [1/s]
Rp = 3; Rs = 100;        % ripples in dB in pass, stop bands

% butterworth
[b1,a1] = butter(N, 2*pi*fc, 'low','s');                    % Lowpass
[b2,a2] = butter(N, 2*pi*fc, 'high','s');                   % Highpass
[b3,a3] = butter(N, 2*pi*[f1,f2], 'stop', 's');             % Band stop
[b4,a4] = butter(N, 2*pi*[f1,f2], 'bandpass', 's');         % Bandpass

% chebyshev 1 
[b5,a5] = cheby1(N, Rp, 2*pi*fc, 'low', 's');               % Lowpass
[b6,a6] = cheby1(N, Rp, 2*pi*fc, 'high', 's');              % Highpass
[b7,a7] = cheby1(N, Rs, 2*pi*[f1,f2], 'stop', 's');         % Band stop
[b8,a8] = cheby1(N, Rs, 2*pi*[f1,f2], 'bandpass', 's');     % Bandpass

% chebyshev 2
[b9,a9] = cheby2(N, Rp, 2*pi*fc, 'low', 's');                 % Lowpass
[b10,a10] = cheby2(N, Rp, 2*pi*fc, 'high', 's');              % Highpass
[b11,a11] = cheby2(N, Rs, 2*pi*[f1,f2], 'stop', 's');         % Band stop
[b12,a12] = cheby2(N, Rs, 2*pi*[f1,f2], 'bandpass', 's');     % Bandpass

% elliptic filters
[b13,a13] = ellip(N, Rp, Rs, 2*pi*fc, 'low', 's');            % Lowpass
[b14,a14] = ellip(N, Rp, Rs, 2*pi*fc, 'high', 's');           % Highpass
[b15,a15] = ellip(N, Rp, Rs,2*pi*[f1,f2], 'stop', 's');       % Band stop
[b16,a16] = ellip(N, Rp, Rs,2*pi*[f1,f2], 'bandpass', 's');   % Bandpass

% Verification of filter responses(FRs): amplitude, phase, impulse, step
f = 0 : 1 : 1000;                  % frequency in hertz
w = 2*pi*f;                        % pulsation, radial frequency
s = 1i*w;                          % Laplace transform variable

H1 = polyval(b1,s) ./ polyval(a1,s);  % TF for Butterworth Lowpass
H2 = polyval(b2,s) ./ polyval(a2,s);  % TF for Butterworth Highpass
H3 = polyval(b3,s) ./ polyval(a3,s);  % TF for Butterworth Band stop
H4 = polyval(b4,s) ./ polyval(a4,s);  % TF for Butterworth Bandpass

H5 = polyval(b5,s) ./ polyval(a5,s);  % TF for Chebyshev 1 Lowpass
H6 = polyval(b6,s) ./ polyval(a6,s);  % TF for Chebyshev 1 Highpass
H7 = polyval(b7,s) ./ polyval(a7,s);  % TF for Chebyshev 1 Band stop
H8 = polyval(b8,s) ./ polyval(a8,s);  % TF for Chebyshev 1 Bandpass

H9 = polyval(b9,s) ./ polyval(a9,s);  % TF for Chebyshev 2 Lowpass
H10 = polyval(b10,s) ./ polyval(a10,s);  % TF for Chebyshev 2 Highpass
H11 = polyval(b11,s) ./ polyval(a11,s);  % TF for Chebyshev 2 Band stop
H12 = polyval(b12,s) ./ polyval(a12,s);  % TF for Chebyshev 2 Bandpass

H13 = polyval(b13,s) ./ polyval(a13,s);  % TF for Elliptic Lowpass
H14 = polyval(b14,s) ./ polyval(a14,s);  % TF for Elliptic Highpass
H15 = polyval(b15,s) ./ polyval(a15,s);  % TF for Elliptic Band stop
H16 = polyval(b16,s) ./ polyval(a16,s);  % TF for Elliptic Bandpass

%Obtaining zeros and poles for all filters (bandpass and band stop)

%butterworth
z1 = roots(b3); p1 = roots(a3);     %Band stop
z2 = roots(b4); p2 = roots(a4);     %Bandpass

%cheby I
z3 = roots(b7); p3 = roots(a7);     %Band stop
z4 = roots(b8); p4 = roots(a8);     %Bandpass

%cheby II
z5 = roots(b11); p5 = roots(a11);   %Band stop
z6 = roots(b12); p6 = roots(a12);   %Bandpass

%elliptic
z7 = roots(b15); p7 = roots(a15);   %Band stop
z8 = roots(b16); p8 = roots(a16);   %Bandpass

% comparing lowpass filters designs
figure(1); sgtitle('lowpass filter designs');
    subplot(2, 1, 1)
        semilogx(f,20*log10(abs(H1)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('|H(f)| [dB]'); grid on; hold on;
        semilogx(f,20*log10(abs(H5)), "Linewidth", 2); hold on;
        semilogx(f,20*log10(abs(H9)), "Linewidth", 2); hold on;
        semilogx(f,20*log10(abs(H13)), "Linewidth", 2); hold on;
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');
    subplot(2, 1, 2)
        plot(f,unwrap(angle(H1)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('angle(H(f)) [rad]'); grid on; hold on;
        plot(f,unwrap(angle(H5)), "Linewidth", 2);
        plot(f,unwrap(angle(H9)), "Linewidth", 2);
        plot(f,unwrap(angle(H13)), "Linewidth", 2);
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');

% comparing highpass filter designs
figure(2); sgtitle('highpass filter designs');
    subplot(2, 1, 1)
        semilogx(f,20*log10(abs(H2)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('|H(f)| [dB]'); grid on; hold on;
        semilogx(f,20*log10(abs(H6)), "Linewidth", 2); 
        semilogx(f,20*log10(abs(H10)), "Linewidth", 2); 
        semilogx(f,20*log10(abs(H14)), "Linewidth", 2); 
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');
    subplot(2, 1, 2)
        plot(f,unwrap(angle(H2)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('angle(H(f)) [rad]'); grid on; hold on;
        plot(f,unwrap(angle(H6)), "Linewidth", 2);
        plot(f,unwrap(angle(H10)), "Linewidth", 2);
        plot(f,unwrap(angle(H14)), "Linewidth", 2);
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');

% comparing band stop filter designs
figure(3); sgtitle('band stop filter designs');
    subplot(2, 1, 1)
        semilogx(f,20*log10(abs(H3)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('|H(f)| [dB]'); grid on; hold on;
        semilogx(f,20*log10(abs(H7)), "Linewidth", 2); hold on;
        semilogx(f,20*log10(abs(H11)), "Linewidth", 2); hold on;
        semilogx(f,20*log10(abs(H15)), "Linewidth", 2); hold on;
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');
    subplot(2, 1, 2)
        plot(f,unwrap(angle(H3)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('angle(H(f)) [rad]'); grid on; hold on;
        plot(f,unwrap(angle(H7)), "Linewidth", 2);
        plot(f,unwrap(angle(H11)), "Linewidth", 2);
        plot(f,unwrap(angle(H15)), "Linewidth", 2);
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');

% comparing bandpass filter designs
figure(4); sgtitle('BANDPASS filter designs');
    subplot(2, 1, 1)
        semilogx(f,20*log10(abs(H4)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('|H(f)| [dB]'); grid on; hold on;
        semilogx(f,20*log10(abs(H8)), "Linewidth", 2); hold on;
        semilogx(f,20*log10(abs(H12)), "Linewidth", 2); hold on;
        semilogx(f,20*log10(abs(H16)), "Linewidth", 2); hold on;
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');
    subplot(2, 1, 2)
        plot(f,unwrap(angle(H4)), "Linewidth", 2); xlabel('f [Hz]'); ylabel('angle(H(f)) [rad]'); grid on; hold on;
        plot(f,unwrap(angle(H8)), "Linewidth", 2);
        plot(f,unwrap(angle(H12)), "Linewidth", 2);
        plot(f,unwrap(angle(H16)), "Linewidth", 2);
        legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');

% comparing zeros and poles for band stop filters;
% zeros

figure(5); sgtitle('zeros OF band stop filters');
    plot(real(z1),imag(z1),'bo');grid on; hold on;
    plot(real(z3),imag(z3),'ro');
    plot(real(z5),imag(z5),'go');
    plot(real(z7),imag(z7),'yo');
    legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');

%poles

figure(6); sgtitle('poles OF band stop filters');
    plot(real(p1),imag(p1),'bo');grid on; hold on;
    plot(real(p3),imag(p3),'ro');
    plot(real(p5),imag(p5),'go');
    plot(real(p7),imag(p7),'yo');
    legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');


% comparing zeros and poles for bandpass filters;
%zeros

figure(7); sgtitle('zeros OF bandpass filters');
    plot(real(z2),imag(z2),'bo');grid on; hold on;
    plot(real(z4),imag(z4),'ro');
    plot(real(z6),imag(z6),'go');
    plot(real(z8),imag(z8),'yo');
    legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');

%poles

figure(8); sgtitle('poles OF bandpass filters');
    plot(real(p2),imag(p2),'bo');grid on; hold on;
    plot(real(p4),imag(p4),'ro');
    plot(real(p6),imag(p6),'go');
    plot(real(p8),imag(p8),'yo');
    legend('Butterworth', 'Chebyshev-I', 'Chebyshev-II', 'Elliptic');
