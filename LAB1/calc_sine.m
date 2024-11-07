function [] = calc_sine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,i)
fs = 8000;
x1 = A1 * sin(2*pi*f1*t+p1); % sine as a first signal component
x2 = A2 * sin(2*pi*f2*t+p2);
x3 = A3 * sin(2*pi*f3*t+p3);
sound(x1,fs);

figure(1)
subplot(2,2,i)
plot(t,x1,"o-"); hold on;
plot(t,x2,"o-");
plot(t,x3,"o-");
end

