close all;
clear all;

f1 = figure; hold on; grid on;

a = 2;
b = 3;
k = 5;
u0 = 9;
t0 = 0;
du = 0;

% PIERWSZE

x0 = 0;
sim('RRSim');
A = -15;

figure(f1);
subplot 421
plot(t, x); grid on;
title('Warunki pocz�tkowe: x(0)=0 - SIMULINK');
xlabel('t');
ylabel('x');

subplot 422
plot(t, A*exp(-3*t/2), 'r', t, 15, 'gx', t, A*exp(-3*t/2)+15, 'b'); grid on;
title('Warunki pocz�tkowe: x(0)=0 - Rozw. analityczne');
xlabel('t');
ylabel('x');
title(legend('Swobodne','Wymuszone'),'Rozwi�zanie:');

% DRUGIE

x0 = 5;
sim('RRSim');
A = -10;

subplot 423
plot(t, x); grid on;
title('Warunki pocz�tkowe: x(0)=5 - SIMULINK');
xlabel('t');
ylabel('x');

subplot 424
plot(t, A*exp(-3*t/2), 'r', t, 15, 'gx', t, A*exp(-3*t/2)+15, 'b'); grid on;
title('Warunki pocz�tkowe: x(0)=5 - Rozw. analityczne');
xlabel('t');
ylabel('x');
title(legend('Swobodne','Wymuszone'),'Rozwi�zanie:');

% TRZECIE

x0 = 15;
sim('RRSim');
A = 0;

subplot 425
plot(t, x); grid on;
title('Warunki pocz�tkowe: x*(0)=0,x(0)=15 - SIMULINK');
xlabel('t');
ylabel('x');

subplot 426
plot(t, (-3*A/2)*exp(-3*t/2), 'r', t, 15, 'gx', t, (-3*A/2)*exp(-3*t/2)+15, 'b'); grid on;
title('Warunki pocz�tkowe: x*(0)=0,x(0)=15 - Rozw. analityczne');
xlabel('t');
ylabel('x');
title(legend('Swobodne','Wymuszone'),'Rozwi�zanie:');

%CZWARTE

x0 = 11;
sim('RRSim');
A = -4;

subplot 427
plot(t, x); grid on;
title('Warunki pocz�tkowe: x*(0)=6,x(0)=11 - SIMULINK');
xlabel('t');
ylabel('x');

subplot 428
plot(t, A*exp(-3*t/2), 'r', t, 15, 'gx', t, A*exp(-3*t/2)+15, 'b'); grid on;
title('Warunki pocz�tkowe: x*(0)=6,x(0)=11 - Rozw. analityczne');
xlabel('t');
ylabel('x');
title(legend('Swobodne','Wymuszone'),'Rozwi�zanie:');
