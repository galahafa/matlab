clear all;
Fraction2PhaseReq = 0.45
introData;

figure;
plot(requireradius, requidistribution,'DisplayName','Start');
xlim([0 10]);
legend;
%porad = 1;
hold on;

for i=1:1
for porad = 1:5
    AutoPorosity
    SaveDistr
    plot(xy(:,1), xy(:,2),'DisplayName',num2str(Fraction2PhaseReq));
    hold on;

%     requireradius(1:14) = requireradius(1:14)*1.05;
%     requireradius(15:17) = requireradius(15:17)*1.13;
%     requireradius(18:end) = requireradius(18:end)*1.2;
%     requireradius
%     requidistribution = [1.00 1.00 0.98	0.97 0.96 0.90 0.81	0.70 0.65 0.54 0.43	0.37 0.28 0.20 0.15	0.13 0.08 0.05 0.04 0.01 0.00];
%     startradius = requireradius(3:3:end)/2;
%     startredius(1) = requireradius(2);
%     startdistribution = requidistribution(3:3:end);
%     startdistribution(5:end) = startdistribution(5:end)/(4);
%     startdistribution(7) = startdistribution(7)+0.0001;
   
end
    Fraction2PhaseReq = Fraction2PhaseReq + 0.02;
end