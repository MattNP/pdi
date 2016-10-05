clear all;
close all;
clc;
a = imread('kakashi3.jpg');
b = imread('kakashi2.jpg');
vid = videoinput('winvideo1');
preview(vid);
b = getsnapshot(vid);
[fil, col, cap] = size (b);
c = imresize(a,[fil, col]);
vidObj = VideoWriter('Kakashi.AVI');
open(vidObj);
for i=0:0.005:1
    d = b*i + c*(1-i);
    figure(1);imshow(d);
    currFrame = getframe;
    for w = 1: 20
        writevideo(vidObj, currFrame);
    end 
    pause(0.01);
end
close(vidObj);
