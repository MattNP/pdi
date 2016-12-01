clear all; close all; clc;
load('netTraffic.mat');

tM = 30;

x = zeros(tM,1);

a = imread(strcat('traffic_signals/1/00029.ppm'));
a = imresize(a, [tM tM]);
%[c,hImg,sImg] = componentes_color(a);
         
         
%         bImg(bImg < mean(bImg(:))) = 255; 
%         bImg(bImg < 77) = 255; 
%         bImg(bImg < 255) = 0;
bImg = rgb2gray(a);        
%         level=graythresh(bImg);
%         bImg=im2bw(a,level);
        
r = a(:,:,1);
g = a(:,:,2);
b = a(:,:,3);
mR = (1/256)* mean(r(:));
mG = (1/256)* mean(g(:));
mB = (1/256)* mean(b(:));
x(1,1) = mR;
x(2,1) = mG;
x(3,1) = mB;
t = mean(bImg(:));
for k=1:tM
    vh = mean(bImg(k,:)>t);
    hh = mean(bImg(:,k)>t);
            x(k+3,1) = vh;
            x(k+tM+3,1) = hh;
        end
        
y = net(x)