%%ucitavanje audio fajla
[y, Fs] = audioread('handel22050.wav');
%pustanje zvuka
sound(y,Fs);
%%iscrtavanje signala(dva kanala)
plot(y(:,1));
figure;
plot(y(:,2));
%%zvuk unazad
yf=flipud(y);
sound(yf,Fs);
%%pojacan zvuk
y2=2*y;
sound(y2,Fs);
y5=5*y;
sound(y5,Fs);
%%fadeout
t=1/Fs:1/Fs:size(y)/Fs;
t=t';
T=1;
x=exp(-t/T);
yx(:,1)=y(:,1).*x;
yx(:,2)=y(:,2).*x;
plot(yx);
sound(yx,Fs);