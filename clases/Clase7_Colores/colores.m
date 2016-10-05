clear all;
close all;
clc
rgb = imread('till.jpg');
cform = makecform('srgb2lab');
lab = applycform(rgb,cform);
[fil,col,cap] = size(rgb);


%Normalizar
lab = double(lab);
lab=lab/max(lab(:))*255;
lab = uint8(lab);
lab2= lab;

%Reshape ==> pone las 3 capas reorganizadas en forma horizontal 
c = reshape(lab,[fil,col*3]);
figure(1); 
subplot 211; imshow(rgb); title ('Origuinal el RGB');
subplot 212; imshow(c); impixelinfo; title('Procesada');
c1 = reshape(rgb,[fil, col*cap]);
figure(2);
subplot 121; imshow(rgb);
subplot 122; imshow([c1;c]);

%HSI
hsi = rgb2hsv(rgb);
c2 = reshape(hsi,[fil,col*cap]);

%Normalizamos c2
c2 = double(c2);
c2 = c2/max(c2(:))*255;
c2 = uint8(c2);
figure(3);
subplot 121; imshow(rgb);
subplot 122; imshow([c1;c;c2]);

%CMYK
cform = makecform('srgb2cmyk');
cmyk = applycform(rgb, cform);

%Coger CMYK que viene en 4 capas, y coja las capas CMY
cmy = cmyk(:,:,1:3);
c3 = reshape(cmy,[fil,col*cap]);

%Normalizamos c3
c3 = double(c3);
c3 = c3/max(c3(:))*255;
c3 = uint8(c3);
figure(4);
subplot 121; imshow(rgb);
subplot 122; imshow([c1;c;c2;c3]);

%XYZ
cform = makecform('srgb2xyz');
xyz  = applycform(rgb,cform);
c4 = reshape(xyz,[fil, col*cap]);

%Normalizamos c4
c4 = double(c4);
c4 = c4/max(c4(:))*255;
c4 = uint8(c4);
figure(5);
subplot 121; imshow(rgb);
subplot 122; imshow([c1;c;c2;c3;c4]);

%LCH
cform = makecform('lab2lch');
lch  = applycform(lab2,cform);
c5 = reshape(lch,[fil, col*cap]);

%Normalizamos c4
c5 = double(c5);
c5 = c5/max(c5(:))*255;
c5 = uint8(c5);
figure(6);
subplot 121; imshow(rgb);
subplot 122; imshow([c1;c;c2;c3;c4;c5]);
