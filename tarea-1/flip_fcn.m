function flip_fcn(obj,event,himage)

up = [64,191;256,383];
left = [192,319;64,191];
right = [192,319;448,575];
down = [320,447;256,383];

blue = imresize(imread('resources/blue.png'), 0.426);
green = imresize(imread('resources/green.png'), 0.426);
red = imresize(imread('resources/red.png'), 0.426);
yellow = imresize(imread('resources/yellow.png'), 0.426);

sectors = ones(480,640,3,'uint8');
sectors(up(1,1):up(1,2),up(2,1):up(2,2),:) = 0;
sectors(left(1,1):left(1,2),left(2,1):left(2,2),:) = 0;
sectors(right(1,1):right(1,2),right(2,1):right(2,2),:) = 0;
sectors(down(1,1):down(1,2),down(2,1):down(2,2),:) = 0;
sectorsN = double(sectors);
a = flip(event.Data,2);
aN = double(a)/255;
bN = sectorsN .* aN;
b = uint8(255*bN);
b(up(1,1):up(1,2),up(2,1):up(2,2),:) = green;
b(left(1,1):left(1,2),left(2,1):left(2,2),:) = yellow;
b(right(1,1):right(1,2),right(2,1):right(2,2),:) = blue;
b(down(1,1):down(1,2),down(2,1):down(2,2),:) = red;

himage.CData = b;

end