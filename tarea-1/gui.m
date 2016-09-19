%--------------------------------------------------------------------------
%------- TRABAJO 1 --------------------------------------------------------
%------- Juego Musical ----------------------------------------------------
%------- Por: Juan David Arias Guarín    juan.arias8@udea.edu.co ----------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ Mateo Noreña Pino    mateo.norena@udea.edu.co ---------------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------      Profesor Facultad de Ingenieria BLQ 21-409  -----------------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial-----
%------- V1 Septiembre de 2016---------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--1. Inicializamos el sistema --------------------------------------------
%--------------------------------------------------------------------------

function varargout = gui(varargin) % Declaramos la función para mostrar la interfaz gráfica

%---- Código de inicialización de la interfaz gráfica, no debe editarse ---

gui_Singleton = 1;   % Declaramos un objeto Singleton para manejar la interfaz gŕafica
gui_State = struct('gui_Name',       mfilename, ... % Declaramos una estructura con el estado de la interfaz,
    'gui_Singleton',  gui_Singleton, ...            % Envíamos como parámetros de la estructura cada uno
    'gui_OpeningFcn', @gui_OpeningFcn, ...          % de los métodos y funciones que van a controlar la
    'gui_OutputFcn',  @gui_OutputFcn, ...           % funcionalidad de la interfaz gŕafica.
    'gui_LayoutFcn',  [] , ...                      % La estructura creada se compone de seis elementos,
    'gui_Callback',   []);                          % autogenerados por MATLAB.

if nargin && ischar(varargin{1})                    % Verificamos que la variable de entrada traiga consigo una función
    gui_State.gui_Callback = str2func(varargin{1}); % Si la variable de entrada trae una función, reemplazamos la función gui_Callback por defecto
end
if nargout                                                          % Verificamos si se espera un argumento de salida
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});   % Si se espera un argmumento de salida, definimos la variable y se ejecuta la funcion principal
else
    gui_mainfcn(gui_State, varargin{:});                            % Si no se espera argumento, simplemente llamamos la funcion principal sin almacenar su resultado
end
end

%---- Fin del código de inicialización ------------------------------------


% --- Código ejecutado antes de abrir la interfaz gráfica -----------------

function gui_OpeningFcn(hObject, eventdata, handles, varargin)
%---- hObject    manejador de la figura -----------------------------------
%---- eventdata  reservado - será definido en una futura versión de MATLAB
%---- handles    estructura con manejadores e información del usuario -----
%---- varargin   argumentos de entrada para la interfaz gráfica -----------

handles.output = hObject;   % Escogemos la salida por línea de comandos por defecto
guidata(hObject, handles);  % Actualizamos la estructura de los manejadores

%---- Mostramos el wallpaper en el axes 2 ---------------------------------
axes(handles.axes2)                         % Nos posicionamos en el axis1
handles.imagena2 = imread('resources/baile.jpeg');    % Leemos la imagen baile.jpeg
imagesc(handles.imagena2)                   % La mostramos en el axis1
axis off                                    % Quitamos los ejes

set(handles.text7,'visible','off');         % Ocultamos el text7
set(handles.text9,'visible','off');         % Ocultamos el text9
 
%---- Ubicamos un borde blanco en axes1 -----------------------------------
axes(handles.axes1)                         % Nos posicionamos en el axes1
handles.ax = gca;                           % Establecemos el manejador para el axes
handles.ax.XColor = 'white';                % Establecemos el color blanco en X
handles.ax.YColor = 'white';                % Establecemos el color blanco en Y

%---- Ubicamos un borde blanco en axes2 -----------------------------------
axes(handles.axes2)                         % Nos posicionamos en el axes2
handles.ax = gca;                           % Establecemos el manejador para el axes
handles.ax.XColor = 'white';                % Establecemos el color blanco en X
handles.ax.YColor = 'white';                % Establecemos el color blanco en Y

%---- Ubicamos un borde blanco en axes6 -----------------------------------
axes(handles.axes6)                         % Nos posicionamos en el axes6
handles.ax = gca;                           % Establecemos el manejador para el axes
handles.ax.XColor = 'white';                % Establecemos el color blanco en X
handles.ax.YColor = 'white';                % Establecemos el color blanco en Y

%---- Ubicamos un borde blanco en axes9 -----------------------------------
axes(handles.axes9)                         % Nos posicionamos en el axes9
handles.ax = gca;                           % Establecemos el manejador para el axes
handles.ax.XColor = 'white';                % Establecemos el color blanco en X
handles.ax.YColor = 'white';                % Establecemos el color blanco en Y

%---- Ubicamos un borde blanco en axes10 ----------------------------------
axes(handles.axes10)                        % Nos posicionamos en el axes10
handles.ax = gca;                           % Establecemos el manejador para el axes
handles.ax.XColor = 'white';                % Establecemos el color blanco en X
handles.ax.YColor = 'white';                % Establecemos el color blanco en Y

%---- Ubicamos un borde blanco en axes11 -----------------------------------
axes(handles.axes11)                        % Nos posicionamos en el axes11
handles.ax = gca;                           % Establecemos el manejador para el axes
handles.ax.XColor = 'white';                % Establecemos el color blanco en X
handles.ax.YColor = 'white';                % Establecemos el color blanco en Y
end

% --- Las salidas de esta función son mostradas en la línea de comandos ---
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
%---- varargout  arreglo de celdas para retornar argumentos de salida -----
%---- hObject    manejador de la figura -----------------------------------
%---- eventdata  reservado - será definido en una futura versión de MATLAB
%---- handles    estructura con manejadores e información del usuario -----

varargout{1} = handles.output;  % Obtenemos la salida por defecto en la línea de comando de la estructura de los manejadores
end

%--------------------------------------------------------------------------
%--2. Iniciar juego -------------------------------------------------------
%--------------------------------------------------------------------------

% --- Función ejecutada al presionar el botón 'START GAME' -----------------
function start_Callback(hObject, eventdata, handles)
%---- hObject    manejador de la figura -----------------------------------
%---- eventdata  reservado - será definido en una futura versión de MATLAB
%---- handles    estructura con manejadores e información del usuario -----

set(handles.text8, 'String','En juego');    % Establecemos el tipo de dato y el dato de text8

set(handles.text7,'visible','on');  % Hacemos visible text7
set(handles.text9,'visible','on');  % Hacemos visible text9

%---- Creamos un conteo regresivo desde 5 hasta 0 -------------------------
for i = 5:-1: 0                     
    set(handles.text7,'String',i);  % Enviamos el valor de i a la etiqueta text7
    %---- Cambiamos la etiqueta text9 dependiendo del valor del conteo ----
    if(i==5)                                        
        set(handles.text9,'String','PREPARADOS');       % Si faltan 5 segundos el texto será 'PREPARADOS'
    elseif(i==3)
        set(handles.text9,'String','LISTOS');           % Si faltan 3 segundos el texto será 'LISTO'
    elseif(i==0)
        set(handles.text9,'String','¡¡¡¡YAAAAA!!!!');   % Si faltan 3 segundos el texto será '¡¡¡¡YAAAAA!!!!'
    end
   pause(1) % Hacemos una pausa de 1 segundo en cada valor del conteo
end
set(handles.text7,'visible','off'); % Ocultamos text7
set(handles.text9,'visible','off'); % Ocultamos text9

%---- Acomodamos la imagen con los puntos de los sensores -----------------
axes(handles.axes1)                                     % Nos ubicamos sobre el axes1
handles.imagen = imread('resources/baile64.png');       % Establecemos la imagen del manejador
handles.imagen = imresize(handles.imagen,[640 480]);    % Redimensionamos la imagen a un tamaño menor
imagesc(handles.imagen)                                 % Escalamos y mostramos la imagen
axis off                                                % Cerramos el axis

%---- Cargamos la canción a reproducir ------------------------------------
cancion = audioread('resources/twice.wav'); % Leemos una dirección y cargamos un audio
sound(cancion,44100);                       % Reproducimos la canción a una frecuencia de 44100Ghz

%---- Ponemos en negro los axes 6,9,10,11 ---------------------------------
set(handles.axes6,'color','b');     % Establecemos el color negro para el axes6
set(handles.axes9,'color','b');     % Establecemos el color negro para el axes9
set(handles.axes10,'color','b');    % Establecemos el color negro para el axes10
set(handles.axes11,'color','b');    % Establecemos el color negro para el axes11

%---- Activamos la adquisición de imágenes por medio de la cámara ---------
%---- Para cambiar la cámara se deben cambiar el segundo y el tercer ------
%---- parámetro, que van a ser diferentes en la mayoría de casos, pues ----
%---- dependen del sistema operativo y la entrada de la cámara ------------
vid = videoinput('linuxvideo',1,'RGB24_640x480');   % Declaramos el objeto vid con el dispositivo instalado
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
preview(vid,hImage);                                                        % Obtenemos la visualización del video

%---- Creación de la máscara para las ventanas del sensor de movimiento ---
up = [64,192;256,384];      % Establecemos los límites de la ventana superior, de 129x129 pixeles
left = [192,320;64,192];    % Establecemos los límites de la ventana izquierda, de 129x129 pixeles
right = [192,320;448,576];  % Establecemos los límites de la ventana derecha, de 129x129 pixeles
down = [320,448;256,384];   % Establecemos los límites de la ventana inferior, de 129x129 pixeles

%---- Se inicializan los valores en 1 para tenerla normalizada desde el ---
%-----principio -----------------------------------------------------------
sectors = zeros(imHeight,imWidth,'double');                  % Creamos una imagen en negro del tamaño del video, monocromática
sectors(up(1,1):up(1,2),up(2,1):up(2,2)) = 1;               % En los límites de la ventana superior, llevamos a blanco esta parte             
sectors(left(1,1):left(1,2),left(2,1):left(2,2)) = 1;       % En los límites de la ventana izquierda, llevamos a blanco esta parte
sectors(right(1,1):right(1,2),right(2,1):right(2,2)) = 1;   % En los límites de la ventana derecha, llevamos a blanco esta parte
sectors(down(1,1):down(1,2),down(2,1):down(2,2)) = 1;       % En los límites de la ventana inferior, llevamos a blanco esta parte

%--------------------------------------------------------------------------
%--3. Ciclo del juego -----------------------------------------------------
%--------------------------------------------------------------------------

% Inicializamos las variables para controlar la dirección del movimiento --

contador = 0;   % Contador de puntaje
maxValue = 50;  % Valor establecido para saber si hubo movimiento

%---- Inicio del ciclo del juego ------------------------------------------
while(true)
    l = 0; u = 0; dd = 0; r = 0;        % Variables que indican si hubo movimiento en alguno de los cuatro lados
    n = round(3*rand)+1;                % Con la variable n decidimos al azar la dirección en que debe moverse el usuario
    set(handles.axes6,'color','k');     % Pintamos de negro el axes6                
    set(handles.axes9,'color','k');     % Pintamos de negro el axes6
    set(handles.axes10,'color','k');    % Pintamos de negro el axes6
    set(handles.axes11,'color','k');    % Pintamos de negro el axes6
    
    %---- Verificación de movimiento en cada una de las direcciones -------
    
    switch(n)
        
        %---- Movimiento a la izquierda -----------------------------------
        case 1                                                      % El usuario debe moverse hacia la izquierda
            set(handles.axes6,'color','y');                         % Pintamos el axes6 de amarillo
            for i = 1:2                                             % Verificamos el movimiento dos veces
                a = flip(getsnapshot(vid),2);                       % Obtenemos una imagen de la cámara
                pause(0.1);                                         % Hacemos una pausa de 0.1 segundo
                c = flip(getsnapshot(vid),2);                       % Obtenemos una segunda imagen de la cámara
                e = SensorMov(a, c, sectors);                       % Obtenemos la cantidad de movimiento utilizando la función
                
                eLeft = e(left(1,1):left(1,2),left(2,1):left(2,2)); % Obtenemos la cantidad de movimiento en la izquierda
                maxELeft = max(eLeft(:));                           % Obtenemos el máximo elemento del movimiento de la izquierda
                
                if maxELeft > maxValue                              % Si el movimiento es mayor al valor dado, el usuario se movió hacia la izquierda
                    l=1;                                            % La variable que dice si se movió a la izquierda se pasa a true
                end
                pause(0.5)                                          % Hacemos una pausa de medio segundo
            end
            
        %---- Movimiento arriba -------------------------------------------    
        case 2                                              % El usuario debe moverse hacia arriba
            set(handles.axes9,'color','g');                 % Pintamos el axes9 de verde
            for i = 1:2                                     % Verificamos el movimiento dos veces
                a = flip(getsnapshot(vid),2);               % Obtenemos una imagen de la cámara
                pause(0.1);                                 % Hacemos una pausa de 0.1 segundo
                c = flip(getsnapshot(vid),2);               % Obtenemos una segunda imagen de la cámara
                e = SensorMov(a, c, sectors);               % Obtenemos la cantidad de movimiento utilizando la función
                
                eUp = e(up(1,1):up(1,2),up(2,1):up(2,2));   % Obtenemos la cantidad de movimiento arriba
                maxEUp = max(eUp(:));                       % Obtenemos el máximo elemento del movimiento arriba
                
                if maxEUp > maxValue                        % Si el movimiento es mayor al valor dado, el usuario se movió hacia arriba
                    u=1;                                    % La variable que dice si se movió arriba se pasa a true
                end
                pause(0.5)                                  % Hacemos una pausa de medio segundo
            end
            
        %---- Movimiento abajo --------------------------------------------    
        case 3                                                      % El usuario debe moverse hacia abajo
            set(handles.axes10,'color','r');                        % Pintamos el axes6 de rojo
            for i = 1:2                                             % Verificamos el movimiento dos veces
                a = flip(getsnapshot(vid),2);                       % Obtenemos una imagen de la cámara
                pause(0.1);                                         % Hacemos una pausa de 0.1 segundo
                c = flip(getsnapshot(vid),2);                       % Obtenemos una segunda imagen de la cámara
                e = SensorMov(a, c, sectors);                       % Obtenemos la cantidad de movimiento utilizando la función
                
                eDown = e(down(1,1):down(1,2),down(2,1):down(2,2)); % Obtenemos la cantidad de movimiento abajo
                maxEDown = max(eDown(:));                           % Obtenemos el máximo elemento del movimiento abajo
                
                if maxEDown > maxValue                              % Si el movimiento es mayor al valor dado, el usuario se movió hacia arriba
                    dd=1;                                           % La variable que dice si se movió abajo se pasa a true
                end
                pause(0.5)                                          % Hacemos una pausa de medio segundo
            end
            
        %---- Movimiento a la derecha -------------------------------------    
        case 4                                                              % El usuario debe moverse hacia la derecha
            set(handles.axes11,'color','b');                                % Pintamos el axes6 de azul
            for i = 1:2                                                     % Verificamos el movimiento dos veces
                a = flip(getsnapshot(vid),2);                               % Obtenemos una imagen de la cámara
                pause(0.1);                                                 % Hacemos una pausa de 0.1 segundo
                c = flip(getsnapshot(vid),2);                               % Obtenemos una segunda imagen de la cámara
                e = SensorMov(a, c, sectors);                               % Obtenemos la cantidad de movimiento utilizando la función
                
                eRight = e(right(1,1):right(1,2),right(2,1):right(2,2));    % Obtenemos la cantidad de movimiento en la derecha
                maxERight = max(eRight(:));                                 % Obtenemos el máximo elemento del movimiento en la derecha
                
                if maxERight > maxValue                                     % Si el movimiento es mayor al valor dado, el usuario se movió hacia la derecha
                    r=1;                                                    % La variable que dice si se movió a la derecha se pasa a true
                end
                pause(0.5)                                                  % Hacemos una pausa de medio segundo
            end
    end
    
    if (l || u || dd || r)          % Verificamos si hubo movimiento en la dirección que debía
        contador = contador + 2;    % Si hubo movimiento sumamos 2 puntos    
    elseif contador > 0             % Si no tiene puntos no se le restarán
        contador = contador - 2;    % Si no hubo movimiento restamos 2 puntos
    end
    
    set(handles.text6,'String',num2str(contador));  % Actualizamos el contador
    pause(1);                                       % Hacemos una pausa de un segundo
end
end

%--------------------------------------------------------------------------
%--3. Final del juego y otras funciones -------------------------------------
%--------------------------------------------------------------------------
            
% ---- Se ejecuta cuando se presiona el botón "RESTART GAME" --------------
function restart_Callback(hObject, eventdata, handles)
%---- hObject    manejador de la figura -----------------------------------
%---- eventdata  reservado - será definido en una futura versión de MATLAB
%---- handles    estructura con manejadores e información del usuario -----
end


% --- Se ejecuta cuando se presiona el botón "CLOSE GAME" -----------------
function close_Callback(hObject, eventdata, handles)
%---- hObject    manejador de la figura -----------------------------------
%---- eventdata  reservado - será definido en una futura versión de MATLAB
%---- handles    estructura con manejadores e información del usuario -----
clear all; close all; clc; % Limpiamos el espacio de trabajo y cerramos todo
end


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
%---- hObject    manejador de la figura -----------------------------------
%---- eventdata  reservado - será definido en una futura versión de MATLAB
%---- handles    estructura con manejadores e información del usuario -----

%---- Callback del pushbutton de la primera ventana
helpGui; % abre la ventana de información, no hay necesidad de escribir parámetros
end

% --- Función para voltear la imagen de la previsualización.
function flip_fcn(obj,event,himage)

himage.CData = flip(event.Data,2);  % La imagen a retornar será la misma imagen volteada
end

function e = SensorMov(a, c, sectors)
%---- La función recibe dos imágenes a y c que representan dos instantes de
%---- tiempo, una imagen monocromática normalizada que representa los
%---- sectores donde se va a reconocer el movimiento. ---------------------
%---- La función retorna una imagen con la cantidad de movimiento en los
%----sectores establecidos. -----------------------------------------------

aN = double(rgb2gray(a))/255;   % Normalizamos la imagen a
bN = sectors .* aN;             % Multiplicamos la imagen a normalizada por los sectores
b = uint8(255*bN);              % Deshacemos la normalización de la imagen obtenida
cN = double(rgb2gray(c))/255;   % Normalizamos la imagen c
dN = sectors .* cN;             % Multiplicamos la imagen c normalizada por los sectores
d = uint8(255*dN);              % Deshacemos la normalización de la imagen obtenida

e = b-d;                        % Obtenemos la resta de las imágenes, que simboliza el movimiento

end

%--------------------------------------------------------------------------
%---------------------------  FIN DEL PROGRAMA ----------------------------
%--------------------------------------------------------------------------