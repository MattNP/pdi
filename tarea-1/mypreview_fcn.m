function mypreview_fcn(obj,event,himage)
% Example update preview window function.

% Get timestamp for frame.
tstampstr = event.Timestamp;

% Get handle to text label uicontrol.
ht = getappdata(himage,'HandleToTimestampLabel');

% Set the value of the text label.
ht.String = tstampstr;

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

% Display image data.
% himage.CData = event.Data;

himage.CData = b;