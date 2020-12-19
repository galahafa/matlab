clear all;
% номер записываемого файла
for curtime=3:3
clearvars -except curtime;
    

% количество запущенных программ
for i = 1:1
    % основная программа
    AutoPorosity;
    porad = porad+1;
     createpore;
     sistema1 = sistema;
     sistema1(find(sistema == 1)) = 0;
     sistema1(find(sistema == 2)) = 1;
     xy1 = graphPSD(sistema1, 10);
    SaveDistr;
    clear arraypore; clear xy1; sistema(find(sistema == 2)) = 0;
end
end