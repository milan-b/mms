function tokens = extract_tokens(filepath, conf)
% Cita sve tokene (rijeci) iz fajla cija je putanja zadata u conf.filename.
% Vraca celijski niz tokens.

%    tokens = textread(filepath, '%s', 'delimiter',  ' 1234567890!@#$%^&*()_+-=[]{};:\\''"|,./<>?`~');

    fid = fopen(filepath, 'r');
    email_contents = fscanf(fid, '%c', inf);
    fclose(fid);
    
    % Pronadji zaglavlja (\n\n) i ukloni ih
    % Ako radite sa email porukama koje imaju kompletno zaglavlje uklonite 
    % komentare iz naredne dvije linije
    % hdrstart = strfind(email_contents, ([char(10) char(10)]));
    % email_contents = email_contents(hdrstart(1):end);
    
    % Prebaciti sve poruke u mala slova
    email_contents = lower(email_contents);
    
    % Ukloniti HTML
    % Trazi se izraz koji pocinje sa < zavrsava sa > i unutar kojeg ne
    % postoje < i >
    email_contents = regexprep(email_contents, '<[^<>]+>', ' ');
    
    % Brojevi se mijenjaju rijeci number
    % Traze se nizovi cifara 0-9
    email_contents = regexprep(email_contents, '[0-9]+', 'number');
    
    % URL-ovi se mijenjaju rijeci httpaddr
    % Traze se stringovi koi pocinju sa http:// ili https://
    email_contents = regexprep(email_contents, ...
        '(http|https)://[^\s]*', 'httpaddr');
    
    % Email adrese
    % Traze se stringovi u kojima se nalazi @
    email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');
    
    % Znak $
    email_contents = regexprep(email_contents, '[$]+', 'dollar');

    tokens = {};
    l = 0;
    while ~isempty(email_contents)

        % Tokenizacija i uklanjanje interpunkcije
        [str, email_contents] = ...
            strtok(email_contents, ...
            [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
        
        % Uklanjanje nealfanumerickih znakova
        str = regexprep(str, '[^a-zA-Z0-9]', '');
        
        % Stemming
        % (porterStemmer ima bagove pa koristimo try catch blok)
        try str = porterStemmer(strtrim(str));
        catch str = ''; continue;
        end;
        
        % zadrzi token ako je njegova duzina veca ili jednaka od
        % conf.minlen
        if length(str) >= conf.minlen
            tokens{end+1} = str;
%             if (l + length(str) + 1) > 78
%                 fprintf('\n');
%                 l = 0;
%             end
%             fprintf('%s ', str);
%             l = l + length(str) + 1;
        end
        
    end
%     fprintf('\n');