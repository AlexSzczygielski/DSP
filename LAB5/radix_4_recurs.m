function X = radix_4_recurs(x)

N = length(x);

% twiddle factors (from formula)
W = exp(-2i*pi/N);
W2 = W^2;
W3 = W^3;

%Fill vector with zeros to have correct dimensions
X = zeros(1, N);

% if only one sample, then the same dft as original
if N == 1
    X = x;

else %divide singal into 4 subsequences to use radix 4 method
    % subsequence indexes
    X1 = radix_4_recurs(x(1:4:N)); %0 , 4, ...
    X2 = radix_4_recurs(x(2:4:N)); %1, 5...
    X3 = radix_4_recurs(x(3:4:N)); %2, 6, ...
    X4 = radix_4_recurs(x(4:4:N)); %3, 7...

    %Computing the DFT
    for k = 0:N/4-1
        X(k+1) = X1(k+1) + W^k * X2(k+1) + W2^k * X3(k+1) + W3^k * X4(k+1);
        X(k+1+N/4) = X1(k+1) - 1i * W^k * X2(k+1) - W2^k * X3(k+1) + 1i * W3^k * X4(k+1);
        X(k+1+N/2) = X1(k+1) - W^k * X2(k+1) + W2^k * X3(k+1) - W3^k * X4(k+1);
        X(k+1+3*N/4) = X1(k+1) + 1i * W^k * X2(k+1) - W2^k * X3(k+1) - 1i * W3^k * X4(k+1);
    end
end
end
