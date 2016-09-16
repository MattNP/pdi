function [ a ] = sens( x0,x1,y0,y1 )
    vid = videoinput('winvideo',1,'YUY2_640x480');
    set(vid, 'ReturnedColorSpace','grayscale');
    preview(vid);
    suma = [];
    for i=1:10
        figure(1);
        b = getsnapshot(vid);
        b1 = b(x0:x1,y0:y1);
        c = getsnapshot(vid);
        subplot 211; imshow(b1); impixelinfo;
        c1 = c(x0:x1,y0:y1);
        d = b1-c1;
        suma =[suma, sum(d(:))];
        subplot 212; plot(suma);
        pause(0.1);
    end
    delete(vid);
    if (d ~= 0)
        a = 1;
    end
    return ;
end