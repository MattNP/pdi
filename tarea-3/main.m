clear all; close all; clc;

a = imread('traffic_signals/04/00001.ppm');
b = rgb2gray(a);
[c,d] = componentes_color(a);
[e] = filtros(b);
figure(1); imshow(b);
figure(2); imshow(c);
figure(3); imshow(e);

level=graythresh(b);

BW=im2bw(b,level);

% figure(4); imshow(BW);
% 
% figure(5); imhist(b);

% props = regionprops(b, 'all');
% 
% points = detectSURFFeatures(b);
% figure(6); imshow(b); hold on;
% plot(points);

% regions = detectMSERFeatures(b);
% imshow(b); hold on;
% plot(regions);