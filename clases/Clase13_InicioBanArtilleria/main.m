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
a = imread('040.jpg');
b = rgb2gray(a);
[b,c] = componentes_color(a);
[d] = filtros(c);
figure(1); imshow(b);
figure(1); imshow(c);
figure(2); imshow(d);
e = impixel;
em = min(e(:));
d(d > em) = 255; 
d(d < 255) = 0;
figure(4); imshow(d);
[e] = elMayor(d);
figure(5); imshow(e);

d = e;
d = [d,d,d];
[fil,col,cap] = size(a);
d = reshape(d,[fil,col,cap]);
a(d==0)=0;
figure(7);imshow(a);