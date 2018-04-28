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

% EQUILIBRIUM (BALANCED STATE)
Tin0 = (Cp*Ro*Fp0*Cp*Ro*Fp0*Tkz0+Cp*Ro*Fp0*Tkz0*(KP+K2)+Cp*Ro*Fp0*K1*Tout0+K1*Tout0*(KP+K2)+Tout0*KP*K2) / (Cp*Ro*Fp0*Cp*Ro*Fp0+Cp*Ro*Fp0*(K1+KP+K2)+K1*(K2+KP)+KP*K2);
Tp0   = (Cp*Ro*Fp0*Tin0+KP*Tin0+K2*Tout0) / (Cp*Ro*Fp0+KP+K2);

% TIME AND STEPS
time      = 100000;
time_step = 20000;
dTout     = 0;
dTkz      = 0;
dFp       = 0;

%======= SIMULATION AND PLOTTIONG ========%
[t] = sim('integrators', time);

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
