%--------------------------------------------------------------------------
%------- TRABAJO 2 --------------------------------------------------------
%------- Clasificaci� de señales de tránsito ------------------------------
%------- Por: Mateo Nore� Pino    mateo.norena@udea.edu.co ---------------
%-------      Estudiante Ingenier� de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------      Profesor Facultad de Ingenieria BLQ 21-409  -----------------
%-------      Estudiante Ingenier� de Sistemas  --------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial--
%------- V1 Diciembre de 2016 ---------------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--1. Inicializamos el sistema --------------------------------------------
%--------------------------------------------------------------------------

function varargout = Menu(varargin)
clc;
% music = audioread('resources/electrical.mp3');
% sound(music);
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

% Last Modified by GUIDE v2.5 01-Dec-2016 10:00:18

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


handles.output = hObject;                   % Seleccionamos la salida por l�ea de comandos por defecto en Menu

guidata(hObject, handles);                  % Actualizamos la estructura de los manejadores

% --- Mostramos el fondo de la aplicaci�.

ha = axes('units','normalized', ...         % Obtenemos la vista principal como un axes
            'position',[0 0 1 1]);          % Se obtiene en unidades normalizadas y en la posici� superior izquierda
uistack(ha,'bottom');                       % Ubicamos el fondo hacia la parte de atr�
I=imread('resources/background.jpg');       % Se lee la imagen de fondo
hi = imagesc(I);                            % Se ubica la imagen en el fondo
colormap gray                               % Se selecciona el color principal

% --- Ocultamos la visibilidad de las im�enes y deshabilitamos los botones.

set(ha,'handlevisibility','off', ...        % Se hace invisible el eje del fondo
            'visible','off');   
set(handles.axes_loaded,'visible','off'); % Se hace invisible el eje de la imagen original
set(handles.axes_identified,'visible','off');  % Se hace invisible el eje de la imagen alineada
set(handles.btn_classify,'enable','off');   % Se deshabilita el bot� para clasificar

% UIWAIT makes Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


%--------------------------------------------------------------------------
%--2. Funcionalidad de los botones ----------------------------------------
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%--2.1. Bot� "Cargar esqueje" --------------------------------------------
%--------------------------------------------------------------------------

% --- Executes on button press in btn_load.
function btn_load_Callback(hObject, eventdata, handles)
% hObject    handle to btn_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Se carga la imagen a analizar

% global img                                                      % Se define una variable global para tener la imagen disponible en todo el programa
[filename1, filepath1] = uigetfile({'*.ppm','All Files'},...   % Se abre una interfaz del explorador de archivos para seleccionar la imagen
  'Seleccione la señal a clasificar');                          % El programa acepta archivos .jpg, .png, 
if filename1~=0                                                 % Si se selecciona un archivo
	if strcmp(filename1(end-2:end),{'ppm'})% Se verifica que el archivo sea .TIFF
		img = imread([filepath1 filename1]);                    % Se lee la imagen y se guarda globalmente
    else
		errordlg('La imagen debe estar en formato .ppm, .jpg, .bmp o .png');                  % En caso de que la imagen no sea .TIFF se informa al usuario
		return;
    end

    % --- Se muestra la imagen y se habilita el bot� "Alinear esqueje"
    
	set(handles.axes_loaded,'visible','on');                  % Se hace visible el axes de la imagen original
	imshow(img, 'parent',handles.axes_loaded);                % Se muestra la imagen en el axes respectivo
    set(handles.btn_classify,'enable','on');                   % Se habilita el bot� "Clasificar señal"
end

%--------------------------------------------------------------------------
%--2.2. Bot� "Clasificar señal" -------------------------------------------
%--------------------------------------------------------------------------

% --- Executes on button press in btn_classify.
function btn_classify_Callback(hObject, eventdata, handles)
% hObject    handle to btn_classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global fEsqueje gEsqueje                                    % Se obtienen las variables globales asignadas anteriormente
% 
% 
% % --- Se muestra la señal identificada
% 
% imshow(gEsqueje, 'parent', handles.axes_identified);               % Se muestra la imagen con la l�ea roja indicando el nacimiento de la hoja            
% 
    

%--------------------------------------------------------------------------
%--3. M�odos de los componentes de la interfaz gr�ica -------------------
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
msgbox({'Software para reconocer señales de tránsito' 'Desarrollado por:' '>>Mateo Nore�a' '>>John Tapias' 'Procesamiento Digital de imagenes' 'Diciembre 2016'},'Acerca de','custom',alienIco);


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox({'Presiona el boton "Cargar señal" y selecciona la imagen en un formato válido (.ppm, .jpg, .bmp, png)' 'Presiona el boton "Clasificar señal"' 'La imagen de la derecha indica la señal que fue identificada'},'Ayuda','help');


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
function axes_loaded_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_loaded (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_loaded
