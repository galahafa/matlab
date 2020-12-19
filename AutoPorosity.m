%Автоматизация подбора пористости
%introData;
% число для цикла и число попыток
testznach = 0;
Try = 0;
% изменяемое распределение
Changedistribution = startdistribution;
% подбор доли фазы
while testznach  == 0
% Try = 1:10
    Try = Try+1;
    Changedistribution = ceil(startdistribution*koef2Phase);
    % построение распределения сфер по размерам
    raspsphere = Createraspred(startradius,Changedistribution,L);
    % построение трехмерной сетки
    sistema = threedim(raspsphere,L);
    % определение доли фазы
    Fraction2PhaseCount = mean2(sistema);
    % отличие от требуемого
    delta = Fraction2PhaseReq-Fraction2PhaseCount;
    % если модуль отличия больше требуемой точки коэффициент меняется
    if abs(delta) > Precision
            koef2Phase = koef2Phase+koef2Phase*delta;
    else
        break;
    end
end
% построение cPSD
xy = graphPSD(sistema,turnPSD);
%Creategraph;


