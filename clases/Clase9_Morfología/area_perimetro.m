clear all; close all; clc
a = imread('trian.bmp');
aa = a;
a = double(a);
a = a/max(a(:));
a = uint8(a);
areat = sum(a(:));
a = a*255;
figure(1); imshow(a);title(['area = ', num2str(areat)]);
ee = strel ('square',3);
b = imerode(aa,ee); a = uint8(aa) * 255; b = uint8(b) * 255;
c = a-b;
peri = sum(c(:))/255;
figure(2); imshow(c); title(['Perímetro = ', num2str(peri)]);
