%������������� ������� ����������
%introData;
% ����� ��� ����� � ����� �������
testznach = 0;
Try = 0;
% ���������� �������������
Changedistribution = startdistribution;
% ������ ���� ����
while testznach  == 0
% Try = 1:10
    Try = Try+1;
    Changedistribution = ceil(startdistribution*koef2Phase);
    % ���������� ������������� ���� �� ��������
    raspsphere = Createraspred(startradius,Changedistribution,L);
    % ���������� ���������� �����
    sistema = threedim(raspsphere,L);
    % ����������� ���� ����
    Fraction2PhaseCount = mean2(sistema);
    % ������� �� ����������
    delta = Fraction2PhaseReq-Fraction2PhaseCount;
    % ���� ������ ������� ������ ��������� ����� ����������� ��������
    if abs(delta) > Precision
            koef2Phase = koef2Phase+koef2Phase*delta;
    else
        break;
    end
end
% ���������� cPSD
xy = graphPSD(sistema,turnPSD);
%Creategraph;


