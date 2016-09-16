function mypreview_fcn(obj,event,himage)

up = [64,192;256,384];
left = [192,320;64,192];
right = [192,320;448,576];
down = [320,448;256,384];

sectors = zeros(480,640,'uint8');
sectors(up(1,1):up(1,2),up(2,1):up(2,2)) = 255;
sectors(left(1,1):left(1,2),left(2,1):left(2,2)) = 255;
sectors(right(1,1):right(1,2),right(2,1):right(2,2)) = 255;
sectors(down(1,1):down(1,2),down(2,1):down(2,2)) = 255;
sectorsN = double(sectors/255);
a = flip(event.Data,2);
aN = double(rgb2gray(a))/255;
bN = sectorsN .* aN;
b = uint8(255*bN);

% OBTENEMOS LA SEGUNDA IMAGEN
c = flip(getsnapshot(obj),2);
cN = double(rgb2gray(c))/255;
dN = sectorsN .* cN;
d = uint8(255*dN);

e = b-d;

eUp = e(up(1,1):up(1,2),up(2,1):up(2,2));
maxEUp = max(eUp(:));

eLeft = e(left(1,1):left(1,2),left(2,1):left(2,2));
maxELeft = max(eLeft(:));

eRight = e(right(1,1):right(1,2),right(2,1):right(2,2));
maxERight = max(eRight(:));

eDown = e(down(1,1):down(1,2),down(2,1):down(2,2));
maxEDown = max(eDown(:));

if maxEUp > 50
    disp('up');
end

if maxELeft > 50
    disp('left');
end

if maxERight > 50
    disp('right');
end

if maxEDown > 50
    disp('down');
end

% Display image data.
himage.CData = a;