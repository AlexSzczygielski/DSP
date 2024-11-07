function X = myRecFFT(x)

% My recursive radix-2 FFT function

N = length(x); % number of signal samples

if(N==2) % for 2 SIGNAL SAMPLES only
    X(1) = x(1) + x(2); % 2-point DFT
    X(2) = x(1) - x(2); % on the lowest level
else % for MORE THAN 2 signal samples
    X1 = myRecFFT(x(1:2:N)); % call itself on even samples
    X2 = myRecFFT(x(2:2:N)); % call itself on odd samples
    X = [ X1 X1 ] + exp(-j*2*pi/N*(0:N-1)).* [X2 X2]; % combine spectra
end
end