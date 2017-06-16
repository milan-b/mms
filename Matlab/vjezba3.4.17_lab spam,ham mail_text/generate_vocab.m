%%prvi kolokvij
%%Zadatak 1
function vocabNew = generate_vocab(m,n)
%conf.minlen = m;
%conf.maxlen = n;
vocabNew = {};
conf = get_conf();
vocab = generate_vocabulary(conf);
for i = 1:length(vocab)
    if (length(vocab{i}) >= m)
        if (length(vocab{i}) <= n)
            vocabNew{end+1} = vocab{i};
        end
    end
end
