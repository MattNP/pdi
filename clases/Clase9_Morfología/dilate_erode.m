clear all;
close all;
clc
a = imread('imagen.png');
[fil, col, cap] = size(a);
if cap > 1; a = rgb2gray(a); end
ee = strel ('square',20); b = a;
% %DILATE
% for i =1:10
%     b = imdilate(b,ee);
%     figure(1); imshow(b);
%     pause(0.1);
% end
% %ERODE
% for i =1:10
%     b = imerode(b,ee);
%     figure(1); imshow(b);
%     pause(0.1);
% end

%Dilape ==> erode ==> close(cierre)
%Erode ==> dilate ==> open(Apertura)

b = imclose(b,ee);
figure(1); imshow(b);

a = imopen(a,ee);
figure(2); imshow(a);