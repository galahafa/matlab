function sistema = threedim(raspsphere,L)
% построение трехмерной сетки, на единицу размера выделяется 10 пикселей
% для каждой сферы строится куб описанный вокруг сферы, в этом кубе
% ставятся единицы в точках принадлежащих сфере
sistema(1:L(1)*10,1:L(2)*10,1:L(3)*10)=0;
for i=1:size(raspsphere,1)
   for dim1=floor((raspsphere(i,1)-raspsphere(i,4))*10):ceil((raspsphere(i,1)+raspsphere(i,4))*10)
       for dim2=floor((raspsphere(i,2)-raspsphere(i,4))*10):ceil((raspsphere(i,2)+raspsphere(i,4))*10)
           for dim3=floor((raspsphere(i,3)-raspsphere(i,4))*10):ceil((raspsphere(i,3)+raspsphere(i,4))*10)
               if  (1 <= dim1) && (dim1 <= L(1)*10) && (1 <= dim2) && (dim2 <= L(2)*10) && (1 <= dim3) && (dim3 <= L(3)*10)
                   dim= [dim1 dim2 dim3];
                   if norm(raspsphere(i,1:3)*10- dim) < raspsphere(i,4)*10
                       sistema(dim1,dim2,dim3) = 1;
                   end
               end
           end
       end
   end
end
