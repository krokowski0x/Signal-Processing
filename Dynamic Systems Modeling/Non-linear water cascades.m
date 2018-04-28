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
t0 = 1;

fmax = Aw1 * sqrt(2*g*h1);
d1 = 0.1 * fmax;
fin2 = 1;
d2 = 0;
fin1vector = [0 0.5*fmax 0.9*fmax];


% NON-LINEAR PLOTTING

figure(1);
subplot 121
grid on;
hold on;
title('Step for h1(t) // NON-LINEAR');
xlabel('t');
ylabel('h1');
for i = 1:3

   fin1 = fin1vector(i);

   h10 = (fin1*fin1) / (2*g*Aw1*Aw1);
   h20 = (fin1*fin1 + 2*fin1*fin2 + fin2*fin2) / (2*g*Aw2*Aw2);

   sim('NLCascades');
   plot(t, h1);

end
legend('f = 0','f = 0.5 * fmax','f = 0.9 * fmax');

subplot 122
grid on;
hold on;
title('Step for h2(t) // NON-LINEAR');
xlabel('t');
ylabel('h2');
for i = 1:3

   fin1 = fin1vector(i);

   h10 = (fin1*fin1) / (2*g*Aw1*Aw1);
   h20 = (fin1*fin1 + 2*fin1*fin2 + fin2*fin2) / (2*g*Aw2*Aw2);

   sim('NLCascades');
   plot(t, h2);

end
legend('f = 0','f = 0.5 * fmax','f = 0.9 * fmax');
