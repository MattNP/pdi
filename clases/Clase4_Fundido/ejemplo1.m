clear all; close all; clc;
vid = videoinput(‘winvideo’,1)
i=1;suma=[];
for i=1:100
b = getsnapshot(vid);
b = rgb2gray(b);
c = getsnapshot(vid);
c = rgb2gray(c);
d = b-c; suma = [suma, sum(d(:)];
figure(1); subplot 211; imshow(c);
subplot 212; plot (suma);
pause(0.001);
end