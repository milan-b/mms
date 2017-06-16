%prvi kolokvij
%%Zadatak 1
conf = get_conf();
vocab = generate_vocab(3,4);
[training_set, training_C, test_set, test_C] = ...
    compute_collection_representation(vocab, conf);
%% Formiraj listu fajlova
filepaths = {};
for p = 1:length(conf.training_filepath)
    files = dir(fullfile(conf.training_filepath{p}, '*.txt'));
    fp = cellfun(@(x) fullfile(conf.training_filepath{p}, x), {files.name}, 'UniformOutput', false);
    filepaths = [filepaths, fp{:}];
end

for i = 1:length(filepaths)
    fprintf('%d. %s \n',i,filepaths{i});
end
%fprintf('Unesite redni broj fajla po kom zelite vrsiti pretragu! ');

fajl = input('Unesite redni broj fajla po kom zelite vrsiti pretragu! ');
fprintf('Pretragu vrsite po fajlu %s! \n',filepaths{fajl});


for i = 1:length(training_set(:,1))
    rez(i) = sum(training_set(i,:) .* training_set(fajl,:));
end
[~,i]=max(rez);

fprintf('Najslicniji je %d. dokumentu su: \n',i);

for j = 1:5
    fprintf('%d. %s je slican:%f\n',j,filepaths{i},rez(i));
    rez(i) = 0;
    [~,i]=max(rez);
end

