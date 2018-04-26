close all;
clear all;

%======= DANE DO SYMULACJI =======%

% ZMIENNE WYJŒCIOWE
TwewN = 20 + 273;  
TpN   = 15 + 273;  

% DANE TABLICOWE
Cp = 1000;
Ro = 1.2;

% ZMIENNE WEJŒCIOWE
QkN   =  20000;     % Qk = Cp*Ro*Fp*Tkz, wiêc pomijamy j¹ jako zm. wej.
TzewN = -20 + 273;
TkzN  =  35 + 273;
FpN   =  QkN/(Cp*Ro*TkzN);

% WSPÓ£CZYNNIKI UK£ADU
K1 = (QkN/TkzN)*(TkzN-TpN)/(TwewN+3*TpN-4*TzewN);
K2 = 3*K1;
KP = (QkN/TkzN)*((TkzN-TwewN)-(TkzN-TpN)*((TwewN-TzewN)/(TwewN+3*TpN-4*TzewN)))/(TwewN-TpN);

% OBJÊTOŒCI POMIESZCZEÑ
Vw = K1*K2*2.5;
Vp = 0.5*Vw;

% PARAMETRY "DYNAMICZNE"
Cvp = Cp*Ro*Vp;
Cvw = Cp*Ro*Vw;

% WARUNKI POCZ¥TKOWE
Qk0   = QkN;
Tzew0 = TzewN;
Tkz0  = TkzN+1;
Fp0   = FpN;

% WSPÓ£CZYNNIKI TRANSMITANCJI
M   = [Cvw+Cvp, Cvw*(Cp*Ro*Fp0+K2+KP)+Cvp*(Cp*Ro*Fp0+K1+KP), Cp*Ro*Fp0*(Cp*Ro*Fp0+K1+K2+KP)+K1*K2+K1*KP+K2*KP];
L11 = [Cp*Ro*Fp0*(Cp*Ro*Fp0+KP+K2)];
L12 = [K1*(Cp*Ro*Fp0+KP+K2)+KP*K2];
L21 = [Cp*Ro*Fp0*(Cp*Ro*Fp0+KP)];
L22 = [K2*Cvw, K2*(Cp*Ro*Fp0+KP+K1)+K1*(Cp*Ro*Fp0+KP)];

% STAN RÓWNOWAGI
Twew0 = (Cp*Ro*Fp0*Cp*Ro*Fp0*Tkz0+Cp*Ro*Fp0*Tkz0*(KP+K2)+Cp*Ro*Fp0*K1*Tzew0+K1*Tzew0*(KP+K2)+Tzew0*KP*K2)/(Cp*Ro*Fp0*Cp*Ro*Fp0+Cp*Ro*Fp0*(K1+KP+K2)+K1*(K2+KP)+KP*K2);
Tp0   = (Cp*Ro*Fp0*Twew0+KP*Twew0+K2*Tzew0)/(Cp*Ro*Fp0+KP+K2);

% CZAS I SKOKI
czas      = 100000;
czas_skok = 20000;
dTzew     = 0;
dTkz      = 1;

%======= SYMULACJA I WYKRESY ========%
[t] = sim('transmitancje',czas);

figure;
subplot 121;
plot(t,aTwew-273); 
grid on; 
title('Reakcja Twew na skok Tzew = 0'); 
xlabel('t [s]');
ylabel('T [*C]');
subplot 122;
plot(t,aTp-273);
grid on;
title('Reakcja Tp na skok Tzew = 0'); 
xlabel('t [s]');
ylabel('T [*C]');




