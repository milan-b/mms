%%Vjezba4
%% Zadak 1   
t = 0:0.05:3; %Fs = 20Hz
%% Zadatal 2
x = cos(2*pi*t); % F = 1
vrijeme = 0:0.05:3-0.05; %% bolji nacin! -> po formuli sin(2*pi*440*n/Fs);
%%odredimo broj odmjeraka n pa je t = n/Fs
%%umjesto 440 pisemo zeljenu frekvenciju

plot(t,x);
xlabel('t');
ylabel('x(t)');
hold on
stem(t,x,'r');
%% Zadatak 3
t = 0:0.1:3; % Fs = 10Hz
x = cos(2*pi*t);
stem(t,x,'g');
plot(t,x,'g');
%% Zadatak 4
t = 0:0.5:3; % Fs = 2Hz
x = cos(2*pi*t);
stem(t,x,'y');
plot(t,x,'y');

%% Zadatak 5
t1 = 0:0.05:3;
t2 = 0:0.1:3;
t3 = 0:0.5:3;
x1 = cos(2*pi*t1);
x2 = cos(2*pi*t2);
x3 = cos(2*pi*t3);
plot(t1,x1,'r');
hold on
plot(t2,x2,'g');
plot(t3,x3,'y');
stem(t1,x1,'r');
stem(t2,x2,'g');
stem(t3,x3,'y');

%% Zadatak 6
hold off
t = 0:0.1:3; % Fs = 10Hz
x = cos(2*pi*t);
subplot(1,2,1);
stem(t,x,'g');
hold on
plot(t,x,'g');
x1 = cos(2*pi*19*t);
subplot(1,2,2);
stem(t,x1,'b');
hold on
plot(t,x1,'b');
%Reprezentacija ovih signala je identicna zato sto nije postovana 
%Nikvistivo frekvencija odmjeravanja (razliciti signali a ista
%reprezen).

%% Zadatak 7
t = 0:1/11025:2-1/11025;
x = 0.5*cos(2*pi*440*t);
sound(x,11025);
%% Zadatak 8
t = 0:1/11025:2-1/11025;
x = 0.5*cos(2*pi*220*t);
sound(x,11025);
%Nize frekvencije dublji tonovi

%% Zadatak 2.1
figure
Fs = 8000;
t = 0:1/Fs:1-1/Fs;
F = 440;
x = cos(2*pi*F*t);
X = fft(x);
N = length(t);
w = 2*pi*[0:N-1]/N;
f = Fs*[0:N-1]/N;
plot(w,abs(X));
ylabel('|X(\omega)|'); xlabel('\omega')
title('Amplitudni spektar');

%% Zadatak 2.2
Fs = 8000;
F = 440;
t = [0:1/Fs:1-1/Fs];
x1 = cos(2*pi*F*t);
x2 = 0.8*cos(2*pi*1000*t);
x3 = 0.1*cos(2*pi*2000*t);
x4 = 0.04*cos(2*pi*3000*t);
x = x3+x1+x2+x4;
plot(x4)
axis([0 100 -0.05 0.05])
N = length(t);
w = 2*pi*(0:N-1)/N;%u rad/s. 
%Ako hocemo Hz -> w = (0:N-1)/N;
X = fft(x);
plot(w,abs(X))
xlabel('\omega'); ylabel('X(\omega)')
%% Zadatak 2.3
Fs = 8000;
F = 440;
t = [0:10*Fs-1]/Fs;
N = length(t);
x = square(2*pi*F*t);
X = fft(x);
w = 2*pi*(0:N-1)/N;
plot(w,abs(X));
hold on
stem(w,abs(X),'y');
xlabel('\omega'); ylabel('X(\omega')
%% Zadatak 2.4

Fs = 8000;
F = 440;
t = [0:10*Fs-1]/Fs;
N = length(t);
x = sawtooth(2*pi*F*t,0.5);
X = fft(x);
w = 2*pi*(0:N-1)/N;
plot(w,abs(X));
xlabel('\omega'); ylabel('X(\omega')
%% Zadatak 2.5
[x Fs] = wavread('piano_A4');
plot(x);
sound(x,Fs);
N = length(x);
X = fft(x);
w = 2*pi*(0:N-1)/N;
plot(w,abs(X));
xlabel('\omega'); ylabel('X(\omega')
%% Zadatak 3.1
[x Fs] = wavread('piano_A4');
plot(x);
sound(x,Fs);
N = length(x);
X = fft(x);
w = 2*pi*(0:N-1)/N;
plot(w,abs(X));
for i = 1:N
    if(abs(X(i)) > 1200)
        A = abs(X(i));
        k = i;        
        break;
    end
end
F = Fs * k / N; %%Fs i N su jednkani ako je t = 1s @ moze se ovo dosta elegantnije odraditi
x = A * cos(w*F);
t = [0:1/Fs:(N-1)/Fs];
for i = 1:N/10 % /10 da brze izracuna - malo nepreciznije
    x = x + (abs(X(i))*cos(2*pi*(F+Fs*i/N)*t));
end
x = x/max(abs(x));
plot(t,x);
sound(x,Fs);
%% Zadatak 3.2
y = exp(-t/0.35);
x1 = x.*y;
%
plot(t,x1);
sound(x1,Fs);sound(x,Fs);
%za test
[x Fs] = wavread('piano_A4');
plot(x);
sound(x,Fs);
%% Zadatak 3.3
Fc1 = 262;
Fk = 262/8;

F1 = Fc1 + 0 * Fk;
F2 = Fc1 + 1 * Fk;
F3 = Fc1 + 2 * Fk;
F4 = Fc1 + 3 * Fk;
F5 = Fc1 + 4 * Fk;
F6 = Fc1 + 5 * Fk;
F7 = Fc1 + 6 * Fk;
F8 = Fc1 + 7 * Fk;

Fs = 8000;
t = [0:0.5*Fs-1]/Fs;

x1 = cos(2*pi*t*F1);
x2 = cos(2*pi*t*F2);
x3 = cos(2*pi*t*F3);
x4 = cos(2*pi*t*F4);
x5 = cos(2*pi*t*F5);
x6 = cos(2*pi*t*F6);
x7 = cos(2*pi*t*F7);
x8 = cos(2*pi*t*F8);

sound(x1,Fs);
sound(x2,Fs);
sound(x3,Fs);
sound(x4,Fs);
sound(x5,Fs);
sound(x6,Fs);
sound(x7,Fs);
sound(x8,Fs);

sound(x1,Fs);

%% Zadatak 4.1
Fs = 8000;
t = [0:Fs-1]/Fs;
x1 = cos(2*pi*100*t);
x2 = cos(2*pi*200*t);
x3 = cos(2*pi*500*t);
x4 = cos(2*pi*1000*t);
x = [x1 x2 x3 x4];
plot(x)
axis([1000 1200 -2 2])%podesava prikaz
spectrogram(x,hamming(256),128,1024,Fs,'yaxis')
%% Zadatak 4.2
Fs = 22050;
mi = 11025;
t = [0:Fs-1]/Fs;
x = cos(2*pi*mi*t.*t);
sound(x,Fs);
spectrogram(x,hamming(256),255,1024,Fs,'yaxis')
%% Zadatak 4.3
[x Fs] = wavread('piano_A4');
spectrogram(x,hamming(512),256,1024,Fs,'yaxis')
%% Zadatak 4.4
[x Fs] = wavread('iaeao');
sound(x,Fs)
spectrogram(x,hamming(512),480,1024,Fs,'yaxis')
%% Zadatak 4.5
spectrogram(x,hamming(64),32,1024,Fs,'yaxis')
%% Zadatak 4.6
[x Fs] = wavread('sat');
sound(x,Fs)
spectrogram(x,hamming(512),481,1024,Fs,'yaxis')
