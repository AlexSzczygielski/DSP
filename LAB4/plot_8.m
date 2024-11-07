function [] = plot_8(X,omega)

figure
        subplot(2, 1, 1)
            plot(omega, abs(X)); xlabel('Freq'); title('Rectang DFT spectra (lin)');
        subplot(2, 1, 2)
            plot(omega, 20*log10(abs(X))); xlabel('Freq'); title('Rectang DFT spectra (dB)');

end

