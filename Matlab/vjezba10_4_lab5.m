%% Zadatak 1
[x, Fs, nbits] = wavread('acoustic.wav');
% Koeficijenti niskopropusnog filtra drugog reda sa granicnom frekvencijom
% od 32 Hz
[b, a] = butter(2, 2*32/Fs, 'low');
% Amplitudska i fazna karakteristika filtra
freqz(b, a, 1000, Fs);