clear all;
close all;

% DATA

A1 = 3;
A2 = 2;
Aw1 = 0.1 * A1;
Aw2 = 0.1 * A2;
h1 = 5;
h2 = 9;
g = 9.81;

a1 = (Aw1 * sqrt(2 * g * h1))/h1;
a2 = (Aw2 * sqrt(2 * g * h2))/h2;

fmax = a1 * h1;
d1 = 0.1 * fmax;
d2 = 0;
fin2 = 1;
fin1vector = [0 0.5*fmax 0.9*fmax];

t0 = 1;

% LINEAR PLOTTING

figure(1);
subplot 121
grid on;
hold on;
title('Step for h1(t) // LINEAR');
xlabel('t');
ylabel('h1');
for i = 1:3

   fin1 = fin1vector(i);

   h10 = fin1 / a1;
   h20 = (fin1+fin2) / a2;

   sim('Cascades');
   plot(t, h1);

end
legend('f = 0','f = 0.5 * fmax','f = 0.9 * fmax');

subplot 122
grid on;
hold on;
title('Step for h2(t) // LINEAR');
xlabel('t');
ylabel('h2');
for i = 1:3

   fin1 = fin1vector(i);

   h10 = fin1 / a1;
   h20 = (fin1+fin2) / a2;

   sim('Cascades');
   plot(t, h2);

end
legend('f = 0','f = 0.5 * fmax','f = 0.9 * fmax');
