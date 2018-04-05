close all;

fs = 1000;
N = 500;
T = N/fs;
dt = 1/fs;
t = 0:dt:T-dt;
f1 = 101; f2 = 160.5;
A1 = 1; A2 = 0.8;

x1 = A1*cos(2*pi*f1*t);
x2 = A2*cos(2*pi*f2*t);
x = x1+x2;

X = abs(fft(x));
df = fs/N;
f = 0:df:fs-df;

figure;
grid on;

subplot 221;
plot(t,x); title(['Czestotliwosci cos: f1=',num2str(f1),' f2=',num2str(f2)]);  

subplot 222;
plot(f,x_win);
grid on;

subplot 223;
stem(f(1:N/4),X(1:N/4),'*'); title(['Widmo amplitudowe, rodzielczosc ',num2str(df),'Hz']);
grid on;

x_win = x.*hanning(length(x))';
X_win = abs(fft(x_win));
subplot 224;
stem(f(1:N/4),X_win(1:N/4),'*');
grid on;
