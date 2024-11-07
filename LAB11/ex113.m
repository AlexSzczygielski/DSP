% DIGITAL SIGNAL PROCESSING LAB 11
% EXERCISE 11.3 KONRAD WŁODARCZYK 417751

clc; clear; close all;

%PROGRAM PASTED FROM EXERCISE 2
%USING THE SAME SIGNAL AS IN THE PREVIOUS PROBLEM
%PARAMETERS FOR COSINE
Nx = 1000; 
fs = 2000;
f0 = fs/40;

%GENERATING THE COSINE SIGNAL
x = cos(2*pi*(f0/fs)*(0:Nx-1));

%DESIGNING WEIGHTS OF THE HILBERT FILTER 
M=50; N=2*M+1; n=-M:M; h=(1-cos(pi*n))./(pi*n); h(M+1)=0;

stem(n,h); 
    title('h(n)'); xlabel('n'); grid on;

%REMOVING THE FILTER IMPERFECTIONS 
 w = hamming(N)'; h = h.*w;

%COMPUTING THE AMPLITUDE AND PHASE - FREQUENCY RESPONSES
f=-fs/2 : fs/2000 : fs/2;
H1 = polyval( h(end:-1:1), exp(-1i*2*pi*f/fs) );
H2 = freqz(h,1,f,fs);

figure(2)
    subplot(2, 1, 1)
        plot( f, 20*log10(abs(H1)) ); grid; xlabel('f [Hz]'); title('Amplitude - Frequency responses');
    subplot(2, 1, 2)
        plot( f, unwrap(angle(H1)) ); grid; xlabel('f [Hz]'); title('Phase - Frequency response');

%COMPANSATING THE PHASE RESPONSE
figure(3)
    subplot(2, 1, 1)
        plot( f, unwrap(angle(H1)) ); grid; xlabel('f [Hz]'); title('Phase - Frequency response b4 compensating');
    subplot(2, 1 ,2)
        plot( f, unwrap(angle(exp(1i*2*pi*f/fs*M).*H1)) ); grid; xlabel('f [Hz]'); title('Phase - Frequency response after compensating');

%USING THE FIR HILBERT FILTER TO FIND xH
xH = filter(h, 1, x);
xA = hilbert(x);

%SYNCHRONISING THE INPUT AND OUTPUT OF THE FILTER
x = x(M+1 : Nx-M); % synchro of filter input (2M+1 filter weights)
xH = xH(2*M+1 : Nx); % synchro of filter output (2M+1 filter weights)

xa = x + 1i*xH; Nx = length(xa); % analytic signal creation

%PLOTTING SYNCHRONISED SIGNALS IN ONE PLOT
figure(5)
   plot(1:Nx,x,'r-',1:Nx,xH,'b-'); grid on;

   %NO NIE WYCHODZI SINUS NIESTETY NIEWAZNE CO ZROBIE A Z POLECENIA WZIETE

%PLOTTING A CIRCLE
figure(6)
    plot(x,xH,'b-');hold on; grid on;
    plot(xA, 'r-'); 
    legend('From x, xH', 'From xA');

%CALCULATING THE FFT SPECTRA
X = fft(x);     %SPECTRA OF THE ORIGINAL SIGNAL 
Xa = fft(xa);   %SPECTRA OF THE ANALYTIC VERSION

%PLOTTING SPECTRA MAGNITUDES
frequencies = (0:Nx-1) * fs / Nx;
positive = frequencies(1:Nx/2);

figure(6);
    plot(positive, abs(X(1:Nx/2)), 'r', 'LineWidth', 2);
    hold on; grid on;
    plot(positive, abs(Xa(1:Nx/2)) * 2, 'b--', 'LineWidth', 2);
    hold off;
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('FFT Spectra');
    legend({'Original Signal', 'Analytic Signal * 2'});
    