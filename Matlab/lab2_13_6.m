%%
% Zad 1,2

str = 'zdravo';
str_niz = {'zdravo', 'zbogom', 'zdravo', 'zbogom', 'zdravo', 'zdravoratumski'};

%%
% Zad 3

a = strfind(str_niz,str);
a = cell2mat(a);
rez = sum(a);

%%
% Zad 4

a = strcmp(str_niz,str);
rez = sum(a);

%%
% Zad 5

upit = 'zdravorazumski';
max = 0;
maxi = 0;
for i = 1 : length(str_niz)
    a = intersect(upit,str_niz{i});
    if(length(a) > max )
        max = length(a);
        maxi = i;
    end
end
fprintf('Naslicnija rijec je %s\n',str_niz{maxi});

%% 
% Zad 6

eci = 'eci peci pec ti si mali zec';
t = {};
while(eci)
    [tok,eci] = strtok(eci,' ');
    t{end+1} = tok;
end

%% 
% Zad 7

f = fopen('101nos.txt');
sadrzaj_fajla = fscanf(f, '%c',inf);

%%
% Zad 8

rijeci = {};
ostatak = sadrzaj_fajla;
while(ostatak)
    [rijeci{end+1},ostatak] = strtok(ostatak,[' .,?![]/"' char(9) char(10) char(13)]);
end

%%
% Zad 9

rjecnik = unique(rijeci);

%%
% Zad 10

v = zeros(1,length(rjecnik));
for i = 1 : length(rjecnik)
    v(i) = sum(strcmp(rjecnik(i),rijeci));
end