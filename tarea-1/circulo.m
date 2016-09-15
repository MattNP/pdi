function []=circulo(radio,posx,posy)
axes(handles.axes4);
y_c=radio*cos([0:10:360]*pi/180)+posy;
x_c=radio*sin([0:10:360]*pi/180)+posx;
axes(handles.axes4);
plot(x_c,y_c);
fill(x_c,y_c,'b');
axis([-30 30 -30 30]);
axis('square');
end