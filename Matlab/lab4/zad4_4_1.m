t = 0:1/8000:1-1/8000;
x1= cos(2*pi*100*t);
x2= cos(2*pi*200*t);
x3= cos(2*pi*500*t);
x4= cos(2*pi*1000*t);
x = x1 + x2 + x3+x4;
X= fft(x);
stem(0:7999,abs(X))
help hemming

hemming not found.

Use the Help browser search field to search the documentation, or
type "help help" for help command options, such as help for methods.

x5 = [x1 x2 x3 x4];
spectrogram( x5,hamming(256),128,1024,8000)
x5 = [x x1 x2 x3 x4];
spectrogram( x5,hamming(256),128,1024,8000)