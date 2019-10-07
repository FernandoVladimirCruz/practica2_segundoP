clear all ;
clc;
close all;

prompt='introduzca el valor en grados de la primera articulacion:';
%conversion 
angDeg=input(prompt);
angRad=deg2rad(angDeg);

prompt='introduzca el valor en grados de la segunda articulacion:';
%conversion 
angDeg2=input(prompt);
angRad2=deg2rad(angDeg2);


d='introduzca l1:';%distancia 1
l1=input(d);

e='introduzca l2:';%distancia 2
l2=input(d);


p1= [0;0;0]'; %punto inicial (el apostrofe hace vector tipo columna)


%condicion si hay angulos negativos 
if angDeg>=0 %para angulos positivos(va de 0 de 0.1 en 0.1 hasta el angulo solicitado)
    angVec=0:0.01:angRad;
else
    angVec= 0:-0.01:angRad;%para angulos negativos (va de 0 de 0.1 en 0.1 hasta el angulo solicitado)
end

%saca el coseno de toda la matriz toma el coseno del primer valor sale y
%toma el segundo y le saca el coseno asi hasta el ultimo vlaor 
for i=1:length(angVec)%lenght tamaño del vector de la primera articulacion 
 
 clf
 printAxis();%imprime eje x,y
 cos(angVec(i))%i=a los valores de toda la matriz 
    
 TRz1=[cos(angVec(i)) -sin(angVec(i)) 0 0;sin(angVec(i)) cos(angVec(i)) 0 0;0 0 1 0;0 0 0 1]; % primera rotacion
 TTx1=[1 0 0 l1;0 1 0 0;0 0 1 0;0 0 0 1];% primera traslacion
 T1=TRz1*TTx1;
 p2=T1(1:3,4);
 eje_x1=T1(1:3,1);
 eje_y1=T1(1:3,2);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.5 0 0.8],'linewidth',4);%primera articulacion
 line([p1(1) eje_x1(1)],[p1(2) eje_x1(2)],[p1(3) eje_x1(3)],'color',[0.5 0 0],'linewidth',5);%eje x1 rotado
 line([p1(1) eje_y1(1)],[p1(2) eje_y1(2)],[p1(3) eje_y1(3)],'color',[0 0.5 0],'linewidth',5);%eje y1 rotado
%segundo eslabon 
printAxis();
TRz2=[cos(0) -sin(0) 0 0;sin(0) cos(0) 0 0;0 0 1 0;0 0 0 1];
TTx2=[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];
T2=TRz2*TTx2;
tf=T1*T2
p3=tf(1:3,4)

 eje_x2=p2+tf(1:3,1);
 eje_y2=p2+tf(1:3,2);
 
 eje_x3=p3+tf(1:3,1);
 eje_y3=p3+tf(1:3,2);
 
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 0.5 0.8],'linewidth',4); %segunda articulacion
 line([p2(1) eje_x2(1)],[p2(2) eje_x2(2)],[p2(3) eje_x2(3)],'color',[0.5 0 0],'linewidth',4); %eje x2 fijo
 line([p2(1) eje_y2(1)],[p2(2) eje_y2(2)],[p2(3) eje_y2(3)],'color',[0 0.5 0],'linewidth',4); %eje y2 fijo
 
 line([p3(1) eje_x3(1)],[p3(2) eje_x3(2)],[p3(3) eje_x3(3)],'color',[0.5 0 0],'linewidth',4); %eje x3 fijo
 line([p3(1) eje_y3(1)],[p3(2) eje_y3(2)],[p3(3) eje_y3(3)],'color',[0 0.5 0],'linewidth',4); %eje y3 fijo
 
pause(0.1)
end 

if angDeg2>=0 %para angulos positivos(va de 0 de 0.1 en 0.1 hasta el angulo solicitado)
    angVec2=0:0.01:angRad2;
else
    angVec2= 0:-0.01:angRad2;%para angulos negativos (va de 0 de 0.1 en 0.1 hasta el angulo solicitado)
end

for i=1:length(angVec2)%lenght tamaño del vector de la segunda articulacion
    clf
 printAxis();%imprime eje x,y
 p2=T1(1:3,4); %se manda a llamar el vector de la primera articulacion
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.5 0 0.8],'linewidth',4); %se imprime la primera articulacion de la forma en la que quedo
 line([p1(1) eje_x1(1)],[p1(2) eje_x1(2)],[p1(3) eje_x1(3)],'color',[0.5 0 0],'linewidth',5); %eje x1 fijo
 line([p1(1) eje_y1(1)],[p1(2) eje_y1(2)],[p1(3) eje_y1(3)],'color',[0 0.5 0],'linewidth',5); %eje y1 fijo
 
 TRz2=[cos(angVec2(i)) -sin(angVec2(i)) 0 0;sin(angVec2(i)) cos(angVec2(i)) 0 0;0 0 1 0;0 0 0 1];%se coloca la rotacion de la segunda articulacdion
 TTx2=[1 0 0 l2;0 1 0 0;0 0 1 0;0 0 0 1];%se coloca la traslacion de la segunda articulacion
 T2=TRz2*TTx2;
 tf=T1*T2
 p3=tf(1:3,4)
 
 eje_x2=p2+tf(1:3,1);
 eje_y2=p2+tf(1:3,2);
 
 eje_x3=p3+tf(1:3,1);
 eje_y3=p3+tf(1:3,2);
 
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 0.5 0.8],'linewidth',4); %se manda a imprimir la segunda articulacion
 line([p2(1) eje_x2(1)],[p2(2) eje_x2(2)],[p2(3) eje_x2(3)],'color',[0.5 0 0],'linewidth',4); %eje x2 rotado
 line([p2(1) eje_y2(1)],[p2(2) eje_y2(2)],[p2(3) eje_y2(3)],'color',[0 0.5 0],'linewidth',4); %eje y1 rotado
 
 line([p3(1) eje_x3(1)],[p3(2) eje_x3(2)],[p3(3) eje_x3(3)],'color',[0.5 0 0],'linewidth',4); %eje x3 rotado
 line([p3(1) eje_y3(1)],[p3(2) eje_y3(2)],[p3(3) eje_y3(3)],'color',[0 0.5 0],'linewidth',4); %eje y1 rotado
 
 
 pause(0.1)
end 