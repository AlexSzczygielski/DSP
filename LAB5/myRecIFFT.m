function X = myRecIFFT(x)

% inverse fft recursive

N = length(x); % number of signal samples

if(N==2) % for 2 SIGNAL SAMPLES only
    X(1) = (x(1) + x(2)); % 2-point Inverse DFT
    X(2) = (x(1) - x(2)); % on the lowest level
else % for MORE THAN 2 signal samples
    X1 = myRecIFFT(x(1:2:N)); % call itself on even samples
    X2 = myRecIFFT(x(2:2:N)); % call itself on odd samples
    X = [ X1 X1 ] + exp(j*2*pi/N*(0:N-1)).* [X2 X2]; % combine spectra
end
end
