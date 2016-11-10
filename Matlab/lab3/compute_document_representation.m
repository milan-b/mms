function vector = compute_document_representation(filepath, vocab, conf)
% Izracunava reprezentaciju dokumenta u vektorskom prostoru

tokens = extract_tokens(filepath, conf);
vector = zeros(1, length(vocab));

l = 0;
for n = 1:length(tokens)
    ind = find(strcmp(tokens{n}, vocab));
    vector(ind) = vector(ind) + 1;

%     str = num2str(ind);
%     if (l + length(str) + 1) > 78
%         fprintf('\n');
%         l = 0;
%     end
%     fprintf('%s ', str);
%     l = l + length(str) + 1;
end
% fprintf('\n');