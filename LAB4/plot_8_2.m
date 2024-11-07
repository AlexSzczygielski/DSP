function [] = plot_8_2(X,X2,omega)

figure
        subplot(2, 1, 1)
            plot(omega, abs(X)); xlabel('Freq'); title('Rectang DFT spectra (lin) using fft (Matlab');
        subplot(2, 1, 2)
            plot(omega, (abs(X2))); xlabel('Freq'); title('Rectang DFT spectra (lin) using math from tab');

end

