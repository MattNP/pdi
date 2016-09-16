function varargout = gui(varargin)


% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 14-Sep-2016 18:42:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% %Mostramos el wallpaper en el axis principal
% axes(handles.axes1) %Nos posicionamos en el axis1
% handles.imagen=imread('baile.jpeg'); %Leemos la imagen baile.jpeg
% imagesc(handles.imagen)    %La mostramos en el axis1
% axis off %Quitamos los ejes

% Cargamos la imagen base en el axis2
axes(handles.axes2)
handles.imagena2 = imread('baile.jpeg');
imagesc(handles.imagena2)
axis off

%Ocultamos el text7
 set(handles.text7,'visible','off');
 set(handles.text9,'visible','off');
 
%Ponemos un borde blanco en axes1
axes(handles.axes1)
handles.ax = gca;
handles.ax.XColor = 'white';
handles.ax.YColor = 'white';

%ponemos un borde blanco en axes6
axes(handles.axes6)
handles.ax = gca;
handles.ax.XColor = 'white';
handles.ax.YColor = 'white';

%ponemos un borde blanco en axes2
axes(handles.axes2)
handles.ax = gca;
handles.ax.XColor = 'white';
handles.ax.YColor = 'white';

%ponemos un borde blanco en axes9
axes(handles.axes9)
handles.ax = gca;
handles.ax.XColor = 'white';
handles.ax.YColor = 'white';

%ponemos un borde blanco en axes10
axes(handles.axes10)
handles.ax = gca;
handles.ax.XColor = 'white';
handles.ax.YColor = 'white';

%ponemos un borde blanco en axes11
axes(handles.axes11)
handles.ax = gca;
handles.ax.XColor = 'white';
handles.ax.YColor = 'white';

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text8,'String','En juego');

%Creamos un conteo regresivo desde 5
set(handles.text7,'visible','on');  %hacemos visible text7
set(handles.text9,'visible','on');
for i = 5:-1: 0                     
    set(handles.text7,'String',i);  %Enviamos el valor de i a la etiqueta
    if(i==5)
        set(handles.text9,'String','PREPARADOS');
    elseif(i==3)
        set(handles.text9,'String','LISTOS');
    elseif(i==0)
        set(handles.text9,'String','¡¡¡¡YAAAAA!!!!');
    end
   pause(1)
end
set(handles.text7,'visible','off'); %Ocultamos text7
set(handles.text9,'visible','off');

%Acomodamos la imagen con los puntos de los sensores
axes(handles.axes1)
handles.imagen = imread('resources/baile64.png');
handles. imagen = imresize(handles.imagen,[640 480]);
imagesc(handles.imagen)
axis off

%Cargamos la canción a reproducir 
cancion = audioread('twice.wav');
sound(cancion,44100);       %Reproducimos la canción a una frecuencia de 44100Ghz

%ponemos en negro los axes 6,9,10,11
set(handles.axes6,'color','b');
set(handles.axes9,'color','b');
set(handles.axes10,'color','b');
set(handles.axes11,'color','b');

% vid = videoinput('winvideo',1,'YUY2_640x480');
% set(vid,'ReturnedColorSpace','rgb');
% vidRes = get(vid, 'VideoResolution');
% imWidth = vidRes(1);
% imHeight = vidRes(2);
% nBands = get(vid, 'NumberOfBands');
% hImage = image( zeros(imHeight, imWidth, nBands),'Parent',handles.axes2 );
% preview(vid,hImage);
% contador = 0;
% set(vid,'ReturnedColorSpace','Grayscale');
% up = [64,192;256,384];
% left = [192,320;64,192];
% right = [192,320;448,576];
% down = [320,448;256,384];
vid = videoinput('winvideo',1,'YUY2_640x480');
vid.FramesPerTrigger = 5;
vid.TriggerRepeat = 4;
vid.FramesAcquiredFcnCount = 5;
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image( zeros(imHeight, imWidth, nBands),'Parent',handles.axes2 );
preview(vid,hImage);
% 
% x11=64; x12=192; y11=256; y12=384;
% x21=192; x22=320; y21=64; y22=192;
% x31=192; x32=320; y31=448; y32=576;
% x41=320; x42=448; y41=256; y42=384;

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

u=0;
l=0;
dd=0;
r=0;
contador = 0;
while(true)
 n = round(4*rand+1);
 if n == 1
     set(handles.axes6,'color','y');
    for i = 1:2
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);

        e = b-d;

        eLeft = e(left(1,1):left(1,2),left(2,1):left(2,2));
        maxELeft = max(eLeft(:));

        maxValue = 50;

        if maxELeft > maxValue
             disp('left')
            l=1;
        end
         pause(0.5)
    end

        if (l == 1)
            contador = contador + 2;
        else
            contador = contador - 2;
        end
 elseif n == 2
     set(handles.axes9,'color','g');
     for i = 1:2
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);

        e = b-d;

        eUp = e(up(1,1):up(1,2),up(2,1):up(2,2));
        maxEUp = max(eUp(:));

        maxValue = 50;

        if maxEUp > maxValue
              disp('up');
            u=1;
        end
         pause(0.5)
    end
        if (u == 1)
            disp('up')
            contador = contador + 2;
        else
            contador = contador - 2;
        end
 elseif n == 3
     set(handles.axes10,'color','r'); 
     for i = 1:2
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);

        e = b-d;

        eDown = e(down(1,1):down(1,2),down(2,1):down(2,2));
        maxEDown = max(eDown(:));

        maxValue = 50;

        if maxEDown > maxValue
             disp('down');
            dd=1;
        end
         pause(0.5)
    end
        if (dd == 1)
            disp('Down')
            contador = contador + 2;
        else
            contador = contador - 2;
        end
 elseif n == 4
     set(handles.axes11,'color','b');
     for i = 1:2
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);

        e = b-d;

        eRight = e(right(1,1):right(1,2),right(2,1):right(2,2));
        maxERight = max(eRight(:));

        maxValue = 50;

        if maxERight > maxValue
             disp('right');
            r=1;
        end
        pause(0.5)
    end
       if (r == 1)
            disp('Right')
            contador = contador + 2;
        else
            contador = contador - 2;
        end
 end
set(handles.text6,'String',num2str(contador));
pause(1);
set(handles.axes6,'color','k');
set(handles.axes9,'color','k');
set(handles.axes10,'color','k');
set(handles.axes11,'color','k');
end
            
% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
% hObject    handle to restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
close all;
clc;


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Callback del pushbutton de la primera ventana 
helpGui; % abre la segunda ventana, no hay necesidad de escribir parámetros 
