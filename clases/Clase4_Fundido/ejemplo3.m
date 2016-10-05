clear all; close all; clc;
a = imread('kakashi.jpg');
vid = videoinput('winvideo',1);
b = getsnapshot(vid);
bb = b/max(b(:)); %normalizando c
[fil, col, cap] = size(b);
c = imresize(a, [fil,col]);
cc = c/max(c(:)); %normalizando c
d(:) = bb(:).*cc; 
d = uint8(d*255); %normalizando d
figure(1); imshow([b,c,d]); %muestra figure 1 como una matriz de tres imágenes 