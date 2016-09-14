clear all; close all; clc

%OPCIONES DE VALORES PARA X0,X1,Y0,Y1 
% ---------------------------
% |          ----            |
% |         |  1 |           |
% |          ----            |
% |   ----         ----      |
% |  |  2 |       |  3 |     |
% |   ----         ----      |
% |   ----         ----      |
% |  |  4 |       |  5 |     |
% |   ----         ----      |
% |          ----            |
% |         |  6  |          |
% |          ----            |
% ---------------------------
% 1 = (0:120, 256:384);
% 2 = (120:240, 128:256);
% 3 = (120:240, 385:512);
% 4 = (240:360, 128:256);
% 5 = (240:360, 385:512);
% 6 = (360:480, 256:384);

%DEFINIMOS LAS VARIABLES X0,X1,Y0,Y1 PARA CADA SECCI�N
up = [1,120;256,384];
x10 = 1;   x11 = 120; y10 = 256; y11 = 384;
x20 = 120; x21 = 240; y20 = 128; y21 = 256;
x30 = 120; x31 = 240; y30 = 384; y31 = 512;
x40 = 240; x41 = 360; y40 = 128; y41 = 256;
x50 = 240; x51 = 360; y50 = 384; y51 = 512;
x60 = 360; x61 = 480; y60 = 256; y61 = 384;

sectors = zeros(480,640,'uint8');
sectors(up(1,1):up(1,2),up(2,1):up(2,2)) = 255;
sectors(x20:x21,y20:y21) = 255;
sectors(x30:x31,y30:y31) = 255;
sectors(x40:x41,y40:y41) = 255;
sectors(x50:x51,y50:y51) = 255;
sectors(x60:x61,y60:y61) = 255;
figure(1); imshow(sectors);
vid = videoinput('linuxvideo',1,'RGB24_640x480');
a = getsnapshot(vid);
figure(2); imshow(a);





% [a] = SensorMov(x10,x11,y10,y11);
% [b] = SensorMov(x20,x21,y20,y21);
% [c] = SensorMov(x30,x31,y30,y31);
% [d] = SensorMov(x40,x41,y40,y41);
% [e] = SensorMov(x50,x51,y50,y51);
% [f] = SensorMov(x60,x61,y60,y61);
% close all;
% figure(1); title(strcat('a = ', num2str(a)));
