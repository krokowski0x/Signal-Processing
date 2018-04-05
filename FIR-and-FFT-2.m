close all;
clf;

N=129;
disp(['Rzad filtru N = ',num2str(N)]);

M = (N-1) / 2;
M2 = M / 2;
j2 = ones(1, M2);
z2 = zeros(1, M2);
Ar = [1 j2 z2 z2 j2];
Ai = zeros(1, N);
A = Ar + 1j * Ai;

n = 0:(N-1);
f = n / N;
h = zeros(1, N);
for k = 0:(N-1)
    h = h + A(k+1) * exp(1j*2*pi*k/N*(n-M));
end
h = real(h)  N;
okno = hamming(length(h));
h = h.*okno';

subplot 321;
stem(n-M,h);
hold on;
grid on;
plot(n-(N-1)/2, okno'*max(h),'r');
title(['Odp. impulsowa h(n) filtru FIR. Rzad filtru N = ', num2str(N)]);

% RZECZYWISTA FUNKCJA TRANSMITANCJI H(m)
NF = 1000;
k = 0:NF-1;
fn = k/NF;
for k = 0:NF-1
    H(k+1) = exp(-1j*2*pi*k/NF*(n-N))*h';
end

Ax = Ar;
Hx = real(H);
subplot 323;
stem(f, Ax,'or');
grid on;
hold on;
plot(fn, abs(H),'b');
title('Charakterystyka filtru');
legend('idealna','faktyczna');
subplot 325;
plot(fn, 20*log10(abs(H)));
grid on;
title('|H(m)| w [dB]');

% SYGNA� TESTOWY
fs = 1000;
deltaT = 1/fs;
t = 0:deltaT:1-deltaT;
f1 = 100;
f2 = 350;
s1 = sin(2*pi*f1*t);
s2 = sin(2*pi*f2*t);
syg = s1+s2;
syg = syg + 2*randn(1,length(syg));
subplot 322;
plot(t,syg);
grid on;
xlabel('Czas [s]');
title('Sygnal testowy');

F = fft(syg);
Fsyg = abs(F);
subplot 324;
plot(Fsyg);
grid on;
title('Widmo amplitudowe sygnalu testowego');

y = conv(syg,h);
FF = abs(fft(y));
subplot 326;
plot(FF);
grid on;
title('Widmo amplitudowe sygnalu po filtracji');
