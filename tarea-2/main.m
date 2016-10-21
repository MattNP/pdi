clear all, close all, clc;
a = imread('3_Esquejes/esquejes (20).TIFF');
b = rgb2gray(a);
[b,c] = componentes_color(a);
%[d] = filtros(c);
d = c;
% figure(1); imshow(b);
% figure(2); imshow(c);
% figure(3); imshow(d);
% e = impixel;
% em = min(e(:));
em = 200;
d(d > em) = 255; 
d(d < 255) = 0;
% figure(4); imshow(d);
[e] = elMayor(d);

%--- Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%--- mostrar en pantalla original y alineado

%f = alinearEsqueje(e);

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);
prop = regionprops(e,'all');
chiquita = prop.Image;
f = imrotate(e, -prop(1).Orientation);
subplot 121; imshow(e);
subplot 122; imshow(chiquita);


% d = e;
% d = [d,d,d];
% [fil,col,cap] = size(a);
% d = reshape(d,[fil,col,cap]);
% a(d==0)=0;
% figure(7);imshow(a);