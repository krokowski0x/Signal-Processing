clf;
clear all;

fs = 500;
fz = [50];
fp = [10];
Rz = [1];
Rp = [0.95];

fi_z = 2 * pi * fz / fs;
fi_p = 2 * pi * fp / fs;
z = Rz .* exp(1i * fi_z);
p = Rz .* exp(1i * fi_p);
z = [z, conj(z)];
p = [p, conj(p)];

NP = 1000;
fi = 2 * pi * (0:NP-1) / NP;
s = sin(fi);
c = cos(fi);
subplot 321;
plot(s, c, '-k', real(z), imag(z), 'or', real(p), imag(p), 'xb');
grid on;

subplot 326;
zplane(z', p');

wzm = 1;
[b, a] = zp2tf(z', p', wzm);

fmax = 100;
df = 0.1;
f = 0:df:fmax;
w = 2 * pi * f;
wn = 2 * pi * f / fs;

H = freqz(b, a, wn);
Habs = abs(H);
HdB = 20 * log10(Habs / max(Habs));
Hphase = unwrap(angle(H));
subplot 322;
plot(f, HdB); grid on;
subplot 323;
plot(f, Habs); grid on;
subplot 325;
plot(f, Hphase); grid on;
