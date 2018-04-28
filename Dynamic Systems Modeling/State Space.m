close all;
clear all;

%======= SIMULATION DATA =======%

% OUTPUT VARIABLES
TinN = 20;
TpN   = 15;

% KNOWN DATA
Cp = 1000;
Ro = 1.2;

% INPUT VARIABLES
QkN   =  20000;     % Qk = Cp*Ro*Fp*Tkz, so we can skip it as an input variable
ToutN = -20;
TkzN  =  35;
FpN   =  QkN / (Cp*Ro*TkzN);

% SYSTEM FACTORS
K1 = (QkN/TkzN) * (TkzN-TpN) / (TinN+3*TpN-4*ToutN);
K2 = 3 * K1;
KP = (QkN/TkzN) * ((TkzN-TinN) - (TkzN-TpN) * ((TinN-ToutN) / (TinN+3*TpN-4*ToutN))) / (TinN-TpN);

% ROOMS VOLUME
Vw = K1 * K2 * 2.5;
Vp = 0.5 * Vw;

% "DYNAMIC" PARAMETERS
Cvp = Cp * Ro * Vp;
Cvw = Cp * Ro * Vw;

% INITIAL CONDITIONS
Qk0   = QkN;
Tout0 = ToutN;
Tkz0  = TkzN;
Fp0   = FpN;

% MATRIXES DEFINITIONS
A = [-(Cp*Ro*Fp0+K1+KP)/Cvw,  KP/Cvw;
      (Cp*Ro*Fp0+KP)/Cvp,   -(Cp*Ro*Fp0+K2+KP)/Cvp;];
B = [(Cp*Ro*Fp0)/Cvw, K1/Cvw;
            0,        K2/Cvp;];
C = [1,0;0,1;];
D = [0,0;0,0;];

% EQUILIBRIUM (BALANCED STATE)

u0 = [Tkz0;Tout0];
x0 = -A^-1*B*u0;

% TIME AND STEPS
time      = 100000;
time_step = 20000;
dTout     = 0;
dTkz      = 0;

%======= SIMULATION AND PLOTTING ========%
[t] = sim('statespace', time);

figure;
subplot 121;
plot(t, aTin-273);
grid on;
title('Tin reaction for Tout = 0 step');
xlabel('t [s]');
ylabel('T [*C]');
subplot 122;
plot(t, aTp-273);
grid on;
title('Tp reaction for Tout = 0 step');
xlabel('t [s]');
ylabel('T [*C]');
