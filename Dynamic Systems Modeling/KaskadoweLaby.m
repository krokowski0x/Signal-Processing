clear all;
close all;

% DANE

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
fwe2 = 1;
fwe1wektor = [0 0.5*fmax 0.9*fmax];

t0 = 1;

% WYKRESY ZLINEARYZOWANE

figure(1);
subplot(1,2,1);
grid on;
hold on;
title('Wymuszenie skokowe dla h1(t) // ZLINEARYZOWANE');
xlabel('t');
ylabel('h1');
for i=1:3
   
   fwe1=fwe1wektor(i);
   
   h10=fwe1/a1;
   h20=(fwe1+fwe2)/a2;
  
   sim('KASKADY');
   plot(t,h1);
  
end
legend('f = 0','f = 0.5 * fmax','f = 0.9 * fmax');

subplot(1,2,2);
grid on;
hold on;
title('Wymuszenie skokowe dla h2(t) // ZLINEARYZOWANE');
xlabel('t');
ylabel('h2');
for i=1:3
   
   fwe1=fwe1wektor(i);
   
   h10=fwe1/a1;
   h20=(fwe1+fwe2)/a2;
  
   sim('KASKADY');
   plot(t,h2);
  
end
legend('f = 0','f = 0.5 * fmax','f = 0.9 * fmax');
