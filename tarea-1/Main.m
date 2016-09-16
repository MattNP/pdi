clear all; close all; clc

% OPCIONES DE VALORES PARA X0,X1,Y0,Y1 
% ---------------------------
% |          ----            |
% |         | up |           |
% |          ----            |
% |   ----         ----      |
% |  |left|       |right|    |
% |   ----         ----      |
% |          ----            |
% |         |down|           |
% |          ----            |
% ---------------------------
% up = 64:192,256:84
% left = 192:320,64:192
% right = 192:320,448:576;
% down = 320:448,256:384;

% DEFINIMOS LAS VARIABLES X0,X1,Y0,Y1 PARA CADA SECCIÓN
% |Y0,Y1|
% |X0,X1|
up = [64,191;256,383];
left = [192,320;64,192];
right = [192,320;448,576];
down = [320,448;256,384];

% % CREAMOS IMAGEN CON LAS VENTANAS DONDE SE APLICAR�? EL SENSOR DE
% % MOVIMIENTO

sectors = zeros(480,640,'uint8');
sectors(up(1,1):up(1,2),up(2,1):up(2,2)) = 255;
sectors(left(1,1):left(1,2),left(2,1):left(2,2)) = 255;
sectors(right(1,1):right(1,2),right(2,1):right(2,2)) = 255;
sectors(down(1,1):down(1,2),down(2,1):down(2,2)) = 255;

% CREAMOS UNA FIGURA PARA MOSTRAR LA IMAGEN
hFig = figure('Toolbar','none',...
       'Menubar', 'none',...
       'NumberTitle','Off',...
       'Name','My Custom Preview GUI');

% CONFIGURAMOS LA ADQUISICIÓN DEL VIDEO
vid = videoinput('winvideo',1,'YUY2_640x480');
vid.FramesPerTrigger = 5;
vid.TriggerRepeat = 4;
vid.FramesAcquiredFcnCount = 5;

% CREAMOS EL OBJETO IMAGEN DONDE SE VA A MOSTRAR EL VIDEO
vidRes = vid.VideoResolution;
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = vid.NumberOfBands;
hImage = image(zeros(imHeight, imWidth, nBands));

% ESPECIFICAMOS LA POSICIÓN DE LA IMAGEN PARA QUE SE MUESTRE CORRECTSAMENTE
% EN EL CENTRO
figSize = get(hFig,'Position');
figWidth = figSize(3);
figHeight = figSize(4);
gca.unit = 'pixels';
gca.position = [ ((figWidth - imWidth)/2)... 
               ((figHeight - imHeight)/2)...
               imWidth imHeight ];

% CONFIGURAMOS LA FUNCION PARA HACER PROCESADO A LA IMAGEN DEL VIDEO
setappdata(hImage,'UpdatePreviewWindowFcn',@mypreview_fcn);

% VISUALIZAMOS EL VIDEO
preview(vid, hImage);