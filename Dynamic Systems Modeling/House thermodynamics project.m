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

% PARAMETERS
Cvp = Cp * Ro * Vp;
Cvw = Cp * Ro * Vw;
Fp0   = FpN;

% MATRIXES DEFINITIONS
A = [-(Cp*Ro*Fp0+K1+KP)/Cvw,  KP/Cvw;
      (Cp*Ro*Fp0+KP)/Cvp,   -(Cp*Ro*Fp0+K2+KP)/Cvp];
B = [(Cp*Ro*Fp0)/Cvw, K1/Cvw;
            0,        K2/Cvp];
C = [1,0;0,1];
D = [0,0;0,0];

% MODEL AND SYMULATION FOR STATE SPACE
obSS = ss(A,B,C,D,'InputName',{'Tkz';'Tout'},'OutputName',{'Tin';'Tp'});
subplot 121;
step(obSS);
title('Object\'s step response (SS)');

% TRANSFER FCN FACTORS
M   = [Cvw+Cvp, Cvw*(Cp*Ro*Fp0+K2+KP)+Cvp*(Cp*Ro*Fp0+K1+KP), Cp*Ro*Fp0*(Cp*Ro*Fp0+K1+K2+KP)+K1*K2+K1*KP+K2*KP];
L11 = [Cp*Ro*Fp0*(Cp*Ro*Fp0+KP+K2)];
L12 = [K1*(Cp*Ro*Fp0+KP+K2)+KP*K2];
L21 = [Cp*Ro*Fp0*(Cp*Ro*Fp0+KP)];
L22 = [K2*Cvw, K2*(Cp*Ro*Fp0+KP+K1)+K1*(Cp*Ro*Fp0+KP)];

% MODEL AND SYMULATION FOR TRANSFER FCN
obTF = tf({L11,L12;L21,L22},{M,M;M,M});
subplot 122;
step(obTF);
title('Object\'s step response (TF)');
