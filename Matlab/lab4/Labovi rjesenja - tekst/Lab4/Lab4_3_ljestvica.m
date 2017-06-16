%% ljestvica
time=1; % trajanje tona 1s
Fs=8000;
t=0:1/Fs:time;
%% envelopa
Te=0.35; % trajanje utisavanja
envelopa=exp(-t/Te);
%% frekvencije tonova c1,d,,f,g,a,h,c2
Fc1=261.626;
Fd=293.665;
Fe=329.628;
Ff=349.228;
Fg=391.995;
Fa=440;
Fh=493.883;
Fc2=523.251;
%% izracunavanje signala
c1 = cos(2*pi*Fc1*t);
d = cos(2*pi*Fd*t);
e = cos(2*pi*Fe*t);
f = cos(2*pi*Ff*t);
g = cos(2*pi*Fg*t);
a = cos(2*pi*Fa*t);
h = cos(2*pi*Fh*t);
c2 = cos(2*pi*Fc2*t);
%% dodavanje envelope
c1 = c1.*envelopa;
d = d.*envelopa;
e = e.*envelopa;
f = f.*envelopa;
g = g.*envelopa;
a = a.*envelopa;
h = h.*envelopa;
c2 = c2.*envelopa;
%% testiranje
%sound(c1,Fs);
%sound(d,Fs);
%sound(e,Fs);
%sound(f,Fs);
%sound(g,Fs);
%sound(a,Fs);
%sound(h,Fs);
%sound(c2,Fs);
ljestvica=[c1,d,e,f,g,a,h,c2];
sound(ljestvica,Fs);





