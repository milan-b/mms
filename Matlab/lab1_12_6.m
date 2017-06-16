%%
% Zad 1

[Y,FS,NBITS]=WAVREAD('lab1\handel44100.wav');
 % prestavljen je sa nizom 485100 elemenata koji ima dve dimenzije i tipa
 % je double. Svaki odmjeran je kodovan sa 16 bita. Fs je 44100. Memorije
 % zauzima 485100*2*2 bajta - priblizno 2MB. Trajanje signala je
 % 485100/44100 = 11s.
 t = (0:1:length(Y)-1)/FS;
 plot(t,Y);
 xlabel('t[s]');
 ylabel('A');
 
 %%
 % Zad 2
 
 % Zato sto covjek cuje frekvencije do 22000, pa je nikvistova frekvencija
 % omjeravanja za takav zvuk 44000 i doda se jos malo za svaki slucaj.
 
 % FS*NBITS/1000/8 je bit raite u kB
 
 % FS*NBITS/1000/8 * 60 * 74 je potrebno kB za 74min muzike za jedan kanal.
 % Ako je zvuk Stereo onda je potrebno duplo vise.
 
 %Dinamicki opseg signala je 2^16 nivoa
 
 %%
 % Zad 3
 
 sound(Y,FS);
 %Da bi se znalo kojom brizom izvoditi, koliko traje snimak
 
 %U slucaju nize frekvencije snimak bi trajao duze i bio bi usporeni,
 %obrnuto za vise frekvenciju.
 
 sound(Y,22050);
 sound(Y,88200);
 
 %%
 % Zad 4
 
 [y Fs nbits] = wavread('lab1\handel22050.wav');
 sound(y,Fs);
 [y1 Fs1 nbits1] = wavread('lab1\handel11025.wav');
 sound(y1,Fs1);
 
 %Bolji je kvalitet snimka ako se odmjerava visom frekvecijom. Mogu se
 %pokupiti i visoki tonovi.
 
 %%
 % Zad 5
 
yy = flipud(Y);

sound(yy, FS);

%%
% Zad 6

Y2 = Y.*2;
sound(Y2,FS);
 
%%
% Zad 7

t = (0:length(Y)-1)/FS
x = exp(-t/2)';
y = x.*Y(:,1);
sound(y,FS);
 
x = exp(-t/3)';
y = x.*Y(:,1);
sound(y,FS); 

%%
% Zad 8

wavwrite(y,FS,NBITS,'lab1fadeout.wav');

%% SLIKA 
% Zad 1

imfinfo('lab1\LenaRGB.tif')
l = imread('lab1\LenaRGB.tif');
% matricom sa tri dimenzije
% 512 x 512 x 3
% od 0 do 255
% uint8

%% 
% Zad 2

help imshow
% iste ako imread
imshow(l);

%%
% Zad 3

subplot(1,3,1);
r = l(:,:,1);
imshow(r);


subplot(1,3,2);
g = l(:,:,2);
imshow(g);


subplot(1,3,3);
b = l(:,:,3);
imshow(b);

%%
% Zad 4

subplot(1,3,1);
r1 = l;
r1(:,:,2:3) = 0;
imshow(r1);


subplot(1,3,2);
g1 = l;
g1(:,:,1) = 0;
g1(:,:,3) = 0;
imshow(g1);

subplot(1,3,3);
b1 = l;
b1(:,:,1:2) = 0;
imshow(b1);

%%
% Zad 5

rgb = rgb2gray(l);
imshow(rgb);

%%
% Zad 6

subplot(1,3,1);
rgb1 = 255 - rgb;
imshow(rgb1);

%%
% Zad 7

imwrite(rgb1,'negativ.jpeg','jpeg');
IMWRITE(A,FILENAME,FMT)

%% VIDEO
% Zad 1

aviinfo('lab1\mobile.avi')
mov(1) % cdata-slika i colormap[]

%%
% Zad 2

movie(mov,1,30);

%%
% Zad 3

s = zeros(288,352,3,length(mov));
for i = 1 : length(mov)
    video(1,i).cdata = 255 - mov(1,i).cdata;%izdvojene slike i napravljen negativ
    video(1,i).colormap = []; %da bude video
end
movie(video);

%%
% Zad 4

movie2avi(video,'negativVozic.avi');
