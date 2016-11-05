function y = tokenizuj(eci1)
    if ~isvector(eci1),error('Input must be a vector'),end
    y={};
    eci = eci1;
    while true
        [rez ostatak] = strtok(eci);
        y{end+1} = rez;
        if isempty(ostatak), break, end
        eci = ostatak;
    end
end
