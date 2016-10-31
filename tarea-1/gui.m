%--------------------------------------------------------------------------
%------- TRABAJO 1 --------------------------------------------------------
%------- Juego Musical ----------------------------------------------------
%------- Por: Juan David Arias Guarín    juan.arias8@udea.edu.co ----------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1214737294, Wpp xxxxxxxxxx -------------------------------
%------------ Mateo Noreña Pino    mateo.norena@udea.edu.co ---------------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------      Profesor Facultad de Ingenieria BLQ 21-409  -----------------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial-----
%------- V1 Septiembre de 2016---------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--1. Inicializamos el sistema --------------------------------------------
%--------------------------------------------------------------------------
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
gui_Singleton = 1;                                           % Declaramos un objeto Singleton para manejar la interfaz g?afica
gui_State = struct('gui_Name',       mfilename, ...          % Declaramos una estructura con el estado de la interfaz,
                   'gui_Singleton',  gui_Singleton, ...      % Envíamos como parámetros de la estructura cada uno   
                   'gui_OpeningFcn', @gui_OpeningFcn, ...    % de los métodos y funciones que van a controlar la
                   'gui_OutputFcn',  @gui_OutputFcn, ...     % funcionalidad de la interfaz g?afica.
                   'gui_LayoutFcn',  [] , ...                % La estructura creada se compone de seis elementos,
                   'gui_Callback',   []);                    % autogenerados por MATLAB.
if nargin && ischar(varargin{1})                             % Verificamos que la variable de entrada traiga consigo una función
    gui_State.gui_Callback = str2func(varargin{1});          % Si la variable de entrada trae una función, reemplazamos la función gui_Callback por defecto
end
if nargout                                                   % Verificamos si se espera un argumento de salida
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});% Si se espera un argmumento de salida, definimos la variable y se ejecuta la funcion principal
else                                                         % Si no se espera argumento, simplemente llamamos la funcion principal sin almacenar su resultado
    gui_mainfcn(gui_State, varargin{:});                            
end

%---- Fin del código de inicialización ------------------------------------


% --- Código ejecutado antes de abrir la interfaz gráfica -----------------

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)


handles.output = hObject;                   % Choose default command line output for gui
guidata(hObject, handles);                  % Update handles structure

set(handles.text8,'String','En espera');     %Cambiamos el valor del text8 a "En espera".

%------------------ Mostramos el wallpaper en el axes2---------------------
axes(handles.axes2)                         %Nos posicionamos en el axes2
handles.imagena2 = imread('imagenes/baile.jpeg');    %Leemos en la variable imagena2 la imagen baile
imagesc(handles.imagena2)                   %Mostramos la imagen en el axes2
axis off                                    %Ocultamos los ejes

%-----------------Ocultamos la visibilidad de los text 7,9 y 11------------
set(handles.text7,'visible','off');         %Quitamos la visibilidad de la etiqueta de texto #7
set(handles.text9,'visible','off');         %Quitamos la visibilidad de la etiqueta de texto #9
set(handles.text11,'visible','off');        %Quitamos la visibilidad de la etiqueta de texto #11
 
%---- Ubicamos un borde blanco en axes1 -----------------------------------          
axes(handles.axes1)                         %Nos posicionamos en el axes1
handles.ax = gca;                           %Le asignamos a la variable  ax los ejes del axes1
handles.ax.XColor = 'white';                %Ponemos los ejes horizontales de color blanco
handles.ax.YColor = 'white';                %Ponemos los ejes verticales de color blanco

%---- Ubicamos un borde blanco en axes2 -----------------------------------
axes(handles.axes6)                         %Nos posicionamos en el axes6
handles.ax = gca;                           %Le asignamos a la variable  ax los ejes del axes6
handles.ax.XColor = 'white';                %Ponemos los ejes horizontales de color blanco
handles.ax.YColor = 'white';                %Ponemos los ejes verticales de color blanco

%---- Ubicamos un borde blanco en axes9 -----------------------------------
axes(handles.axes2)                         %Nos posicionamos en el axes2
handles.ax = gca;                           %Le asignamos a la variable  ax los ejes del axes2
handles.ax.XColor = 'white';                %Ponemos los ejes horizontales de color blanco
handles.ax.YColor = 'white';                %Ponemos los ejes verticales de color blanco

%---- Ubicamos un borde blanco en axes9 ----------------------------------
axes(handles.axes9)                         %Nos posicionamos en el axes9
handles.ax = gca;                           %Le asignamos a la variable  ax los ejes del axes9
handles.ax.XColor = 'white';                %Ponemos los ejes horizontales de color blanco
handles.ax.YColor = 'white';                %Ponemos los ejes verticales de color blanco

%---- Ubicamos un borde blanco en axes10 ----------------------------------
axes(handles.axes10)                        %Nos posicionamos en el axes10
handles.ax = gca;                           %Le asignamos a la variable  ax los ejes del axes1
handles.ax.XColor = 'white';                %Ponemos los ejes horizontales de color blanco
handles.ax.YColor = 'white';                %Ponemos los ejes verticales de color blanco

%---- Ubicamos un borde blanco en axes11 ----------------------------------
axes(handles.axes11)                        %Nos posicionamos en el axes11
handles.ax = gca;                           %Le asignamos a la variable  ax los ejes del axes11
handles.ax.XColor = 'white';                %Ponemos los ejes horizontales de color blanco
handles.ax.YColor = 'white';                %Ponemos los ejes verticales de color blanco
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


%definimos los métodos encargados de captar el movimiento
%Utilizarémos 4 sensores de movimiento en total 
%sensor up
%sensor left
%sensor right
%sensor down 
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
%Definimos las posiciones para los ejes x e yde los sensores
% up = 64:192,256:84
% left = 192:320,64:192
% right = 192:320,448:576;
% down = 320:448,256:384;

%--------------------------------------------------------------------------
%------------------Método para el sensor up--------------------------------
%--------------------------------------------------------------------------

function [u] =  senUp(vid)                          %Retorna un valor de 0 ó 1, recibe como parámetro un objeto de tipo video 
    up = [64,192;256,384];                          %definimos los valor para x e y del sensor up
    sectors = zeros(480,640,'uint8');               %creamos una matriz de ceros
    sectors(up(1,1):up(1,2),up(2,1):up(2,2)) = 255;
    sectorsN = double(sectors/255);
    u = 0;                                          %Definimos una variable u y le asignamos 0
    for i = 1:2                                     %Para i que va desde 1 hasta 2
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);
        e = b-d;                                    %Restamos las matrices b y d, almacenamos el resultado en e
        eUp = e(up(1,1):up(1,2),up(2,1):up(2,2));
        maxEUp = max(eUp(:));                       %Almacenamos en maxEUp el máximo valor de eUp
        maxValue = 40;                              %Definimos una variable llamada maxValue y le asignamos 40
        if maxEUp > maxValue                        %si MaxEUp es mayor que MaxValue
              disp('up');                           %Escribimos en la command window "Up"
            u = 1;                                  %Le asignamos a u el valor de 1
        end                                         %fin del if
         pause(0.5)                                 %pause de 0.5 segundos
    end                                             %fin del for        

%--------------------------------------------------------------------------
%------------------Método para el sensor Left------------------------------
%--------------------------------------------------------------------------

function [l] = senLeft(vid)                          %Retorna un valor de 0 ó 1, recibe como parámetro un objeto de tipo video 
    left = [192,320;64,192];                         %definimos los valor para x e y del sensor Left
    sectors = zeros(480,640,'uint8');                %creamos una matriz de ceros
    sectors(left(1,1):left(1,2),left(2,1):left(2,2)) = 255;
    sectorsN = double(sectors/255);
    l=0;                                             %Definimos una variable l y le asignamos 0
    for i = 1:2                                      %Para i que va desde 1 hasta 2
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);
        e = b-d;                                    %Restamos las matrices b y d, almacenamos el resultado en e
        eLeft = e(left(1,1):left(1,2),left(2,1):left(2,2));
        maxELeft = max(eLeft(:));                   %Almacenamos en maxELeft el máximo valor de eLeft
        maxValue = 40;                              %Definimos una variable llamada maxValue y le asignamos 40
        if maxELeft > maxValue                      %si MaxELeft es mayor que MaxValue
              disp('Left');                         %Escribimos en la command window "Left"
            l = 1;                                  %Le asignamos a l el valor de 1
        end                                         %fin del if
         pause(0.5)                                 %pause de 0.5 segundos
    end                                             %fin del for      
          
%--------------------------------------------------------------------------    
%------------------Método para el sensor Down------------------------------
%--------------------------------------------------------------------------

function [dd] = senDown(vid)                        %Retorna un valor de 0 ó 1, recibe como parámetro un objeto de tipo video 
    down = [320,448;256,384];                       %definimos los valor para x e y del sensor Down
    sectors = zeros(480,640,'uint8');               %creamos una matriz de ceros
    sectors(down(1,1):down(1,2),down(2,1):down(2,2)) = 255;
    sectorsN = double(sectors/255);
    dd=0;                                           %Definimos una variable dd y le asignamos 0
     for i = 1:2                                    %Para i que va desde 1 hasta 2    
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);
        e = b-d;                                    %Restamos las matrices b y d, almacenamos el resultado en e
        eDown = e(down(1,1):down(1,2),down(2,1):down(2,2));
        maxEDown = max(eDown(:));                   %Almacenamos en maxEDown el máximo valor de eDown
        maxValue = 40;                              %Definimos una variable llamada maxValue y le asignamos 40
        if maxEDown > maxValue                      %si MaxEDown es mayor que MaxValue
              disp('Down');                         %Escribimos en la command window "Down"
            dd = 1;                                 %Le asignamos a dd el valor de 1
        end                                         %fin del if
         pause(0.5)                                 %pause de 0.5 segundos
    end                                             %fin del for      

%--------------------------------------------------------------------------
%------------------Método para el sensor Right-----------------------------
%--------------------------------------------------------------------------

function [r] = senRight(vid)                        %Retorna un valor de 0 ó 1, recibe como parámetro un objeto de tipo video     
    right = [192,320;448,576];                      %definimos los valor para x e y del sensor Right
    sectors = zeros(480,640,'uint8');               %creamos una matriz de ceros
    sectors(right(1,1):right(1,2),right(2,1):right(2,2)) = 255;
    sectorsN = double(sectors/255);
    r=0;                                            %Definimos una variable r y le asignamos 0
     for i = 1:2                                    %Para i que va desde 1 hasta 2  
        a = flip(getsnapshot(vid),2);
        aN = double(rgb2gray(a))/255;
        bN = sectorsN .* aN;
        b = uint8(255*bN);
        c = flip(getsnapshot(vid),2);
        cN = double(rgb2gray(c))/255;
        dN = sectorsN .* cN;
        d = uint8(255*dN);
        e = b-d;                                    %Restamos las matrices b y d, almacenamos el resultado en e
        eRight = e(right(1,1):right(1,2),right(2,1):right(2,2));
        maxERight = max(eRight(:));                 %Almacenamos en maxERight el máximo valor de eRight
        maxValue = 40;                              %Definimos una variable llamada maxValue y le asignamos 40
        if maxERight > maxValue                     %si MaxERight es mayor que MaxValue
              disp('right');                        %Escribimos en la command window "Right"
            r = 1;                                  %Le asignamos a r el valor de 1
        end                                         %fin del if
         pause(0.5)                                 %pause de 0.5 segundos
    end                                             %fin del for
    
%--------------------------------------------------------------------------
%--2. Iniciar juego -------------------------------------------------------
%--------------------------------------------------------------------------

% --- Función ejecutada al presionar el botón 'START GAME' -----------------
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%-----------------Activamos la visibilidad de text7 y text9----------------
set(handles.text8,'String','En juego');             %Cambiamos el valor del text8 a "En juego".
set(handles.text7,'visible','on');                  %hacemos visible el text7
set(handles.text9,'visible','on');                  %Hacemos visible el text9

%---- Creamos un conteo regresivo desde 5 hasta 0 -------------------------
for i = 4:-1: 0                                     %Definimos un ciclo for de 5 iteracciones    
    set(handles.text7,'String',i);                  %Enviamos el valor de i al text7
    if(i==4)                                        %Condicional para saber si la i equivale a 5
        set(handles.text9,'String','PREPARADOS');   %Si i vale 5 mostramos el mensaje "preparados"
    elseif(i==3)                                    %Condicional para saber si la i equivale a 3
        set(handles.text9,'String','LISTOS');       %Si la i vale 3 mostramos el mensaje "listos"
    elseif(i==0)                                    %Condicional para saber si la i equivale a 0
        set(handles.text9,'String','¡¡¡¡YAAAAA!!!!');%Si la i vale 0 mostramos el mensaje "¡¡¡¡YAAAAA!!!!"
    end                                             %End correspondiente a la sentencia if
    pause(1)                                        %Pausamos por 1 segundo para cada iteracción    
end                                                 %End correspondiente a la sentencia for     

%-----Ocultamos la visibilidad de text7 y text9----------------------------
set(handles.text7,'visible','off');                 %Ocultamos text7
set(handles.text9,'visible','off');                 %Ocultamos text9

%---- Acomodamos la imagen con los puntos de los sensores -----------------
axes(handles.axes1)                                     %Nos posicionamos en el axes1
handles.imagen = imread('imagenes/baile64.png');       %cargamos en imagen la imagen "baile64.png"
handles. imagen = imresize(handles.imagen,[640 480]);   %Cambiamos el tamaño de imagen a 640x480    
imagesc(handles.imagen)                                 %Mostramos la imagen en la pantalla principal
axis off                                                %Ocultamos los ejes

%---- Ponemos en azul los axes 6,9,10,11 ----------------------------------
set(handles.axes6,'color','b');                     %ponemos de color azul el axes6
set(handles.axes9,'color','b');                     %ponemos de color azul el axes9
set(handles.axes10,'color','b');                    %ponemos de color azul el axes10
set(handles.axes11,'color','b');                    %ponemos de color azul el axes11

%---- Activamos la adquisición de imágenes por medio de la cámara ---------
%---- Para cambiar la cámara se deben cambiar el segundo y el tercer ------
%---- parámetro, que van a ser diferentes en la mayoría de casos, pues ----
%---- dependen del sistema operativo y la entrada de la cámara ------------

vid = videoinput('winvideo',1,'YUY2_640x480');      %cargamos en vid la entrada de video en el formato RGB_640x480
vid.FramesPerTrigger = 5;                           % Establecemos la cantidad de frames que se obtienen en cada trigger
vid.TriggerRepeat = 4;                              % Establecemos la cantidad de veces que se repite el trigger
vid.FramesAcquiredFcnCount = 5;                     % Establecemos la cantidad de frames que va a obtener una función

%---- Ubicamos el video en una imagen para mostrarlo en la interfaz -------
vidRes = get(vid, 'VideoResolution');                                       % Obtenemos la resolución del video
imWidth = vidRes(1);                                                        % Obtenemos el ancho del video                               
imHeight = vidRes(2);                                                       % Obtenemos el alto del video
nBands = get(vid, 'NumberOfBands');                                         % Obtenemos las capas del video
hImage = image( zeros(imHeight, imWidth, nBands),'Parent',handles.axes2 );  % Creamos una imagen en negro con el ancho, alto y las capas del video, y asignamos al axes2 como su padre
setappdata(hImage,'UpdatePreviewWindowFcn',@flip_fcn);                 % Configuramos una función callback antes de cada actualización, para voltear la imagen
preview(vid,hImage);   
                                                  

%------------------Cargamos la canción a reproducir--------------------------
cancion = audioread('canciones/cancion.wav');         %cargamos en la variable canción un archivo .wav
sound(cancion,44100);                       %Reproducimos la canción a una frecuencia de 44100Ghz
pause(2);                                   %Ponemos una pausa de 1 segundo al proceso

%--------------------------------------------------------------------------
%--3. Ciclo del juego -----------------------------------------------------
%--------------------------------------------------------------------------

% Inicializamos las variables para controlar la dirección del movimiento --

contador = 0;                               %Definimos una variable contador, encargada de la puntuación
i = 0;                                      %Definimos una variable i, encargada del ciclo principal
while(i < 215)                              %Creamos un ciclo que se repetirá mientras la i sea menor que 215
 n = round(3*rand)+1;                       %Generamos un número aleatorio entre 1 y 4 y lo almacenamos en n
 
 %---- Movimiento a la izquierda -----------------------------------
 if (n == 1)                                %Si el número aleatorio es igual a uno se ejecuta el bloque correspondiente
     set(handles.axes6,'color','y');        %Enviamos como color el amarillo al axes6
     l = senLeft(vid);                      %Almacenamos en l el resultado del método senLeft
    if (l == 1)                             %Si l vale 1 
        disp('Left')                        %Escribimos en el comand window "Left"
        contador = contador + 2;            %Aumentamos el contador en 2 unidades
    else                                    %Si l no vale 1 (l vale 0)
        contador = contador - 2;            %Disminuimos el contador en 2
    end                                     %end correspondiente al if
    
%---- Movimiento arriba -------------------------------------------    
 elseif (n == 2)                            %De lo contrario si el número aleatorio es igual a dos
     set(handles.axes9,'color','g');        %Enviamos como color el verde al axes9
     u = senUp(vid);                        %Almacenamos en u el resultado del método senUp
    if (u == 1)                             %Si u vale 1 
        disp('up')                          %Escribimos en el comand window "Up"    
        contador = contador + 2;            %Aumentamos el contador en 2 unidades
    else                                    %Si l no vale 1 (l vale 0)
        contador = contador - 2;            %Disminuimos el contador en 2
    end                                     %end correspondiente al if
    
%---- Movimiento abajo --------------------------------------------    
 elseif (n == 3)                            %De lo contrario si el número aleatorio es igual a tres
     set(handles.axes10,'color','r');       %Enviamos como color el rojo al axes9
    dd = senDown(vid);                      %Almacenamos en dd el resultado del método senDown
   if (dd == 1)                             %Si dd vale 1 
        disp('Down')                        %Escribimos en el comand window "Down"    
        contador = contador + 2;            %Aumentamos el contador en 2 unidades
    else                                    %Si l no vale 1 (l vale 0)
        contador = contador - 2;            %Disminuimos el contador en 2
    end                                     %end correspondiente al if
%---- Movimiento a la derecha -------------------------------------    
 elseif (n == 4)                            %De lo contrario si el número aleatorio es igual a cuatro
    set(handles.axes11,'color','b');        %Enviamos como color el blue al axes11
    r = senRight(vid);                      %Almacenamos en r el resultado del método senRight
   if (r == 1)                              %Si r vale 1 
        disp('Right')                       %Escribimos en el comand window "Right"    
        contador = contador + 2;            %Aumentamos el contador en 2 unidades
    else                                    %Si l no vale 1 (l vale 0)
        contador = contador - 2;            %Disminuimos el contador en 2
    end                                     %end correspondiente al if
 end                                        %End correspondiente al primer if
 
%------Actualizamos el puntaje acomulado---------------------------------- 
set(handles.text6,'String',num2str(contador));  %Mostramos en text6 el valor almacenado en contador
set(handles.axes6,'color','k');             %ponemos de color negro el axes6
set(handles.axes9,'color','k');             %ponemos de color negro el axes9
set(handles.axes10,'color','k');            %ponemos de color negro el axes10
set(handles.axes11,'color','k');            %ponemos de color negro el axes11
i=i+1;                                      %Incrementamos la i en 1            
end                                         %End correspondiente al cilo while  

%----------------------------------------------------------------------------
%---------Final de la canción------------------------------------------------
%----------------------------------------------------------------------------
axes(handles.axes1);
set(handles.text8,'String','Terminado');                                    %Cambiamos el valor del text8 a "Terminado".
set(handles.text11,'visible','on');                                         %Hacemos visible el text11
if(contador > 300)                                                          %Si la varible contador es mayor a 300
    set(handles.text11,'String','FELICIDADES, ERES UN GRAN BAILAR�?N');      %Mostramos mensaje en text11
elseif(contador>200)&&(contador<300)                                        %Si la variable contador está entre 200 y 300
     set(handles.text11,'String','NADA MAL, PERO PODR�?AS HACERLO MEJOR');   %Mostramos mensaje en text11
elseif(contador>50)&&(contador<200)                                         %Si la variable contador esta entre 50 y 200
    set(handles.text11,'String','CREO QUE PUDISTE HACERLO MEJOR');          %Mostramos mensaje en text11    
elseif(contador<50)                                                         %Si la variable contador es menor  a 50    
    set(handles.text11,'String','¿REALMENTE ERA TAN DIF�?CIL?');             %Mostramos mensaje en text11
end                                                                         %End correspondiente al if

pause(3);                               %Creamos un pause de 3 segundos
set(handles.text11,'visible','off');    %Ocultamos el text11    
delete(vid);                            %eliminamos el objeto vid


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;                              %Limpiamos todo
close all;                              %Cerramos todo
clc;                                    %Limpiamos la comad window


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Callback del pushbutton "Help" en la interfaz principal.
helpGui;    %Llamamos la interfaz helpGui

% --- Función para voltear la imagen de la previsualización.
function flip_fcn(obj,event,himage)

himage.CData = flip(event.Data,2);  % La imagen a retornar será la misma imagen volteada
end

%--------------------------------------------------------------------------
%---------------------------  FIN DEL PROGRAMA ----------------------------
%--------------------------------------------------------------------------
