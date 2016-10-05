clear all, close all, clc
a = imread('placa.JPG');
figure(1); imshow(a)
[b1,y,s,r,k,b] = colores(a);
figure(2); imshow(b)
figure(3); imshow(k)
figure(4); imshow([b1;y;s;r]); impixelinfo
c = min(y,r);
figure(5); imshow(c); impixelinfo
d = impixel;
dm = max(d(:));
e = c; e(e < dm) = 0;
e (e > 0) = 255;
e = 255 - e;
figure(6); imshow(e);
%%
f = e';
g = sum(f);
figure(7); 
subplot 211; imshow(f);
subplot 212; plot(g);
h = e (32:130, :);
i = sum(h);
figure(8); 
subplot 211; imshow(h)
subplot 212; plot(i);
j = h(:, 288:340);
figure(9); imshow(j)
imwrite(j,'carro_placa.bmp');
