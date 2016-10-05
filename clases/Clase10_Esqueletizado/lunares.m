clear all; close all; clc
a = imread('lunare.png');
a = imresize(a, 0.3);
figure(1); imshow(a); impixelinfo
b = rgb2gray(a);
figure(2); imshow(b); impixelinfo 

%Hacemos un umbral
%for i = 1:10:255
%    c = b;
%    c(b < i) = 0;
%    c(b >= (i + 10)) = 0;
%    c(c > 0) = 255; 
%    figure(3); imshow(c); pause
%    c = b;
%end

%Humbral doble
for i = 1:255
    c(b < i) = 0;
    c(b >= i) = 255;
    figure(3); imshow(c);
    c = b;
    pause
end

%Después de haber hallado la posición de i en la cual está la máscara
c(c < 150) = 0;
c(c > 0) = 255;
figure(4); imshow(c);

%Dilatamos la imagen 
ee = strel('square',3);
for i = 1:10
    c = imdilate(c,ee);
    figure(5); imshow(c);
    pause
end

%invertimos la imagen c
c = 255-c;

%Le ponemos color al lunar
[fil,col,cap] = size(a);
c = [c,c,c];
c = reshape(c,[fil,col,cap]);
e = a;
e(c == 0) = 0;
c = imclearborder(c);
figure(6); imshow(c);
