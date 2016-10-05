clear all; close all; clc
a = imread('imagen.jpg');
%a = rgb2gray(a)
for i =1:10:255
    b = a-i;
    figure(1); imshow(b)
    pause(1)
end
