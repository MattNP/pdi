clear all, close all, clc;
a = imread('formas.bmp');
[fil, col, cap] = size(a);
if cap > 1; a=rgb2gray(a); end
ee = strel('square',40); b=a;
% for i=1:10
%     b = imdilate(b, ee);
%     figure(1); imshow(b);
%     pause
% end
% for i=1:10
%     b = imerode(b, ee);
%     figure(1); imshow(b);
%     pause
% end
b = imclose(b, ee);
figure(1); imshow(b);
