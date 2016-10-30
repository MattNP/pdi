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
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Menu_OpeningFcn, ...
                   'gui_OutputFcn',  @Menu_OutputFcn, ...
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

% --- Executes just before Menu is made visible.
function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Menu (see VARARGIN)

% Choose default command line output for Menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% El fondo hacia la parte inferior
uistack(ha,'bottom');
I=imread('resources/background.jpg');
hi = imagesc(I);
colormap gray
% Ejes invisibles
set(ha,'handlevisibility','off', ...
            'visible','off');
set(handles.axes_original,'visible','off');
set(handles.axes_aligned,'visible','off');

% UIWAIT makes Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes on button press in btn_load.
function btn_load_Callback(hObject, eventdata, handles)
% hObject    handle to btn_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Load images

global img
[filename1, filepath1] = uigetfile({'*.TIFF','All Files'},...
  'Seleccione el esqueje a analizar');
if filename1~=0
	if strcmp(filename1(end-3:end),'TIFF')
		img = imread([filepath1 filename1]);
	else
		errordlg('El archivo debe ser .TIFF');
		return;
    end

	% Graficar la imagen
	set(handles.axes_original,'visible','on');
	imshow(img, 'parent',handles.axes_original);
end

% --- Executes on button press in btn_align.
function btn_align_Callback(hObject, eventdata, handles)
% hObject    handle to btn_align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img fEsqueje gEsqueje

% Preprocesado de la imagen
[b,c] = componentes_color(img);
d = c;
em = 160;
d(d > em) = 255; 
d(d < 255) = 0;
[e] = elMayor(d);

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);

props = regionprops(e, 'Area');
disp(size(props));
if size(props) > 0
    degrees = alinearEsqueje(e);
    f = imrotate(e, degrees);
    propsE = regionprops(e, 'BoundingBox');
    propsF = regionprops(f, 'BoundingBox', 'Image');
    fEsqueje = propsF.Image;
    g = imrotate(img, degrees);
    y1 = propsF.BoundingBox(1);
    y2 = y1 + propsF.BoundingBox(3);
    x1 = propsF.BoundingBox(2);
    x2 = x1 + propsF.BoundingBox(4);
    gEsqueje = g(x1:x2-1,y1:y2-1,:);
    y1 = propsE.BoundingBox(1);
    y2 = y1 + propsE.BoundingBox(3);
    x1 = propsE.BoundingBox(2);
    x2 = x1 + propsE.BoundingBox(4);
    imgEsqueje = img(x1:x2-1,y1:y2-1,:);
    
    [m, n] = size(fEsqueje);
    [o, p] = size(gEsqueje);
    disp(['Size fEsqueje: ', num2str(m), ' x ', num2str(n)]);
    disp(['Size gEsqueje: ', num2str(o), ' x ', num2str(p)]);

    d = fEsqueje;
    d = [d,d,d];
    [fil,col,cap] = size(gEsqueje);
    d = reshape(d,[fil,col,cap]);
    gEsqueje(d==0)=0;
    set(handles.axes_original,'visible','on');
    imshow(imgEsqueje, 'parent', handles.axes_original);
    set(handles.axes_aligned,'visible','on');
    imshow(gEsqueje, 'parent', handles.axes_aligned);
end

% --- Executes on button press in btn_classify.
function btn_classify_Callback(hObject, eventdata, handles)
% hObject    handle to btn_classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%y = str2num(get(handles.txt_maxLarge,'string'));

global fEsqueje gEsqueje

largo = str2double(get(handles.txt_maxLarge,'String'));
corto = str2double(get(handles.txt_minShort,'String'));
hoja = str2double(get(handles.txt_distance,'String'));

propImage = regionprops(fEsqueje, 'Extrema', 'Area');
disp(['Length regionProps: ', num2str(size(propImage))]);
extremaImage = propImage.Extrema;

% Calculo del factor de conversion

palitoPx = 1148;                % El palito mide 1145 en pixeles
palitoMm = 115;                 % El palito mide 114511.5 cm
mMxPx= palitoMm / palitoPx;     % Cálculo de mm por px
zoomCam = 1.19;                 % La foto del palito tiene un zoom 119% 
fConv = mMxPx * zoomCam;        % El factor queda definido por los mm por px multiplicado por el zoom

% Hallar maxima distancia
dists = zeros(1, 4);
dists(1) = pdist([extremaImage(3,:); extremaImage(7,:)]);
dists(2) = pdist([extremaImage(3,:); extremaImage(8,:)]);
dists(3) = pdist([extremaImage(4,:); extremaImage(7,:)]);
dists(4) = pdist([extremaImage(4,:); extremaImage(8,:)]);
maxDist = max(dists);
distMilimeters = maxDist * fConv;

[lTalloHoja, colHoja] = largoTallo(fEsqueje); 
lTalloHojaMM = lTalloHoja * fConv;

disp(['colHoja = ', num2str(colHoja)]);

gEsqueje(:,colHoja:colHoja+5,1) = 255;

set(handles.axes_aligned,'visible','on');
imshow(gEsqueje, 'parent', handles.axes_aligned);

area = propImage.Area * fConv^2;

tEsqueje = 'Ideal';
if distMilimeters > largo*10
    tEsqueje = 'Esqueje largo';
else if distMilimeters < corto*10
        tEsqueje = 'Esqueje corto';
    else if lTalloHojaMM < hoja
            tEsqueje = 'Esqueje hoja en base';
        end
    end
end

set(handles.txt_tipoEsqueje,'String', tEsqueje);
set(handles.txt_maxLength,'String', num2str(distMilimeters));
set(handles.txt_lengthFirst,'String', lTalloHojaMM);
set(handles.txt_area,'String', area);


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
msgbox({'Software para reconocer esquejes' 'Desarrollado por:' '>>Mateo Noreï¿½a' '>>John Tapias' 'Procesamiento Digital de imagenes' 'Octubre 2016'},'Acerca de','custom',alienIco);


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox({'a-----Largo mï¿½ximo del esqueje en centï¿½metros, (Esqueje largo)' 'b-----Largo mï¿½nimo en centï¿½metros, (Esqueje corto)' 'c-----Distancia de la base del tallo a la primera hoja ( Esqueje hoja en base) en milï¿½metros.'},'Ayuda','help');


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
