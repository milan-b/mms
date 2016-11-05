function y = readFile(file)
%Argument naziv fajla. Vraca sadrzaj fajla kao string.
    fid = fopen(file);
    y = fscanf(fid,'%c');
    fclose(fid);
end