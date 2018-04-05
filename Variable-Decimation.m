clf; 
close all; 
clear all;

% DANE

n = 1;
disp('Podaj rz¹d decymacji (1 < n < 10)');
n = input('n = ');
T = 1;
step = 0.01;
t = 0:step:T-step;
f = 3;
A = 1;

x = A*sin(2*pi*f*t);
xAxis = linspace(0,T,length(t));
y = x(1:n:end);
xAxisDecimated = linspace(0,T,ceil(length(t)/n));

% WYKRES ORYGINALNY

subplot 211;
stem(xAxis,x,'filled','markersize',3);
grid on;
axis([0 1 -1.2 1.2]);
title('Sygna³ oryginalny');
xlabel ('Czas [s]');
ylabel ('Amplituda');

% WYKRES DECYMOWANY

subplot 212;
stem(xAxisDecimated,y,'r','filled','markersize',3);
grid on;
axis([0 1 -1.2 1.2]);
title(['Sygna³ decymowany n = ',int2str(n)]);
xlabel ('Czas [s]');
ylabel ('Amplituda');