function y = strSplit(str)
%Argument je string za splitovanje
    y={};
    eci = str;
    while true
        [rez ostatak] = strtok(eci);
        y{end+1} = rez;
        if isempty(ostatak), break, end
        eci = ostatak;
    end
end