function [training_set, training_C, test_set, test_C] = compute_collection_representation(vocab, conf)

%% Formiraj listu trening fajlova
training_filepaths = {};
training_C = {};
for p = 1:length(conf.training_filepath)
    files = dir(fullfile(conf.training_filepath{p}, '*.txt'));
    fp = cellfun(@(x) fullfile(conf.training_filepath{p}, x), {files.name}, 'UniformOutput', false);
    training_filepaths = [training_filepaths, fp{:}];
    training_C{end+1} = conf.training_classes(p) * ones(length(files), 1);
end

%% Formiraj trening skup
training_set = zeros(length(training_filepaths), length(vocab));
for n = 1:length(training_filepaths)
    training_set(n, :) = compute_document_representation(training_filepaths{n}, vocab, conf);
end
training_set = bsxfun(@rdivide, training_set, sqrt(sum(training_set.^2, 2)));

training_C = cat(1, training_C{:});

%% Formiraj listu testnih fajlova
test_filepaths = {};
test_C = {};
for p = 1:length(conf.test_filepath)
    files = dir(fullfile(conf.test_filepath{p}, '*.txt'));
    fp = cellfun(@(x) fullfile(conf.test_filepath{p}, x), {files.name}, 'UniformOutput', false);
    test_filepaths = [test_filepaths, fp{:}];
    test_C{end+1} = conf.test_classes(p) * ones(length(files), 1);
end

%% Formiraj test skup
test_set = zeros(length(test_filepaths), length(vocab));
for n = 1:length(test_filepaths)
    test_set(n, :) = compute_document_representation(test_filepaths{n}, vocab, conf);
end
test_set = bsxfun(@rdivide, test_set, sqrt(sum(test_set.^2, 2)));

test_C = cat(1, test_C{:});
