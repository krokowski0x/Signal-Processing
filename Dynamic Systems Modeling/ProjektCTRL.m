close all;
clear all;

%======= DANE DO SYMULACJI =======%

% ZMIENNE WYJŒCIOWE
TwewN = 20;  
TpN   = 15;  

% DANE TABLICOWE
Cp = 1000;
Ro = 1.2;

% ZMIENNE WEJŒCIOWE
QkN   =  20000;     % Qk = Cp*Ro*Fp*Tkz, wiêc pomijamy j¹ jako zm. wej.
TzewN = -20;
TkzN  =  35;
FpN   =  QkN/(Cp*Ro*TkzN);

% WSPÓ£CZYNNIKI UK£ADU
K1 = (QkN/TkzN)*(TkzN-TpN)/(TwewN+3*TpN-4*TzewN);
K2 = 3*K1;
KP = (QkN/TkzN)*((TkzN-TwewN)-(TkzN-TpN)*((TwewN-TzewN)/(TwewN+3*TpN-4*TzewN)))/(TwewN-TpN);

% OBJÊTOŒCI POMIESZCZEÑ
Vw = K1*K2*2.5;
Vp = 0.5*Vw;

% PARAMETRY
Cvp = Cp*Ro*Vp;
Cvw = Cp*Ro*Vw;
Fp0   = FpN;

% DEFINICJA MACIERZY
A = [-(Cp*Ro*Fp0+K1+KP)/Cvw,  KP/Cvw;
      (Cp*Ro*Fp0+KP)/Cvp,   -(Cp*Ro*Fp0+K2+KP)/Cvp];
B = [(Cp*Ro*Fp0)/Cvw, K1/Cvw;
            0,        K2/Cvp];
C = [1,0;0,1];
D = [0,0;0,0];

% MODEL I SYMULACJA SS
obSS = ss(A,B,C,D,'InputName',{'Tkz';'Tzew'},'OutputName',{'Twew';'Tp'});
subplot 121;
step(obSS);
title('Odpowiedzi skokowe obiektu (SS)');

% WSPÓ£CZYNNIKI TRANSMITANCJI
M   = [Cvw+Cvp, Cvw*(Cp*Ro*Fp0+K2+KP)+Cvp*(Cp*Ro*Fp0+K1+KP), Cp*Ro*Fp0*(Cp*Ro*Fp0+K1+K2+KP)+K1*K2+K1*KP+K2*KP];
L11 = [Cp*Ro*Fp0*(Cp*Ro*Fp0+KP+K2)];
L12 = [K1*(Cp*Ro*Fp0+KP+K2)+KP*K2];
L21 = [Cp*Ro*Fp0*(Cp*Ro*Fp0+KP)];
L22 = [K2*Cvw, K2*(Cp*Ro*Fp0+KP+K1)+K1*(Cp*Ro*Fp0+KP)];

% MODEL I SYMULACJA TF
obTF = tf({L11,L12;L21,L22},{M,M;M,M});
subplot 122;
step(obTF);
title('Odpowiedzi skokowe obiektu (TF)');
