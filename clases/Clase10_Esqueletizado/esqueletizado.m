clear all; close all; clc
a = imread('figuras.bmp');
b = bwmdrph(a,'skel', inf);
figure(1);
subplot 121; imshow(a);
subplot 122; imshow(b); 
