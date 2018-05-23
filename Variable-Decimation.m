clf;
close all;
clear all;

% DATA

n = 1;
disp('Decimation factor: (1 < n < 10)');
n = input('n = ');
T = 1;
step = 0.01;
t = 0:step:T-step;
f = 3;
A = 1;

x = A * sin(2 * pi * f * t);
xAxis = linspace(0,T,length(t));
y = x(1:n:end);
xAxisDecimated = linspace(0, T, ceil(length(t) / n));

% ORIGINAL PLOT

subplot 211;
stem(xAxis, x, 'filled', 'markersize', 3);
grid on;
axis([0 1 -1.2 1.2]);
title('Original signal');
xlabel ('Time [s]');
ylabel ('Amplitude');

% DECIMATED PLOT

subplot 212;
stem(xAxisDecimated, y, 'r', 'filled', 'markersize', 3);
grid on;
axis([0 1 -1.2 1.2]);
title(['Decimated signal n = ', int2str(n)]);
xlabel ('Time [s]');
ylabel ('Amplitude');
