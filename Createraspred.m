function massivrasp = Createraspred(rad,distribution,volume) 
% создание распределения сфер по размерам
% число радиусов
lengthrad = length(rad);
% счетчики
c = 0;
schet = 1;
% для каждого радиуса
for i = 1:lengthrad
    % определяется число шагов 
        step = lengthrad+1-i;
        radius = rad(step);
        N = distribution(step);
        iter = N;
        % строятся сферы данного размера
        for j = 1:iter
            c = c+1;
            proverka = 0;    
            % координаты строятся пока не выполнится условие, сферы
            % перекрываются не более 20 процентов по радиусу
            while proverka == 0
                proverka = 1;
                % генерация координат запись в общий файл
                randsp(1) = rand*(volume(1)+radius*2)-radius;
                randsp(2) = rand*(volume(2)+radius*2)-radius;
                randsp(3) = rand*(volume(3)+radius*2)-radius;
                massivrasp(schet,1) = randsp(1);
                massivrasp(schet,2) = randsp(2);
                massivrasp(schet,3) = randsp(3);
                massivrasp(schet,4) = radius;
                if schet > 1
                    for z = 1:schet-1
                        rast = norm(massivrasp(z,1:3)-randsp);
                        if rast < massivrasp(z,4)*0.8
                            proverka = 0;
                        end
                    end 
                end
                if proverka == 1
                   break
                end          
            end
            schet = schet+1;
        end
end