clear all, close all, clc;
a = imread('3_Esquejes/esquejes (1).TIFF');
imshow(a);
h = imdistline(gca,[10 100],[10 100]);