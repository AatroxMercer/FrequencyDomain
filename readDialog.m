function [input] = readDialog(prompt)

    input = str2num(char(inputdlg(prompt)));

end

