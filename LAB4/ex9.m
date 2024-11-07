% dsp04_ex9_dft.m
clear all; close all

%Time discretization settings
N = 2000;
fs = 2000;
dt = 1/fs; t = dt*(0:N-1);
omega = linspace(-fs/2, fs/2, N);

% sinusoid 50Hz
x = sin(2*pi*50*t);

% Kaiser window, B = 15
y = kaiser(N, 15);

%Calculating DFT spectra of both signals
X = (fft(x));
Y = (fft(y));

%plot
plot_9(X,Y,omega);

%% perform processing operations

%time reverse
reverse1 = fliplr(x);
reverse2 = fliplr(y);

fft_reverse1 = (fft(reverse1));
fft_reverse2 = (fft(reverse2));

%conjugate
conjugate1 = conj(x);
conjugate2 = conj(y);

fft_conj1 = (fft(conjugate1));
fft_conj2 = (fft(conjugate2));

conjugate_w1 = conj(fliplr(X)); %spectral consequence
conjugate_w2 = conj(fliplr(Y));

%time shift
t0 = 100;

shift = sin(2*pi*50*(t-t0));
fft_shift = (fft(shift));


shift_w = exp(-1i * omega * t0) .* X; %Spectral consequence


%plot
plot_9_2(fft_reverse1,fft_reverse2,reverse1,reverse2);
plot_9_2(fft_conj1,fft_conj2,conjugate_w1,conjugate_w2);
figure
        subplot(2, 1, 1)
            plot(omega, fftshift(abs(fft_shift))); xlabel('Freq'); title('x');
        subplot(2, 1, 2)
            plot(omega, fftshift(abs(shift_w))); xlabel('Freq'); title('x');


