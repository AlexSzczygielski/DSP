% Ex3 Szczygielski 410110
% Digital Signal Processing, AGH

clc; clear; close all; 
% generate cosine - same signal as in first task
Nx=1000; %number of samples 
fs=2000; %sampling freq
f0=fs/40; 

% signal
x=cos(2*pi*(f0/fs)*(0:Nx-1));

%Design weights of the Hilbert filter:
M=50; N=2*M+1; n=-M:M; h=(1-cos(pi*n))./(pi*n); h(M+1)=0;

stem(n,h); 
    title('h(n)'); xlabel('n'); grid on;

%Windowing - remove imperfections
 w = kaiser(N,6)'; h = h.*w;
 %w = hamming(N)'; h = h.*w;

%amplitude-frequency response and phase-frequency response:
f=-fs/2 : fs/2000 : fs/2;
H1 = polyval( h(end:-1:1), exp(-1i*2*pi*f/fs) );
H2 = freqz(h,1,f,fs);

figure;
    subplot(2, 1, 1)
        plot( f, 20*log10(abs(H1)) ); grid; xlabel('f [Hz]'); title('Amplitude - Frequency responses');
    subplot(2, 1, 2)
        plot( f, unwrap(angle(H1)) ); grid; xlabel('f [Hz]'); title('Phase - Frequency response');

% compensate phase response
figure;
    subplot(2, 1, 1)
        plot( f, unwrap(angle(H1)) ); grid; xlabel('f [Hz]'); title('Phase - Frequency response b4 compensating');
    subplot(2, 1 ,2)
        plot( f, unwrap(angle(exp(1i*2*pi*f/fs*M).*H1)) ); grid; xlabel('f [Hz]'); title('Phase - Frequency response after compensating');

% FIR hilbert filter - find xH
xH = filter(h, 1, x);
xA = hilbert(x);


%synchronise filter input with filter output
x = x(M+1 : Nx-M); % synchro input (2M+1 filter weights)
xH = xH(2*M+1 : Nx); % synchro output (2M+1 filter weights)


xa = x + 1i*xH; Nx = length(xa); % compute analytic signal

figure;
   plot(1:Nx,x,'r-',1:Nx,xH,'b-'); grid on;
%nie ma sinusa?

%circle
figure;
    plot(x,xH,'b-');hold on; grid on;
    plot(xA, 'r-'); 
    legend('From x, xH', 'From xA');

% compute fft spectra:
X = fft(x);     %original
Xa = fft(xa);   %analytic


%spectra magnitudes
frequencies = (0:Nx-1) * fs / Nx;
positive = frequencies(1:Nx/2);

figure;
    plot(positive, abs(X(1:Nx/2)), 'r', 'LineWidth', 2);
    hold on; grid on;
    plot(positive, abs(Xa(1:Nx/2)) * 2, 'b--', 'LineWidth', 2);
    hold off;
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('FFT Spectra');
    legend({'Original Signal', 'Analytic Signal * 2'});