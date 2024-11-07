function [] = plot_9_2(X1,X2,X3,X4)

figure
    subplot(2, 2, 1)
        plot(abs(fftshift(X1))); xlabel('Freq'); title('FFT of signal manipulation');
    subplot(2, 2, 2)
        plot(abs(fftshift(X2))); xlabel('Freq'); title('FFT of signal manipulation');
    subplot(2, 2, 3)
        plot(abs(fftshift(X3)));  xlabel('Freq'); title('Spectra from spectral consequence');
    subplot(2, 2, 4)
        plot(abs(fftshift(X4))); xlabel('Freq'); title('Spectra from spectral consequence');
    %sgtitle(title)

end

