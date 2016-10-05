clear all; close all; clc
a = imread('carro1.jpg'); a = imresize(a, 0.3);
a = rgb2gray(a); b = a;
ee = strel('square',3);
for i = 1:20
    b = imerode(b,ee);
    figure(1); imshow(b);
    pause(0.2);
end
