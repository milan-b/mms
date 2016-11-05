function y = docVek(rijecnik,rijeci)
%1.Prvi unos je rijecnik a 2. rijeci. Vraca vektorsku reprezentaciju
%vektora.
    for c = 1:length(rijecnik)
    pom = strcmp(rijecnik(c),rijeci);
    rez(c) = length(pom(pom == 1));
    end
    y = rez;
end