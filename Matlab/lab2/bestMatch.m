function y = bestMatch(strNiz,str)

%1.parameter needs to be celluar array, and 2. needs to be a string;

    for c = 1:length(strNiz)
         rez1(c) = length(intersect(strNiz{c},str));
    end
    pomRez = rez1 == max(rez1);
    y = strNiz(pomRez);
end