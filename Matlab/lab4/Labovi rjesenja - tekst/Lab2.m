% help strfun;
str='zdravo';
%% niz stringova:
niz={'zdravo','zbogom','zdravo','zbogom','zdravo','zdravoratumski'};

%% broj pojavljivanja stringa 'zdravo' u nizu
czs=sum(strcmp(niz,'zdravo'));

%% broj pojavljivanja rijeci 'zdravo' u nizu
czr=0;
niz_find = strfind(niz,'zdravo');
for i=1:length(niz_find)
    czr=czr+length(niz_find{i});
end

%% rijec najslicnija sa 'zdravorazumski'
presjeci=zeros(1,length(niz)); %duzine presjeka sa pojedinim stringovima niza
for i=1:length(niz)
    presjeci(i)=length(intersect(niz{i},'zdravorazumski'));
end
[~,pozicija]=max(presjeci); %pozicija najboljeg presjeka
najslicina=niz{pozicija}; %najslicinija rijec

%% tokenizacija
recenica='eci peci pec ti si mali zec';
tokeni = {};
ostatak=recenica;
while ~isempty(ostatak)
    [tokeni{end+1},ostatak]=strtok(ostatak);
end

%% ucitavanje fajla
fid=fopen('101nos.txt');
sadrzaj=fscanf(fid,'%c', inf);
fclose(fid);

%% tokenizacija fajla
rijeci = {};
ostatak=sadrzaj;
while ~isempty(ostatak)
    [rijeci{end+1},ostatak]=strtok(ostatak,sprintf(' ,.\n\r"')); %razni delimiteri
end

%% formiranje rjecnika
rijecnik = unique(rijeci);

%% vektorska reprezentacija dokumenta - broj ponavaljanja rijeci iz rijecnika

doc=zeros(length(rijecnik),1);
for i=1:length(rijecnik)
    doc(i)=sum(strcmp(rijeci,rijecnik{i}));
end




