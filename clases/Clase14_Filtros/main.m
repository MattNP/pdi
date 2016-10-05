clear all; close all; clc;
a = imread('040.jpg');
b = rgb2gray(a);
[c] = filtros(b);
figure(1); imshow(b);
figure(2); imshow(c);