% Ex2 Szczygielski 410110
% Digital Signal Processing, AGH
close all; clear all; 

% generate cosine - same signal as in first task
Nx=1000; %number of samples 
fs=2000; %sampling freq
f0=fs/40; x=cos(2*pi*(f0/fs)*(0:Nx-1));

%Design weights of the Hilbert filter:
M=50; N=2*M+1; n=-M:M; h=(1-cos(pi*n))./(pi*n); h(M+1)=0;

stem(n,h); title('h(n)’); xlabel(’n'); grid; 


%amplitude-frequency response and phase-frequency response:
f=-fs/2 : fs/2000 : fs/2;
H1 = polyval( h(end:-1:1), exp(-j*2*pi*f/fs) );
H2 = freqz(h,1,f,fs);
subplot(2,1,1)
plot( f, 20*log10(abs(H1)) ); grid; xlabel('f [Hz]');
subplot(2,1,2)
plot( f, unwrap(angle(H1)) ); grid; xlabel('f [Hz]');

%windowing
w=kaiser(N,10); h = h.*w;