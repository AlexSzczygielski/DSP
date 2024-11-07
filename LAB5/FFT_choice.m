function result = FFT_choice(x, direction,N)
% fft choice
% direction = 1 for FFT, -1 for IFFT

    if direction == 1
        result = myRecFFT(x);
    elseif direction == -1
        result = myRecIFFT(x)/N;
    end

end