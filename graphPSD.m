function xy=graphPSD(sistema,pre)
% построение cPSD
% применяется tophat filter с диском различного размера
% размера диска
i = 0;
% генерируется новая уменьшенная по оси Z модель
iii = 0;
for ii = 1:pre:size(sistema,3)
    iii = iii+1;
    B = sistema(:,:,ii);
    Newmodel(:,:,iii) = B;
end
FracInNewModel = mean2(Newmodel);
     while i < 85
         i = i+1;
         % создание диска
         mat = strel('disk',i-1);
         iii = 0;
         % с заданным шагом каждая плоскость фильтруется и записывается в новое изображение 
         for ii = 1:pre:size(sistema,3)
             iii = iii+1;
             B = sistema(:,:,ii);
             C(:,:,iii) = imtophat(B,mat);
         end
         xy(i,2) = FracInNewModel-mean2(C); % Расчет пористости
         xy(i,1) = (i*2)/(200/20); % Расчет размеров частиц
     end
unn=xy(1,2); % Нормировака на 1
for i=1:size(xy,1)
    xy(i,2) = xy(i,2)/unn;    
end



