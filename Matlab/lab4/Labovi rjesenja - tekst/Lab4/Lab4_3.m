%% piano A4
[y,Fs]=audioread('piano_A4.wav');
sound(y,Fs);
subplot(2,1,1);
plot(y);
Y=fft(y,length(y));
subplot(2,1,2);
plot(abs(Y));

%% sintetizovani ton iz spektra prethodnog

% ovdje vjerovatno ne treba ovo raditi vec samo naci osnovni harmonik,
% napraviti sinusni signal njegove frekvencije i ponoziti ga sa envelopom
% od eksponencijalne funkcije, a ne ovom envelopom koja se dobija inverznom
% furijerovom transformacijom jer stvarno ne znam zasto se tu uopste dobila
% envelopa a ne pravi signal XD

time=1;
t=0:1/Fs:time;
[~,F]=max(abs(Y)); %pozicija maksimuma je frekvencija osnovnog harmonika
y_sin=sin(2*pi*F*t); % sinusni signal sa osnovnom frekvencijom
E=abs(ifft(Y,length(t))); % E - envelopa
E=E';
y_sintetic=y_sin.*E; % proizvod signala i envelope
Y_sintetc=fft(y_sintetic,length(y_sintetic)); % spektar sintetisanog signala
%% iscrtavanje
figure;
subplot(1,3,1);
plot(E);
subplot(1,3,2);
plot(y_sintetic);
subplot(1,3,3);
plot(abs(Y_sintetc));
%% sintetizovani zvuk:
sound(y_sintetic,Fs);

%% utisavanje pomocu eksponencijalne funkcije
Te=0.35;
e=exp(-t/Te);
y_utisano=y_sintetic.*e;
sound(y_utisano,Fs);

plot(e);

