%poreradius = 2.5;

poreschet = 0;
recentporosity = 0;
while recentporosity < requireporosity  
    poreschet = poreschet+1;
    randomnumber = rand;

if currentfraction == 5
    if randomnumber < 0.68
        poreradius = 1.5;
    elseif randomnumber < 0.98
        poreradius = 2.1;
    else 
        poreradius = 2.5;
    end
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
elseif currentfraction == 10
%     if randomnumber < 0.48
%         poreradius = 1.3;
%     elseif randomnumber < 0.98
%         poreradius = 1.8;
%     else 
%         poreradius = 3;
%     end
    if randomnumber < 0.58
        poreradius = 1.3;
    elseif randomnumber < 0.98
        poreradius = 1.8;
    else 
        poreradius = 3;
    end
elseif currentfraction == 15
%%%%%%%%%%%%%%% 15 fraction
    if randomnumber < 0.48
        poreradius = 1.3;
    elseif randomnumber < 0.98
        poreradius = 1.8;
    else 
        poreradius = 3.1;
    end
elseif currentfraction == 30
    if randomnumber < 0.48
        poreradius = 1.3;
    elseif randomnumber < 0.95
        poreradius = 2;
    else 
        poreradius = 3.1;
    end
end
    randsp(1) = rand*(L(1)+poreradius*2)-poreradius;
    randsp(2) = rand*(L(2)+poreradius*2)-poreradius;
    randsp(3) = rand*(L(3)+poreradius*2)-poreradius;
    arraypore(poreschet,1) = randsp(1);
    arraypore(poreschet,2) = randsp(2);
    arraypore(poreschet,3) = randsp(3);
    arraypore(poreschet,4) = poreradius;
    for dim1=floor((arraypore(poreschet,1)-arraypore(poreschet,4))*10):ceil((arraypore(poreschet,1)+arraypore(poreschet,4))*10)
        for dim2=floor((arraypore(poreschet,2)-arraypore(poreschet,4))*10):ceil((arraypore(poreschet,2)+arraypore(poreschet,4))*10)
            for dim3=floor((arraypore(poreschet,3)-arraypore(poreschet,4))*10):ceil((arraypore(poreschet,3)+arraypore(poreschet,4))*10)
                if  (1 <= dim1) && (dim1 <= L(1)*10) && (1 <= dim2) && (dim2 <= L(2)*10) && (1 <= dim3) && (dim3 <= L(3)*10)
                    dim= [dim1 dim2 dim3];
                    if norm(arraypore(poreschet,1:3)*10- dim) < arraypore(poreschet,4)*10
                        if sistema(dim1,dim2,dim3) == 0
                            sistema(dim1,dim2,dim3) = 2;
                        end
                    end
                end
            end
        end
    end
    poretest = find(sistema == 2);
    recentporosity = length(poretest)/(500*500*500);
    if mod(poreschet,100) == 0
        disp(recentporosity);
    end
end
