clear all; close all; clc;

rgb = imread('peppers.png');

cform = makecform('srgb2lab');
lab = applycform(rgb, cform);
[fil,col,cap] = size(rgb);
c = reshape(lab,[fil,col*cap]);
c = double(c); 
c = c/max(c(:))*255;
c = uint8(c);
% figure(1); subplot 211, imshow(rgb);
% subplot 212; imshow(c);
c1 = reshape(rgb,[fil,col*cap]);
% figure(2); subplot 121; imshow(rgb);
% subplot 122; imshow([c1;c]);

hsi = rgb2hsv(rgb);
c2 = reshape(hsi, [fil,col*cap]);
c2 = double(c2); 
c2 = c2/max(c2(:))*255;
c2 = uint8(c2);
% figure(3); subplot 121; imshow(rgb);
% subplot 122; imshow([c1;c;c2]); impixelinfo;

cform=makecform('srgb2cmyk');
cmyk = applycform(rgb, cform);
cmy = cmyk(:,:,1:3);
c3 = reshape(cmy, [fil,col*cap]);
c3 = double(c3); 
c3 = c3/max(c3(:))*255;
c3 = uint8(c3);
% figure(4); subplot 121; imshow(rgb);
% subplot 122; imshow([c1;c;c2;c3]); impixelinfo;

cform=makecform('srgb2xyz');
xyz = applycform(rgb, cform);
c4 = reshape(xyz, [fil,col*cap]);
c4 = double(c4); 
c4 = c4/max(c4(:))*255;
c4 = uint8(c4);
% figure(5); subplot 121; imshow(rgb);
% subplot 122; imshow([c1;c;c2;c3;c4]); impixelinfo;

cform = makecform('lab2lch');
lch = applycform(lab, cform);
c5 = reshape(lch, [fil,col*cap]);
c5 = double(c5); 
c5 = c5/max(c5(:))*255;
c5 = uint8(c5);
figure(6); subplot 121; imshow(rgb);
subplot 122; imshow([c1;c;c2;c3;c4;c5]); impixelinfo;