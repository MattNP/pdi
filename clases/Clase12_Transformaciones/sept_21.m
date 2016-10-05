clear all; close all; clc;
a = imread('chejov.png');
b = a;
for i=1:10:360
    c = imrotate(b,i, 'crop');
    figure(1); imshow(c);
    pause(0.1);
end