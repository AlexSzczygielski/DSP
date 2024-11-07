clearvars; clc; close all;

%Fill the matrix
N = 25;
A = zeros(N, N);
for k = 0:N-1
    A(k+1, 1:N) = sqrt(2/N)*cos(pi/N*(k+1/2)*((0:N-1)+1/2));
end

% Plot each row of the matrix
figure(1);
for i = 1:N
    subplot(N, 1, i);
    plot(A(i, :));
    title(['Row ', num2str(i)]);
end

tolerance = 1e-10;
%Checking the orthogonality of 5 chosen rows 
orth1 = dot(A(1,:), A(2,:)); %1st and 2nd row
orth2 = dot(A(4,:), A(7,:)); %4th and 7th row
orth3 = dot(A(10,:), A(15,:)); %10th and 15th row
orth4 = dot(A(18,:), A(20,:)); %18th and 20th row
orth5 = dot(A(22,:), A(25,:)); %22nd and 25th row
