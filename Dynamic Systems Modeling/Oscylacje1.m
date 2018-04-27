clear all;
close all;

f1 = figure; hold on;  grid on;
f2 = figure; hold on;  grid on;
f3 = figure; hold on;  grid on;
f4 = figure; hold on;  grid on;
f5 = figure; hold on;  grid on;

k = 1;
wn = 3;
t0 = 0;
x0 = 5;
x10 = 0;
t0 = 0;
u0 = 0;
du = 0;

% WARUNKI POCZATKOWE 1.

ksi = 4;
x1 = -12 + 3*sqrt(15);
x2 = -12 - 3*sqrt(15);
re = [real(x1) real(x2)];
im = [imag(x1) imag(x2)];

figure(f1);
subplot 131
plot(re, im, 'o');
sim('Oscylacje'); grid on;
subplot 132
plot(t, x); grid on;
xlabel('t');
ylabel('x');

% WARUNKI POCZATKOWE 2.

ksi = -3;
x1 = 9 + 6*sqrt(2);
x2 = 9 - 6*sqrt(2);
re = [real(x1) real(x2)];
im = [imag(x1) imag(x2)];

figure(f2);
subplot 131
plot(re, im, 'o');
sim('Oscylacje'); grid on;
subplot 132
plot(t, x); grid on;
xlabel('t');
ylabel('x');

% WARUNKI POCZATKOWE 3.

ksi = 0;
x1 = sqrt(-9);
x2 = -sqrt(-9);
re = [real(x1) real(x2)];
im = [imag(x1) imag(x2)];

figure(f3);
subplot 131
plot(re, im, 'o');
sim('Oscylacje'); grid on;
subplot(1,3,2);
plot(t, x); grid on;
xlabel('t');
ylabel('x');

% WARUNKI POCZATKOWE 4.

ksi = 9/10;
x1 = -27/10 + sqrt(-19)/10;
x2 = -27/10 - sqrt(-19)/10;
re = [real(x1) real(x2)];
im = [imag(x1) imag(x2)];

figure(f4);
subplot 131
plot(re, im, 'o');
sim('Oscylacje'); grid on;
subplot 132
plot(t, x); grid on;
xlabel('t');
ylabel('x');

% WARUNKI POCZATKOWE 5.

ksi = -1/2;
x1 = 3/2 + 3*sqrt(-3)/2;
x2 = 3/2 - 3*sqrt(-3)/2;
re = [real(x1) real(x2)];
im = [imag(x1) imag(x2)];

figure(f5);
subplot 131
plot(re, im, 'o');
sim('Oscylacje'); grid on;
subplot 132
plot(t, x); grid on;
xlabel('t');
ylabel('x');
