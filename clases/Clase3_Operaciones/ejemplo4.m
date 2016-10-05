clear all; close all; clc
vid = videoinput('winvideo',1);
preview(vid)
i = 1;
suma = [];
for i = 1:30
    b = getsnapshot(vid);
    b = rgb2gray(b);
    c = getsnapshot (vid);
    c = rgb2gray(c);
    d = b-c;
    suma = [suma, suma(d(:))];
    figure(1); imshow(d)
    pause(0.00001)
end 
figure(2); plot (suma)