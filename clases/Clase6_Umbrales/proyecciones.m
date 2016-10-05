clear all; close all; clc
a = imread ('texto.png');
[fil, col, cap] = size(a);
if cap > 1 
    a = rgb2gray(a);
end
%figure(1); imshow(a); impixelinfo; 
b = sum(a); c = sum(a');
figure(2);
subplot 221; imshow(a);
subplot 222; imshow(a');
subplot 223; plot(b);
subplot 224; plot(c);
d = a(14:30, :);
e = sum(d);
figure(3); 
subplot 211; imshow(d);impixelinfo
subplot 212; plot(e);
f = d(:, 37:46);
figure(4);subplot 211; imshow(f); impixelinfo
h = f;
h ( h < 200 ) = 0;
h ( h > 0 ) = 255;
figure(4); subplot 212; imshow(255-h); impixelinfo
figure(5); imshow(f);
i = impixel; lx = max(i(:));
f ( f < lx) = 0; f ( f > lx ) = 255;
figure(6); imshow(255-f);
