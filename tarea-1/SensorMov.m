clear all; close all; clc

% CREAMOS UNA FIGURA PARA MOSTRAR LA IMAGEN
hFig = figure('Toolbar','none',...
    'Menubar', 'none',...
    'NumberTitle','Off',...
    'Name','My Custom Preview GUI');

% CONFIGURAMOS LA ADQUISICIÓN DEL VIDEO
vid = videoinput('linuxvideo',1,'RGB24_640x480');
vid.FramesPerTrigger = 5;
vid.TriggerRepeat = 4;
vid.FramesAcquiredFcnCount = 5;

% CREAMOS EL OBJETO IMAGEN DONDE SE VA A MOSTRAR EL VIDEO
vidRes = vid.VideoResolution;
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = vid.NumberOfBands;
hImage = image(zeros(imHeight, imWidth, nBands));

% ESPECIFICAMOS LA POSICIÓN DE LA IMAGEN PARA QUE SE MUESTRE CORRECTAMENTE
% EN EL CENTRO
figSize = get(hFig,'Position');
figWidth = figSize(3);
figHeight = figSize(4);
gca.unit = 'pixels';
gca.position = [ ((figWidth - imWidth)/2)...
    ((figHeight - imHeight)/2)...
    imWidth imHeight ];

setappdata(hImage,'UpdatePreviewWindowFcn',@flip_fcn);
preview(vid, hImage);

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

% for i = 1:100
    a = flip(getsnapshot(vid),2);
%     frames = frames + 1;
    aN = double(rgb2gray(a))/255;
    bN = sectorsN .* aN;
    b = uint8(255*bN);
    c = flip(getsnapshot(vid),2);
%     frames = frames + 1;
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
    
    maxValue = 50;
    
    if maxEUp > maxValue
        disp('up');
        %motion = [motion,1];
    end
    
    if maxELeft > maxValue
        %motion = [motion,2];
    end
    
    if maxERight > maxValue
        %motion = [motion,3];
    end
    
    if maxEDown > maxValue
        %motion = [motion,4];
    end
%     
%     if frames >= 5
%         frames = 0;
%         switch mode(motion)
%             case 1
%                 disp('up');
%             case 2
%                 disp('left');
%             case 3
%                 disp('right');
%             case 4
%                 disp('down');
%         end
%     end
% i = i+1;
% end

