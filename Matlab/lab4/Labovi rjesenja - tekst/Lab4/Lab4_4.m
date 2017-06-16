%% generisanje 4 tona
time=1; % trajanje tona 1s
Fs=8000;
t=0:1/Fs:time;
F1=100;
F2=200;
F3=500;
F4=1000;
x1=cos(2*pi*F1*t);
x2=cos(2*pi*F2*t);
x3=cos(2*pi*F3*t);
x4=cos(2*pi*F4*t);
x=[x1 x2 x3 x4];
%sound(x,Fs);

%% spektogram 4 tona
spectrogram(x,256,255,1024,Fs);

%% chirp signal
mi=11025;
time_chirp=1;
Fs_chirp=22050;
t_chirp=0:1/Fs_chirp:time_chirp;
x_chirp=cos(2*pi*mi*t_chirp.*t_chirp);
%sound(x_chirp,Fs_chirp);
spectrogram(x_chirp,256,255,1024,Fs_chirp);

%% piano A4 spectogram
[a4,Fs_a4]=audioread('piano_A4.wav');
spectrogram(a4,512,256,1024,Fs_a4);

%% govorni signal spektogram
[govor,Fs_govor]=audioread('iaeao.wav');
spectrogram(govor,512,480,1024,Fs_govor);
%% manji prozor spektograma za govor
spectrogram(govor,64,32,1024,Fs_govor);

%% govorni signal - sat
[sat,Fs_sat]=audioread('sat.wav');
spectrogram(sat,512,481,1024,Fs_sat);












