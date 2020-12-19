Psd_filename = 'PSD.xlsx';
Psd_filename = insertBefore(Psd_filename,'.','-'+string(Fraction2PhaseReq)+'-');
Psd_filename = insertBefore(Psd_filename,'.',string(porad));
sist_filename = 'part.xlsx';
sist_filename = insertBefore(sist_filename,'.','-'+string(Fraction2PhaseReq)+'-');
sist_filename = insertBefore(sist_filename,'.',string(porad));
path = cd;
xy(1,3) = Fraction2PhaseCount;
xy(2,3) = L(1);
pat = '\'+string(Fraction2PhaseReq);
pat = convertStringsToChars(pat);
if ~exist(string(Fraction2PhaseReq), 'dir')
       mkdir(string(Fraction2PhaseReq))
    end
cd([path,pat]);
xlswrite(Psd_filename,xy);
xlswrite(sist_filename,raspsphere);
cd(path);
