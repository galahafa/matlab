function xy=graphPSD(sistema,pre)
% ���������� cPSD
% ����������� tophat filter � ������ ���������� �������
% ������� �����
i = 0;
% ������������ ����� ����������� �� ��� Z ������
iii = 0;
for ii = 1:pre:size(sistema,3)
    iii = iii+1;
    B = sistema(:,:,ii);
    Newmodel(:,:,iii) = B;
end
FracInNewModel = mean2(Newmodel);
     while i < 85
         i = i+1;
         % �������� �����
         mat = strel('disk',i-1);
         iii = 0;
         % � �������� ����� ������ ��������� ����������� � ������������ � ����� ����������� 
         for ii = 1:pre:size(sistema,3)
             iii = iii+1;
             B = sistema(:,:,ii);
             C(:,:,iii) = imtophat(B,mat);
         end
         xy(i,2) = FracInNewModel-mean2(C); % ������ ����������
         xy(i,1) = (i*2)/(200/20); % ������ �������� ������
     end
unn=xy(1,2); % ����������� �� 1
for i=1:size(xy,1)
    xy(i,2) = xy(i,2)/unn;    
end



