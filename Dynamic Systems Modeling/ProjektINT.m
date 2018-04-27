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
Fp0   = FpN;

% STAN R�WNOWAGI
Twew0 = (Cp*Ro*Fp0*Cp*Ro*Fp0*Tkz0+Cp*Ro*Fp0*Tkz0*(KP+K2)+Cp*Ro*Fp0*K1*Tzew0+K1*Tzew0*(KP+K2)+Tzew0*KP*K2) / (Cp*Ro*Fp0*Cp*Ro*Fp0+Cp*Ro*Fp0*(K1+KP+K2)+K1*(K2+KP)+KP*K2);
Tp0   = (Cp*Ro*Fp0*Twew0+KP*Twew0+K2*Tzew0) / (Cp*Ro*Fp0+KP+K2);

% CZAS I SKOKI
czas      = 100000;
czas_skok = 20000;
dTzew     = 0;
dTkz      = 0;
dFp       = 0;

%======= SYMULACJA I WYKRESY ========%
[t] = sim('integratory', czas);

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
