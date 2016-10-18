% clear all, close all, clc;
% a = imread('040.jpg');
% [b,c] = componentes_color(a);
% figure(1); imshow(b); impixelinfo;
% % figure(2); imshow(c); impixelinfo;
% c(c>170) = 255;
% c(c<255) = 0;
% figure(3);
% imshow(c);
% 
% ee = strel('disk',6);
% d = imerode(c,ee);
% % figure(4); imshow(d);
% ee = strel('disk',12);
% d = imdilate(d,ee);
% % figure(5); imshow(d);
% % ee = strel('disk',3);
% % e = imerode(d,ee);
% % f = d-e;
% % figure(6); imshow(f);
% % [l,n] = bwlabel(f);
% % figure(7);imagesc(l); impixelinfo
% 
% d = imfill(d);
% % figure(6);imshow(d);
% 
% d = [d,d,d];
% [fil,col,cap] = size(a);
% d = reshape(d,[fil,col,cap]);
% a(d==0)=0;
% figure(7);imshow(a);

%--- Clase 28 de septiembre ---
clear all, close all, clc;
a = imread('36.TIFF');
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
figure(4); imshow(d);
%%
[e] = elMayor(d);
ee = strel ('square',6); b = a;
e = imclose(e,ee);
figure(5); imshow(e);



d = e;
d = [d,d,d];
[fil,col,cap] = size(a);
d = reshape(d,[fil,col,cap]);
a(d==0)=0;
figure(7);imshow(a);