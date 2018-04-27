close all;
clear all;

%======= DANE DO SYMULACJI =======%

% ZMIENNE WYJ�CIOWE
TwewN = 20 + 273;
TpN   = 15 + 273;

% DANE TABLICOWE
Cp = 1000;
Ro = 1.2;

% ZMIENNE WEJ�CIOWE
QkN   =  20000;     % Qk = Cp*Ro*Fp*Tkz, wi�c pomijamy j� jako zm. wej.
TzewN = -20 + 273;
TkzN  =  35 + 273;
FpN   =  QkN / (Cp*Ro*TkzN);

% WSPӣCZYNNIKI UK�ADU
K1 = (QkN/TkzN) * (TkzN-TpN) / (TwewN+3*TpN-4*TzewN);
K2 = 3 * K1;
KP = (QkN/TkzN) * ((TkzN-TwewN) - (TkzN-TpN) * ((TwewN-TzewN) / (TwewN+3*TpN-4*TzewN))) / (TwewN-TpN);

% OBJ�TO�CI POMIESZCZE�
Vw = K1 * K2 * 2.5;
Vp = 0.5 * Vw;

% PARAMETRY "DYNAMICZNE"
Cvp = Cp * Ro * Vp;
Cvw = Cp * Ro * Vw;

% WARUNKI POCZ�TKOWE
Qk0   = QkN;
Tzew0 = TzewN;
Tkz0  = TkzN;
Fp0   = FpN * 0.8;

% DEFINICJA MACIERZY
A = [-(Cp*Ro*Fp0+K1+KP)/Cvw,  KP/Cvw;
      (Cp*Ro*Fp0+KP)/Cvp,   -(Cp*Ro*Fp0+K2+KP)/Cvp;];
B = [(Cp*Ro*Fp0)/Cvw, K1/Cvw;
            0,        K2/Cvp;];
C = [1,0;0,1;];
D = [0,0;0,0;];

% STAN R�WNOWAGI

u0 = [Tkz0;Tzew0];
x0 = -A^-1*B*u0;

% CZAS I SKOKI
czas      = 100000;
czas_skok = 20000;
dTzew     = 0;
dTkz      = 0;

%======= SYMULACJA I WYKRESY ========%
[t] = sim('statespace', czas);

figure;
subplot 121;
plot(t, aTwew-273);
grid on;
title('Reakcja Twew na skok Tzew = 0');
xlabel('t [s]');
ylabel('T [*C]');
subplot 122;
plot(t, aTp-273);
grid on;
title('Reakcja Tp na skok Tzew = 0');
xlabel('t [s]');
ylabel('T [*C]');
