x10 = 1;   x11 = 120; y10 = 256; y11 = 384;
x20 = 120; x21 = 240; y20 = 128; y21 = 256;
x30 = 120; x31 = 240; y30 = 384; y31 = 512;
x40 = 240; x41 = 360; y40 = 128; y41 = 256;
x50 = 240; x51 = 360; y50 = 384; y51 = 512;
x60 = 360; x61 = 480; y60 = 256; y61 = 384;

vid = videoinput('winvideo',1,'YUY2_640x480');
% set(vid,'ReturnedColorSpace', 'rgb');
set(vid, 'ReturnedColorSpace','grayscale');
preview(vid);
i = 1; 
suma = [];
for i=1:100^100
    figure(1);
    b = getsnapshot(vid);
    b1 = b(x10:x11, y10:y11);
    c = getsnapshot(vid);
    subplot 211; imshow(b1); impixelinfo;
    c1 = c(x10:x11, y10:y11);
    d = b1-c1;
    suma =[suma, sum(d(:))];
    subplot 212; plot(suma);
    pause(0.1);
end
delete(vid);