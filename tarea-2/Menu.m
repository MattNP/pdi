%--------------------------------------------------------------------------
%------- TRABAJO 2 --------------------------------------------------------
%------- Clasificaci�n de esquejes ----------------------------------------
%------- Por: Mateo Nore�a Pino    mateo.norena@udea.edu.co ---------------
%-------      Estudiante Ingenier�a de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------      Profesor Facultad de Ingenieria BLQ 21-409  -----------------
%-------      Estudiante Ingenier�a de Sistemas  --------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial--
%------- V1 Octubre de 2016------------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--1. Inicializamos el sistema --------------------------------------------
%--------------------------------------------------------------------------

function varargout = Menu(varargin)
clc;
music = audioread('resources/electrical.mp3');
sound(music);
% MENU MATLAB code for Menu.fig
%      MENU, by itself, creates a new MENU or raises the existing
%      singleton*.
%
%      H = MENU returns the handle to a new MENU or the handle to
%      the existing singleton*.
%
%      MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU.M with the given input arguments.
%
%      MENU('Property','Value',...) creates a new MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Menu

% Last Modified by GUIDE v2.5 30-Oct-2016 16:22:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;                                              % Declaramos un objeto Singleton para manejar la interfaz g?afica
gui_State = struct('gui_Name',       mfilename, ...             % Declaramos una estructura con el estado de la interfaz,
                   'gui_Singleton',  gui_Singleton, ...         % Envíamos como parámetros de la estructura cada uno 
                   'gui_OpeningFcn', @Menu_OpeningFcn, ...      % de los métodos y funciones que van a controlar la
                   'gui_OutputFcn',  @Menu_OutputFcn, ...       % funcionalidad de la interfaz g?afica.
                   'gui_LayoutFcn',  [] , ...                   % La estructura creada se compone de seis elementos,
                   'gui_Callback',   []);                       % autogenerados por MATLAB.
if nargin && ischar(varargin{1})                                % Verificamos que la variable de entrada traiga consigo una función
    gui_State.gui_Callback = str2func(varargin{1});             % Si la variable de entrada trae una función, reemplazamos la función gui_Callback por defecto
end

if nargout                                                      % Verificamos si se espera un argumento de salida
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});   % Verificamos si se espera un argumento de salida
else
    gui_mainfcn(gui_State, varargin{:});                        % Si no se espera argumento, simplemente llamamos la funcion principal sin almacenar su resultado
end
% --- Fin del código de inicialización.

% --- Código ejecutado antes de abrir la interfaz gráfica.

% --- Executes just before Menu is made visible.
function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Menu (see VARARGIN)


handles.output = hObject;                   % Seleccionamos la salida por l�nea de comandos por defecto en Menu

guidata(hObject, handles);                  % Actualizamos la estructura de los manejadores

% --- Mostramos el fondo de la aplicaci�n.

ha = axes('units','normalized', ...         % Obtenemos la vista principal como un axes
            'position',[0 0 1 1]);          % Se obtiene en unidades normalizadas y en la posici�n superior izquierda
uistack(ha,'bottom');                       % Ubicamos el fondo hacia la parte de atr�s
I=imread('resources/background.jpg');       % Se lee la imagen de fondo
hi = imagesc(I);                            % Se ubica la imagen en el fondo
colormap gray                               % Se selecciona el color principal

% --- Ocultamos la visibilidad de las im�genes y deshabilitamos los botones.

set(ha,'handlevisibility','off', ...        % Se hace invisible el eje del fondo
            'visible','off');   
set(handles.axes_original,'visible','off'); % Se hace invisible el eje de la imagen original
set(handles.axes_aligned,'visible','off');  % Se hace invisible el eje de la imagen alineada
set(handles.btn_align,'enable','off');      % Se deshabilita el bot�n para alinear
set(handles.btn_classify,'enable','off');   % Se deshabilita el bot�n para clasificar

% UIWAIT makes Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%--------------------------------------------------------------------------
%--2. Funcionalidad de los botones ----------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--2.1. Bot�n "Cargar esqueje" --------------------------------------------
%--------------------------------------------------------------------------

% --- Executes on button press in btn_load.
function btn_load_Callback(hObject, eventdata, handles)
% hObject    handle to btn_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Se carga la imagen a analizar

global img                                                      % Se define una variable global para tener la imagen disponible en todo el programa
[filename1, filepath1] = uigetfile({'*.TIFF','All Files'},...   % Se abre una interfaz del explorador de archivos para seleccionar la imagen
  'Seleccione el esqueje a analizar');                          % El programa acepta archivos .TIFF
if filename1~=0                                                 % Si se selecciona un archivo
	if strcmp(filename1(end-3:end),'TIFF')                      % Se verifica que el archivo sea .TIFF
		img = imread([filepath1 filename1]);                    % Se lee la imagen y se guarda globalmente
	else
		errordlg('El archivo debe ser .TIFF');                  % En caso de que la imagen no sea .TIFF se informa al usuario
		return;
    end

    % --- Se muestra la imagen y se habilita el bot�n "Alinear esqueje"
    
	set(handles.axes_original,'visible','on');                  % Se hace visible el axes de la imagen original
	imshow(img, 'parent',handles.axes_original);                % Se muestra la imagen en el axes respectivo
    set(handles.btn_align,'enable','on');                       % Se habilita el bot�n "Alinear esqueje"
    set(handles.btn_classify,'enable','off');                   % Se deshabilita el bot�n "Clasificar esqueje"
end

%--------------------------------------------------------------------------
%--2.2. Bot�n "Alinear esqueje" -------------------------------------------
%--------------------------------------------------------------------------

% --- Executes on button press in btn_align.
function btn_align_Callback(hObject, eventdata, handles)
% hObject    handle to btn_align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img fEsqueje gEsqueje        % Se definen las variables globales que se van a usar durante la ejecuci�n del resto del programa

% --- Preprocesado de la imagen

[b,c] = componentes_color(img);     % Se obtienen los componentes de color de la imagen     
d = c;                              % Se toma el componente de color Y del espacio CMYK
em = 160;                           % Se establece un umbral simple
d(d > em) = 255;                    % Los valores sobre el umbral quedan en la imagen y pasan a ser blancos
d(d < 255) = 0;                     % Los valores bajo el umbral pasan a ser negros
[e] = elMayor(d);                   % Se limpia la imagen escogiendo el �rea mayor

ee = strel ('square',6);            % Se establece un elemento estructurante de tipo cuatro de tama�o 6
e = imclose(e,ee);                  % Se le hace el proceso de cerrado a la imagen
e = logical(e);                     % Se binariza la imagen

% --- Alineaci�n de la imagen binarizada

propsE = regionprops(e, 'Image', 'BoundingBox');        % Se obtiene el BoundingBox y la imagen dada por este �ltimo de la imagen por medio de regionprops                        
if size(propsE) > 0                                     % Se asegura que la imagen posea al menos una regi�n v�lida
    
    degrees = alinearEsqueje(propsE.Image);             % Se hace un llamado a la funci�n alinearEsqueje que retorna los grados para alinear la imagen
    f = imrotate(e, degrees);                           % Se rota la imagen en los grados indicados por la funci�n alinearEsqueje
    
    % --- B�squeda del esqueje en la imagen original y en la imagen
    % binarizada rotada
    
    propsF = regionprops(f, 'BoundingBox', 'Image');    % Se obtiene el BoundingBox y la imagen dada por este de la imagen rotada
    fEsqueje = propsF.Image;                            % Se guarda en una variable global la imagen del esqueje rotado
    g = imrotate(img, degrees);                         % Se rota la imagen original los grados dados por alinearEsqueje
    y1 = propsF.BoundingBox(1);                         % Se establece la ubicaci�n del esqueje utilizando cuatro puntos (X1, X2, Y1, Y2)
    y2 = y1 + propsF.BoundingBox(3);                    % El punto y2 viene dado por la suma del punto y1 y el largo del BoundingBox
    x1 = propsF.BoundingBox(2);                         % Se ubica el punto x1 de la imagen binarizada
    x2 = x1 + propsF.BoundingBox(4);                    % El punto x2 viene dado por la suma del punto x1 y el ancho del BoundingBox
    gEsqueje = g(x1:x2-1,y1:y2-1,:);                    % Se busca el esqueje en la imagen original rotada
    y1 = propsE.BoundingBox(1);                         % Se establece la ubicaci�n del esqueje en la imagen original utilizando cuatro puntos (X1, X2, Y1, Y2)
    y2 = y1 + propsE.BoundingBox(3);                    % El punto y2 viene dado por la suma del punto y1 y el largo del BoundingBox
    x1 = propsE.BoundingBox(2);                         % Se ubica el punto x1 de la imagen binarizada
    x2 = x1 + propsE.BoundingBox(4);                    % El punto x2 viene dado por la suma del punto x1 y el ancho del BoundingBox
    imgEsqueje = img(x1:x2-1,y1:y2-1,:);                % Se busca el esqueje en la imagen original

    % --- Se muestran las im�genes
    
    d = fEsqueje;                                       % Se guarda la imagen binarizada rotada en una variable
    d = [d,d,d];                                        % Se convierte en una imagen de tres capas                                        
    [fil,col,cap] = size(gEsqueje);                     % Se toma el tama�o de la imagen original rotada
    d = reshape(d,[fil,col,cap]);                       % Se lleva la imagen a la forma dada por la imagen original
    gEsqueje(d==0)=0;                                   % Se hacen negro lo que no hace parte del esqueje
    
    imshow(imgEsqueje, 'parent', handles.axes_original);% Se muestra el esqueje de la imagen original
    set(handles.axes_aligned,'visible','on');           % Se hace visible el axes de la imagen rotada
    imshow(gEsqueje, 'parent', handles.axes_aligned);   % Se muestra el esqueje rotado
    
    set(handles.btn_classify,'enable','on');            % Se habilita el bot�n "Clasificar esqueje"
else
    h = msgbox('No hay un esqueje en la imagen. Seleccione otra imagen', 'Error','error');  % Si no hay una regi�n v�lida en la imagen se informa
end

%--------------------------------------------------------------------------
%--2.3. Bot�n "Clasificar esqueje" -------------------------------------------
%--------------------------------------------------------------------------

% --- Executes on button press in btn_classify.
function btn_classify_Callback(hObject, eventdata, handles)
% hObject    handle to btn_classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%y = str2num(get(handles.txt_maxLarge,'string'));

global fEsqueje gEsqueje                                    % Se obtienen las variables globales asignadas anteriormente

largo = str2double(get(handles.txt_maxLarge,'String'));     % Se obtiene el valor del campo "Esqueje largo"
corto = str2double(get(handles.txt_minShort,'String'));     % Se obtiene el valor del campo "Esqueje corto"  
hoja = str2double(get(handles.txt_distance,'String'));      % Se obtiene el valor del campo "Distancia a primera hoja"

propImage = regionprops(fEsqueje, 'Extrema', 'Area');       % Se obtienen el �rea y los valores extremos del esqueje rotado
extremaImage = propImage.Extrema;                           % Se guardan en una variable los valores extremos

% --- Calculo del factor de conversion

palitoPx = 1148;                % El palito mide 1145 en pixeles
palitoMm = 115;                 % El palito mide 11.5 cm o 115 mm
mMxPx= palitoMm / palitoPx;     % C�lculo de mm por px
zoomCam = 1.19;                 % La foto del palito tiene un zoom 119% 
fConv = mMxPx * zoomCam;        % El factor queda definido por los mm por px multiplicado por el zoom

% --- C�lculo de longitud m�xima

dists = zeros(1, 4);                                        % Se inicializa en ceros un vector para guardar las distancias importantes
dists(1) = pdist([extremaImage(3,:); extremaImage(7,:)]);   % Distancia del extremo 3 al extremo 7
dists(2) = pdist([extremaImage(3,:); extremaImage(8,:)]);   % Distancia del extremo 3 al extremo 8
dists(3) = pdist([extremaImage(4,:); extremaImage(7,:)]);   % Distancia del extremo 4 al extremo 7
dists(4) = pdist([extremaImage(4,:); extremaImage(8,:)]);   % Distancia del extremo 4 al extremo 8
maxDist = max(dists);                                       % Se obtiene la distancia mayor
distMilimeters = maxDist * fConv;                           % Se convierte la distancia a mm

% --- C�lculo de distancia a primera hoja

[fil,col] = size(fEsqueje);             % --- Se halla el tama�o de la imagen
for colHoja=1: col                      % --- Se recorren las columnas
    if sum(fEsqueje(:,colHoja)) >= 50	% --- Si la suma de los valores de la columna es mayor a 50
        break;                          % --- No contin�a recorriendo la imagen
    end                                     
end

lTalloHojaMM = colHoja * fConv;     % Se convierte la distancia a mm

gEsqueje(:,colHoja:colHoja+5,1) = 255;          % En la imagen rotada se hace una l�nea vertical roja que indica el nacimiento de la primera hoja

% --- C�lculo del �rea del esqueje

area = propImage.Area * fConv^2;    % Se calcula el �rea utilizando regionprops y se convierten a mm cuadrados

% --- Clasificaci�n del esqueje

tEsqueje = 'Ideal';                             % Por defecto el esqueje es ideal
if distMilimeters > largo*10                    
    tEsqueje = 'Esqueje largo';                 % El esqueje es m�s largo que el valor ingresado
else if distMilimeters < corto*10
        tEsqueje = 'Esqueje corto';             % El esqueje es m�s corto que el valor ingresado
    else if lTalloHojaMM < hoja
            tEsqueje = 'Esqueje hoja en base';  % El esqueje tiene una hoja en la base
        end
    end
end

% --- Se muestran las im�genes y los c�lculos obtenidos

imshow(gEsqueje, 'parent', handles.axes_aligned);               % Se muestra la imagen con la l�nea roja indicando el nacimiento de la hoja            

set(handles.txt_tipoEsqueje,'String', tEsqueje);                % Se muestra la clasificaci�n del esqueje            
set(handles.txt_maxLength,'String', num2str(distMilimeters));   % Se muestra la longitud m�ximo del esqueje
set(handles.txt_lengthFirst,'String', lTalloHojaMM);            % Se muestra la distancia a la primera hoja
set(handles.txt_area,'String', area);                           % Se muestra el �rea del esqueje
    

%--------------------------------------------------------------------------
%--3. M�todos de los componentes de la interfaz gr�fica -------------------
%--------------------------------------------------------------------------


% --- Outputs from this function are returned to the command line.
function varargout = Menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function txt_maxLarge_Callback(hObject, eventdata, handles)
% hObject    handle to txt_maxLarge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_maxLarge as text
%        str2double(get(hObject,'String')) returns contents of txt_maxLarge as a double


% --- Executes during object creation, after setting all properties.
function txt_maxLarge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maxLarge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function txt_minShort_Callback(hObject, eventdata, handles)
% hObject    handle to txt_minShort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_minShort as text
%        str2double(get(hObject,'String')) returns contents of txt_minShort as a double

% --- Executes during object creation, after setting all properties.
function txt_minShort_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_minShort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_distance_Callback(hObject, eventdata, handles)
% hObject    handle to txt_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_distance as text
%        str2double(get(hObject,'String')) returns contents of txt_distance as a double


% --- Executes during object creation, after setting all properties.
function txt_distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alienIco = imread('resources/alien.png');
msgbox({'Software para reconocer esquejes' 'Desarrollado por:' '>>Mateo Nore�a' '>>John Tapias' 'Procesamiento Digital de imagenes' 'Octubre 2016'},'Acerca de','custom',alienIco);


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox({'a-----Largo m�ximo del esqueje en cent�metros, (Esqueje largo)' 'b-----Largo m�nimo en cent�metros, (Esqueje corto)' 'c-----Distancia de la base del tallo a la primera hoja ( Esqueje hoja en base) en mil�metros.'},'Ayuda','help');


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
byeIco = imread('resources/bye.png');
msgbox('Bye !!','','custom',byeIco);
pause(0.2);
clear all;
close all;


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txt_tipoEsqueje_Callback(hObject, eventdata, handles)
% hObject    handle to txt_tipoEsqueje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_tipoEsqueje as text
%        str2double(get(hObject,'String')) returns contents of txt_tipoEsqueje as a double


% --- Executes during object creation, after setting all properties.
function txt_tipoEsqueje_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_tipoEsqueje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_maxLength_Callback(hObject, eventdata, handles)
% hObject    handle to txt_maxLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_maxLength as text
%        str2double(get(hObject,'String')) returns contents of txt_maxLength as a double


% --- Executes during object creation, after setting all properties.
function txt_maxLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maxLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_lengthFirst_Callback(hObject, eventdata, handles)
% hObject    handle to txt_lengthFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_lengthFirst as text
%        str2double(get(hObject,'String')) returns contents of txt_lengthFirst as a double


% --- Executes during object creation, after setting all properties.
function txt_lengthFirst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_lengthFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_area_Callback(hObject, eventdata, handles)
% hObject    handle to txt_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_area as text
%        str2double(get(hObject,'String')) returns contents of txt_area as a double


% --- Executes during object creation, after setting all properties.
function txt_area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes_original_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_original (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_original
