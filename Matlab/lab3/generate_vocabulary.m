function vocab = generate_vocabulary(conf)
% Generise rjecnik za dokumente koji se nalaze na putanji conf.filepath
% conf.filepath moze sadrzati vise od jedne putanje


%% Formiraj listu fajlova
filepaths = {};
for p = 1:length(conf.training_filepath)
    files = dir(fullfile(conf.training_filepath{p}, '*.txt'));
    fp = cellfun(@(x) fullfile(conf.training_filepath{p}, x), {files.name}, 'UniformOutput', false);
    filepaths = [filepaths, fp{:}];
end

%% Izdvojiti tokene iz svakog fajla i dodati u rjecnik 
all_tokens = {};
for n = 1:length(filepaths)
    tokens = extract_tokens(filepaths{n}, conf);
    all_tokens = [all_tokens, tokens{:}]; 
end

%% Zadrzati samo jedinistvena pojavljivanja tokena
vocab = unique(all_tokens); % vocab ce biti i sortiran

%% Koliko puta se javlja svaki termin
vector = zeros(1, length(vocab));

for n = 1:length(all_tokens)
    ind = find(strcmp(all_tokens{n}, vocab));
    vector(ind) = vector(ind) + 1;
end

%% Ostavicemo samo one koji se javljaju vise od conf.mintf puta
ind = vector > conf.mintf;
vocab = vocab(ind);

