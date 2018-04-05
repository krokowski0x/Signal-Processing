close all;
hold on;
grid on;
clf;

% ZADANE CZ�STOTLIWO�CI - Pr�bkowania i Graniczne

fpr  = 10000; %Hz
fgr1 = 800;   %Hz
fgr2 = 2000;  %Hz

N = 65;
deltaT = 1/fpr;
t = 0:deltaT:1-deltaT;
n = 0:N-1;

% Sygna�y o zadanych cz�stotliwo�ciach

s1 = sin(2*pi*fgr1*t);
s2 = sin(2*pi*fgr2*t);

% Sygna� zaszumiony

syg = s1 + s2;
syg = s1 +s2+randn(1,length(syg));

% Projekt filtru FIR �rodkowoprzepustowego

filtr = fir1(N-1,[fgr1/(0.5*fpr) fgr2/(0.5*fpr)]);
f = filter(filtr,1,syg);

% Transmitancja filtru

NF  =fpr;
k = 0:fpr-1;
fn = k/fpr;                
[h,w] = freqz(filtr,1,2*pi*fn);
H = h(1:0.5*fpr);

% DFT sygna�u

x = abs(fft(syg));
y = abs(fft(f));

% WYKRESY

figure(1);
subplot(3,2,1);
stem(n-N/2,filtr); grid on; hold on;
plot(n-N/2,hamming(length(filtr))'*max(filtr),'r')
title(['Odpowied� impulsowa dla filtru FIR, N = ',num2str(N)]);

subplot(3,2,3);
plot(abs(H)); grid on;
title('Funkcja transmitancji');

subplot(3,2,5)
plot(w,20*log10(abs(h))); grid on;
title('Funkcja transmitancji w dB');

subplot(3,2,2);
plot(t,syg); grid on;
title('Sygna� wejsciowy')

subplot(3,2,4);
plot(t,x); grid on;
title({'Modu� widma (transformata Fouriera)', 'sygnalu wejsciowego'})

subplot(3,2,6);
plot(t,y); grid on;
title({'Modu� widma (transformata Fouriera)', 'sygnalu przefiltrowanego'});
