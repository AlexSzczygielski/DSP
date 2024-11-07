function [] = calc_cosine(A1,A2,A3,f1,f2,f3,t,p1,p2,p3,i)

x1 = A1 * cos(2*pi*f1*t+p1); % sine as a first signal component
x2 = A2 * cos(2*pi*f2*t+p2);
x3 = A3 * cos(2*pi*f3*t+p3);


figure(2)
subplot(2,2,i)
plot(t,x1,"o-"); hold on;
plot(t,x2,"o-");
plot(t,x3,"o-");
end
