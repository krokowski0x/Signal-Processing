clear all; close all;

N = 128;           %rzad filtru - nieparzysta liczba
n = 0:N-1;         %wektor probek
M = (N-1)/2;

fgr1 = 800;             %czestotliwosc dolna graniczna [Hz]
fgr2 = 2000;            %czestotliwsc gorna
fs = 10000;             %czestotliwosc probkowania [Hz]
deltaT = 1/fs;          %okres probkowania [s]
t = 0:deltaT:1-deltaT;  %wektor czasu

%sygnal testowy
f1 = 100; f2 = 350;
s1 = sin(2*pi*f1*t);
s2 = sin(2*pi*f2*t);
syg = s1 + s2;
syg = syg + 2*randn(1,length(syg));

%Transmitancja
NF = fs;                  %liczba probek transmitancji filtru
k = 0:fs-1;               %wektor indeksow dla kolejnych wartosci H(m)
fn = k/fs;                %wektor wartosci czestotliwosci unormowanej

%Tworznie filtru
filtr = fir1(N-1,[fgr1/(0.5*fs) fgr2/(0.5*fs)]);
%filtracja sygnalu testowengo
sygf = filter(filtr,1,syg);

[h,w] = freqz(filtr,1,2*pi*fn); %transmitancja filtru
h1 = h(1:0.5*fs);

x = abs(fft(syg));
y = abs(fft(sygf));

figure(1);
subplot(3,2,1);
stem(n-N/2,filtr); grid on; hold on;
plot(n-N/2,hamming(length(filtr))'*max(filtr),'r')
title('Odpowiedz impulsowa dla filtru FIR');

subplot(3,2,3);
plot(abs(h1)); grid on;
title('Funkcja transmitancji');

subplot(3,2,5)
plot(w,20*log10(abs(h))); grid on;
title('Funkcja transmitancji w [db]');

subplot(3,2,2);
plot(t,syg); grid on;
title('Sygnal wejsciowy')

subplot(3,2,4);
plot(t,x); grid on;
title('Modul widma sygnalu wejsciowego')

subplot(3,2,6);
plot(t,y); grid on;
title('Modul widma sygnalu wyjsciowego');

figure(2); hold on; grid on;
freqz(filtr);
