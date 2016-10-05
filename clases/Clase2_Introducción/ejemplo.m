clear;
close all;
clc;
a = imread('imagen.jpg');
figure(1); imshow(a); impixelinfo;
b = zeros(200,300,3);
b = uint8(b); b(:,:,:) = 255;
figure(2); imshow(b); impixelinfo
for i=1:10:225
b(:,:,2) = i; b(:,:,1) = 255-i;
figure(2); imshow(b); impixelinfo;
pause(1)
end