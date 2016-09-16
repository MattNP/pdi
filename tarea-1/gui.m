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

%imagen = imread('baile.jpeg');
% sectors = imread('sectors.png');
% a = resize(imagen,[640 480]);
% b = resize(sectors,[640 480]);
% bg = a*b;
% figure(1);imshow(bg);

%Cargamos la imagen base en el axis2
axes(handles.axes2)
handles.imagena2 = imread('sectors.png');
imagesc(handles.imagena2)
axis off

%cargamos el video en el axis2
vid = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image( zeros(imHeight, imWidth, nBands),'Parent',handles.axes2 );
preview(vid,hImage);

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

% %Dibujamos un circulo en el Axes 6
% axes(handles.axes6);
% theta = linspace(0, 2*pi);
% x=1+0.5*cos(theta);
% y=2+0.5*sin(theta);
% plot(x,y);
% 
% %Pintamos el circulo de rojo
% fill(x,y,'r');      
% axis equal
% set(gca,'XTickLabel',[]);
% set(gca,'YTickLabel',[]);
% axis off
% pause(1);
% 
% %Pintamos el circulo de Amarillo
% fill(x,y,'y');
% axis equal
% set(gca,'XTickLabel',[]);
% set(gca,'YTickLabel',[]);
% axis off
% pause(1);
% 
% %Pintamos el circulo de Verde
% fill(x,y,'g');
% axis equal
% set(gca,'XTickLabel',[]);
% set(gca,'YTickLabel',[]);
% axis off
% 

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


while(true)
    n = round(4*rand+1);
    for i = 1: 640
         switch n
            case 1
                set(handles.axes6,'color','r');
            case 2
                set(handles.axes6,'color','b');
            case 3
                set(handles.axes6,'color','y');
            case 4
                set(handles.axes6,'color','g');
        end
    end
   
    pause(1);
    set(handles.axes6,'color','w');
    pause(0.5);
end
            


% x=-5:1:10;
% i=1;
% while 1
% color1=[rand rand rand];
%   plot(x,2*x,'color',color1)
%  a=input('te gusta=','s');
%  if strcmp(a,'si')
%      colores(:,i)=color1;
%      i=i+1;
%  else
%      if strcmp(a,'1')
%          break;
%      end
%  end
% end
% 
% display(colores)

% r =[1 1 0];
% b =[0 0 1];
% y =[1 1 0];
% g =[0 1 0];
% colores = [[1 1 0],[0 0 1],[1 1 0],[0 1 0]];



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
