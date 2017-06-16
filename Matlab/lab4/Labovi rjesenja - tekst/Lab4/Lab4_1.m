%% kosinusni signal

time=3;
F=1;
Fs=20; % -> Ts = 1/20 = 0.05 s ; isprobati za 10, 2
t1=0:1/Fs:time;
x1 = cos(2*pi*F*t1); % x(t)=A*cos(2*pi*F*t+teta) -> F = 1 Hz ; teta = 0 ; A=1
plot(t1,x1);
xlabel('t1');
ylabel('cos(2*pi*t)');
hold on;
stem(t,x1,'ro');

%% dodati odmjerci signala sa Fs2=10, Fs3=2
Fs12=10;
Fs13=2;
t12=0:1/Fs12:time;
t13=0:1/Fs13:time;
x12= cos(2*pi*F*t12);
x13= cos(2*pi*F*t13);
stem(t12,x12,'bx');
stem(t13,x13,'g+');
hold off;

%% signal frekvencije vece od Fs/2 (F=19, Fs=10)

F2=19;
Fs2=10;
t2=0:1/Fs2:time;
x2 = cos(2*pi*F2*t2);
figure;
plot(t2,x2);
xlabel('t2');
ylabel('cos(2*pi*19*t)');

%zbog toga sto je Fs<2*F dobijamo signal koji izgleda kao da mu je F=1Hz, a
%ne 19Hz

%% generisanje sinusnog zvucnog signala

time3=2; % trajanje 2s
F3=440; % Hz frekvencija zvuka - isprbati za 220 i 880
Fs3=11025; % Hz frekvencija odmjeravanja > 2*F
A=0.5; % amplituda
t3=0:1/Fs3:time3;
x3 = A*cos(2*pi*F3*t3);
sound(x3,Fs3);
