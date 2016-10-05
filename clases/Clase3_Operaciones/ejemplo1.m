clear all; close all; clc
a = imread ('imagen.jpg');
b = rgb2gray(a);
figure(1); subplot 121; imshow(a)
subplot 122; imshow(b); impixelinfo
[fil, pul] = size (b);
d = zeros(fil, col,3);d = uint8(d);
d(:,:,1) = b(:,:); d(:,:,2) = b(:,:); d(:,:,3) = b(:,:);
figure(3); imshow(d); impixelinfo
c = [b,b,b]; figure(4); imshow(c);
d = reshape (c,[fil,col,3]);
figure(5); imshow(d); impixelinfo