%%Prvi zadatakad prvog kolokvija
unos = input('Pretraga?\n','s');
words = {};
ostatak = unos;
while(ostatak)
    [pom ostatak] = strtok(ostatak,' ');
    words{end+1} = pom;
end
words
%test data
words{1}='zodiac'
words{2}='neka'
%
rez = zeros(length(words),length(vocab));

for i = 1:length(words)
    rez(i,:) = strcmp(words(i),vocab);
end

acell = {};
for i = 1:length(words)
    for j = 1:length(test_set(:,1))
       %rezF(j).w =  test_set(j,:).*rez(i,:);
       pom = test_set(j,:).*rez(i,:);
       rezF(j).s = sum (pom);
       rezF(j).t = test_filepaths{j};
    end
end

acell = struct2cell(rezF);
acell = sortrows(acell,1)

% % Convert to a matrix
% Acell = reshape(Acell, sz(1), []);      % Px(MxN)
% 
% % Make each field a column
% Acell = Acell';                         % (MxN)xP
% 
% % Sort by first field "name"
% Acell = sortrows(Acell, 1)
IMA NEGDJE GRESKA, NE ZNAM GDJE, PROVJERITI SVE!

