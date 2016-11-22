function label = test()
w = pi/16;
L = 128;
n = 0:L-1;
x = cos(w * n);


    N = 64;
    X = fft(x, N);
    w = 2*pi*[0:N-1]/N;
    % DFT se racuna u diskretnim frekvencijama
    %figure, stem(w, abs(X));
    title('DFT')
    xlabel('\omega'); ylabel('|X(\omega)|')
    % spektar diskretnog signala je kontinualna funkcija
    % crtamo aproksimaciju dobijenu pomocu DFT
    %figure, plot(w, abs(X));
    
    w = 2*[0:N-1]/N;
   % figure, stem(w, abs(X));
    %figure, plot(w, abs(X));
    title('Amplitudni spektar')
    xlabel('\omega/\pi'); ylabel('|X(\omega)|')
   % figure, plot(w, 20*log10(abs(X)));
spectrogram(x, hamming(128), 120, 128, 1000, 'yaxis')

[y,f,t,p] = spectrogram(x, hamming(128), 120, 128, 1000,  'yaxis');
%surf(t,f,10*log10(abs(p)),'EdgeColor','none');
axis xy; axis tight; colormap(jet); view(0,90);
xlabel('Time');
ylabel('Frequency (Hz)')


end