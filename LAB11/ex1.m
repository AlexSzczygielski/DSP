% Ex1 Szczygielski 410110
% Digital Signal Processing, AGH
close all; clear all; 

% generate cosine
Nx=1000; %number of samples 
fs=2000; %sampling freq
f0=fs/40; x=cos(2*pi*(f0/fs)*(0:Nx-1));

% calculate analytic signal (Matlab function)
xa1=hilbert(x);

X=fft(x);
n=1:Nx/2; X(n)=-j*X(n); % positive frequencies
X(1)=0; X(Nx/2+1)=0;
n=Nx/2+2:Nx; X(n)= j*X(n); % negative frequencies
xH=real(ifft(X));
xa2=x+j*xH; % analytic signal

% Display the signals x and xH in one figure with overlay
figure;
plot(0:Nx - 1, x, 'b', 'LineWidth', 1.5); 
hold on;
plot(0:Nx - 1, xH, 'r', 'LineWidth', 1.5);
hold off;

% Add labels, legend, and title
xlabel('Sample Index');
ylabel('Amplitude');
legend('Original Signal (x)', 'Hilbert Transform (x_H)');
title('Plot 1 - Original Signal and Its Hilbert Transform');
grid on;


figure;
plot(x,xH,'bo-')
title('Plot 2 - circle?')

figure; 
for n=1:100
    plot(x(n),xH(n),'bo'); hold on; %pause(0.05); 
    title('Plot 3 - animation circle')
end

figure;
subplot(2,1,1)
plot(0:Nx - 1, xa1, 'b', 'LineWidth', 1.5); 
subplot(2,1,2)
plot(0:Nx - 1, xa2, 'r', 'LineWidth', 1.5);
hold off;
% Add labels, legend, and title
xlabel('Sample Index');
ylabel('Amplitude');
legend('xa1', 'xa2');
sgtitle('Plot 4 - up is xa1, down is xa2');
grid on;

% Calcualting signals FFT
X = fft(x);
% Calcualting analytic signals FFT
xa=xa2;
Xa=fft(xa);

figure;
subplot(2,1,1)
plot(0:Nx - 1, abs(X), 'b', 'LineWidth', 1.5); 
subplot(2,1,2)
plot(0:Nx - 1, abs(Xa), 'r', 'LineWidth', 1.5);
hold off;
% Add labels, legend, and title
xlabel('Sample Index');
ylabel('Amplitude');
sgtitle('Plot 5 - up is signals FFT - X, down is analytic signals FFT - Xa');
grid on;

%read speech into matlab
%Importing audio files
[speech, fs] = audioread('DSP.mp3');
speech = mean(speech, 2);


%plotting vector
omega = linspace(-fs/2, fs/2, length(speech));

%fft
S = fft(speech);

%analytic signal
sa = hilbert(speech);

%fft

Sa = fft(sa);

%Plotting

%DSP
figure;
    subplot(2, 1, 1)
        plot(omega, fftshift(abs(S)), "Linewidth", 2); xlabel('Frequency'); ylabel('|X|'); grid on; hold on; title('FFT spectrum of speech');
    subplot(2, 1, 2)
        plot(omega, fftshift(abs(Sa)), "Linewidth", 2); xlabel('Frequency'); ylabel('|X|'); grid on; hold on; title('FFT spectrum of speech analytic');
sgtitle('Up - FFT of speech, Below - FFT of analytic speech')

%sound(speech,fs)