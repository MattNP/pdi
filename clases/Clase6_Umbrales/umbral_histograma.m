clear all, close all, clc;
a = imread('paisaje3.jpg');
[fil, col, cap] = size (a);
if cap > 1
    a = rgb2gray(a);
end
%figure(1); 
%subplot 211; imshow(a);
%subplot 212; imhist(a);
%for i = 1:100
%    b = a + i;
%     figure(1);
%     subplot 211; imshow(b);
%     subplot 212; imhist(b);impixelinfo
%     pause(0.1)
%end
%c = histeq(a);
%figure(2); 
%subplot 221; imshow (a); subplot 222; imshow (c);
%subplot 223; imhist(a); subplot 224; imhist(c);
for i = 1: 20 : 255
    d = a;
    d ( d < i ) = 0;
    d ( d > i + 10) = 0;
    d ( d > 0 ) = 255;
    figure(3) 
    subplot 211; imshow(d);
    subplot 212; imhist(d);
    pause
end
