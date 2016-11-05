function y = tokenizujFajl(fajl)

    fid = fopen(fajl);
    %y = '';
    if fid == -1
        error('Greska pri otvaranju fajla');
    end
    sadrzajFajla = fscanf(fid,'%c');
    fclose(fid);
    y = sadrzajFajla;
    y = tokenizuj(sadrzajFajla);
    %y = unique(y);
end