%% racunanje sprektra (fft)

time=1; % trajanje 2s
F=440; % Hz frekvencija zvuka - isprbati za 220 i 880
Fs=8000; % Hz frekvencija odmjeravanja > 2*F
A=1; % amplituda
t=0:1/Fs:time;
x = A*cos(2*pi*F*t);
N=length(x); % najbolje kad spektar ima isto odmjeraka kao i signal, inace se dopunjavaju
X = fft(x,N);
plot(abs(X));
xlabel('F[Hz]');

%% slozenoperiodicni signal (suma harmonika)

time2=1; % trajanje 2s
F2=440; % Hz frekvencija zvuka - isprbati za 220 i 880
Fs2=8000; % Hz frekvencija odmjeravanja > 2*F
A2=[1, 0.8, 0.1, 0.04]; % amplitude harmonika
t2=0:1/Fs2:time2;
x2=zeros(1,length(t2));
for i=1:length(A2)
    x2 = x2 + A2(i)*cos(2*pi*(i*F2)*t2);
end
N2=length(x2); % najbolje kad spektar ima isto odmjeraka kao i signal, inace se dopunjavaju
X2 = fft(x2,N2);
figure;
plot(abs(X2));
xlabel('F[Hz]');
%sound(x2,Fs2);

%% pravougaoni signal

time3=1; % trajanje 2s
F3=440; % Hz frekvencija zvuka - isprbati za 220 i 880
Fs3=8000; % Hz frekvencija odmjeravanja > 2*F
A3=1; % amplituda
t3=0:1/Fs3:time3;
x3=zeros(1,length(t3));
T3=1/F3;
for i=1:length(t3)
    if(mod(t3(i),T3)<(T3/2))
        x3(i) = A3;
    end
end
%plot(t3,x3);
N3=length(x3); % najbolje kad spektar ima isto odmjeraka kao i signal, inace se dopunjavaju
X3 = fft(x3,N3);
figure;
plot(abs(X3));
xlabel('F[Hz]');
%% sound
sound(x3,Fs3);

%% trougaoni signal

time4=1; % trajanje 2s
F4=440; % Hz frekvencija zvuka - isprbati za 220 i 880
Fs4=8000; % Hz frekvencija odmjeravanja > 2*F
A4=1; % amplituda
t4=0:1/Fs4:time4;
x4=zeros(1,length(t4));
T4=1/F4;
for i=1:length(t4)
    if(mod(t4(i),T4)<(T4/2))
        x4(i) = A4*(mod(t4(i),T4)/(T4*2)); %amplituda * koeficijent
    else
        x4(i) = A4*((T4-mod(t4(i),T4))/(T4*2));
    end
end
%plot(t4,x4);
N4=length(x4); % najbolje kad spektar ima isto odmjeraka kao i signal, inace se dopunjavaju
X4 = fft(x4,N4);
figure;
plot(abs(X4));
xlabel('F[Hz]');
%% sound
sound(x4,Fs4);


