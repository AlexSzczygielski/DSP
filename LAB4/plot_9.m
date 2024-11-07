function [] = plot_9(X,X2,omega)

figure(1)
        subplot(2, 1, 1)
            plot(omega, fftshift(abs(X))); xlabel('Freq'); title('DFT spectra of 50Hz sine');
        subplot(2, 1, 2)
            plot(omega, fftshift(abs(X2))); xlabel('Freq'); title('DFT spectra of Kaiser');

end

