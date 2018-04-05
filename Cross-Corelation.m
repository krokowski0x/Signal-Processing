clf
% tworzenie sygnalu
T = 1;          % czas trwania sygnalu [s]
dt = 0.001;     % okres probkowania sygnalu
fpr = 1/dt;    % czestotliwosc probkowania sygnalu
t = 0:dt:T-dt;
f1 = 20; f2 = 47;
A1 = 1;
A2 = 1;
Aszum = 2;
x = A1*sin(2*pi*f1*t);
y = A2*cos(2*pi*f2*t);
szum = Aszum*randn(1, length(t));
s = x + y + szum;

figure(1)
plot(t,s); grid on;

MAXLAG = fix(0.1*length(t));
a_kor = xcorr(s, MAXLAG);
tau = [-MAXLAG:-1, 0, 1:MAXLAG];  % opis osi czasu dla a_kor
a_kor = a_kor(1:length(a_kor)-1);
tau = tau(1:length(tau)-1);

figure(2);
stem(tau, a_kor, '.'); grid on;
title('Funkcja autokorelacji');

df = fpr/length(tau);

figure(3);
subplot(2,1,1)
Pxx = abs(fft(a_kor));      % widmowa gestosc mocy (PSD)
f = 0:df:fpr-df;
stem(f, Pxx, '.')
title('Estymator widmowej gestosci mocy')
subplot(2,1,2)
stem(f(1:50), Pxx(1:50), '.'); grid on;
xlabel('Czestotliwosc [Hz]');
