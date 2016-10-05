clear all; close all; clc
a = imread('formas.bmp');
[fil, col, cap] = size(a);
if cap>1; a = rgb2gray(a); end
[l,n] = bwlabel(a);
figure(1); imagesc(l); colormap('cool'); impixelinfo
b = a*0;
for i=1:n
    b(l==i) = 255; area = sum(b(:))/255;
    figure(1); imshow(b); title(['Área = ', num2str(area)]);
    pause
    b = a*0; 
end