clf;
close all; clear all;
hold on; grid on;

n = 4;
N = 2^(n);
lpoz = N/2;
del = 1/lpoz;

for i = 1:lpoz
    vdod(i) = i*del;
    vuje(i) = (-1)*i*del;
end

czasobs = 0.25;
dt = 0.001;
T = 0:dt:czasobs-dt;
f0 = 5;
A = 1;
x = A*sin(2*pi*f0*T);

K = lpoz*x;
K=round(K);
x1 = K/lpoz;

subplot(1,1,1);
plot(x);
axis([0 length(x) -2 2]);
title('Sygnal');
plot(x1,'r');
title(['Sygnal skwantowany przetwornikiem ',int2str(n),'-bitowym']);
xlabel('Czas [s]');
ylabel('Amplituda');

e = x - x1;
plot(e,'k');
legend('Sygnal oryginalny','Sygnal skwantowany','Blad kwantyzacji');
hold off;
