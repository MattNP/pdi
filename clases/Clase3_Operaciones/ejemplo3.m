clear all; close all; clc
a = imread('jon1.jpg');
a = rgb2gray(a)
% for i =1:10:255
%     b = a+i;
%     figure(1); imshow(b)
%     pause(1)
% end
b = 255-a;
% figure(2); imshow([a,b])
figure(1); subplot 121; imshow(a);
subplot 122; imshow(b)