clear all; close all; clc

%OPCIONES DE VALORES PARA X0,X1,Y0,Y1 
% ---------------------------
% |          ----            |
% |         |  1 |           |
% |          ----            |
% |   ----         ----      |
% |  |  2 |       |  3 |     |
% |   ----         ----      |
% |          ----            |
% |         |  4  |          |
% |          ----            |
% ---------------------------
% 1 = (0:120, 256:384);
% 2 = (120:240, 128:256);
% 3 = (120:240, 385:512);
% 4 = (240:360, 128:256);
% 5 = (240:360, 385:512);
% 6 = (360:480, 256:384);

%DEFINIMOS LAS VARIABLES X0,X1,Y0,Y1 PARA CADA SECCIÓN
%|Y0,Y1|
%|X0,X1|
up = [64,192;256,384];
left = [192,320;64,192];
right = [192,320;448,576];
down = [320,448;256,384];

sectors = zeros(480,640,'uint8');
sectors(up(1,1):up(1,2),up(2,1):up(2,2)) = 255;
sectors(left(1,1):left(1,2),left(2,1):left(2,2)) = 255;
sectors(right(1,1):right(1,2),right(2,1):right(2,2)) = 255;
sectors(down(1,1):down(1,2),down(2,1):down(2,2)) = 255;
figure(1); imshow(sectors);
sectorsN = double(sectors/255);
vid = videoinput('linuxvideo',1,'RGB24_640x480');
a = getsnapshot(vid);
figure(2); imshow(a);
aN = double(rgb2gray(a))/255;
bN = sectorsN .* aN;
b = uint8(255*bN);
figure(3); imshow(b);




% [a] = SensorMov(x10,x11,y10,y11);
% [b] = SensorMov(x20,x21,y20,y21);
% [c] = SensorMov(x30,x31,y30,y31);
% [d] = SensorMov(x40,x41,y40,y41);
% [e] = SensorMov(x50,x51,y50,y51);
% [f] = SensorMov(x60,x61,y60,y61);
% close all;
% figure(1); title(strcat('a = ', num2str(a)));
