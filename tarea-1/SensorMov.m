function [ a ] = SensorMov( x0,x1,y0,y1 )
    vid = videoinput('linuxvideo',1,'RGB24_640x480');
%     set(vid,'ReturnedColorSpace', 'rgb');
    set(vid, 'ReturnedColorSpace','grayscale');
%     preview(vid);
    suma = [];
    for i=1:10000
        b = getsnapshot(vid);
    %   b = rgb2gray(b);
        b1 = b(x0:x1,y0:y1);
        c = getsnapshot(vid);
%         subplot 211; imshow(b1); impixelinfo;
    %   c = rgb2gray(c);
        c1 = c(x0:x1,y0:y1);
        %b(b1) = 0;
        d = b-c;
        d(x0:x1,y0:y1) = 255;
        figure(1); imshow(d);
%         suma =[suma, sum(d(:))];
%         subplot 212; plot(suma);
        pause(0.01);
    end
    delete(vid);
    if (d == 0)
        a = -1;
    else 
        a = 1;
    end
end

