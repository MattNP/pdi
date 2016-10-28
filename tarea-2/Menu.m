function varargout = Menu(varargin)
clc;
music = audioread('electrical.mp3');
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

% Last Modified by GUIDE v2.5 28-Oct-2016 02:28:08

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
I=imread('background.jpg');
hi = imagesc(I)
colormap gray
% Ejes invisibles
set(ha,'handlevisibility','off', ...
            'visible','off')

% UIWAIT makes Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Load images

global img
[filename1,filepath1]=uigetfile({'*.TIFF','All Files'},...
  'Seleccione el esqueje a analizar');
if filename1~=0
	if strcmp(filename1(end-3:end),'TIFF')
		img = imread([filepath1 filename1]);
	else
		errordlg('El archivo debe ser .TIFF');
		return
    end

	% Graficar la imagen
	set(handles.axes1,'visible','on');
	imshow(img);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%y = str2num(get(handles.edit1,'string'));

global f

largo = str2double(get(handles.edit1,'String'));
corto = str2double(get(handles.edit2,'String'));
hoja = str2double(get(handles.edit3,'String'));

propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;

factorConversion = 0.15;

% Hallar mï¿½xima distancia
maxDist = pdist([extremaImage(3,:); extremaImage(7,:)]);
distMilimeters = maxDist * factorConversion;
[lengthEsqueje, y] = max(sum(f,2));

% maxWidth = pdist([extremaImage(1,:); extremaImage(5,:)]);
% distMilimeters = maxDist * factorConversion;
% [widthEsqueje, y] = max(sum(f,2));

lTalloHoja = largoTallo(f) * factorConversion;

area = propImage.Area * factorConversion^2;

tEsqueje = 'Ideal';
if distMilimeters > largo*10
    tEsqueje = 'Esqueje largo';
else if distMilimeters < corto*10
        tEsqueje = 'Esqueje corto';
    else if lTalloHoja > hoja
            tEsqueje = 'Esqueje hoja en base';
        end
    end
end

set(handles.tipoEsqueje,'String',tEsqueje);
set(handles.longitudMaxima,'String',num2str(maxDist));
set(handles.longitudBaseHoja,'String',lTalloHoja);
set(handles.area,'String',area);


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
alienIco = imread('alien.png');
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
byeIco = imread('bye.png');
msgbox('Bye !!','','custom',byeIco);
pause(0.2);
clear all;
close all;


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img f

%Anï¿½lisis de la imï¿½gen
[b,c] = componentes_color(img);
d = c;
figure(2); imshow(b);
em = 160;
d(d > em) = 255; 
d(d < 255) = 0;
[e] = elMayor(d);

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);

imwrite(e, 'Imagen.bmp');
props = regionprops(e, 'all');
disp(size(props));
if size(props) ~= 0
    degrees = alinearEsqueje(e);
    f = imrotate(e,degrees);
    g = imrotate(img,degrees);
    % f = imresize(f, [1000, NaN]);
    % g = imresize(g, [1000, NaN]);
    [m, n] = size(f);
    [o, p] = size(g);
    figure(3); imshow(f);
    figure(4); imshow(g);
    disp(['Tamaño f: ', num2str(m), ' x ', num2str(n)]);
    disp(['Tamaño g: ', num2str(o), ' x ', num2str(p)]);

    d = f;
    d = [d,d,d];
    [fil,col,cap] = size(g);
    d = reshape(d,[fil,col,cap]);
    g(d==0)=0;
    set(handles.axes1,'visible','on');
    imshow(g);
end



function tipoEsqueje_Callback(hObject, eventdata, handles)
% hObject    handle to tipoEsqueje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tipoEsqueje as text
%        str2double(get(hObject,'String')) returns contents of tipoEsqueje as a double


% --- Executes during object creation, after setting all properties.
function tipoEsqueje_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tipoEsqueje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function longitudMaxima_Callback(hObject, eventdata, handles)
% hObject    handle to longitudMaxima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of longitudMaxima as text
%        str2double(get(hObject,'String')) returns contents of longitudMaxima as a double


% --- Executes during object creation, after setting all properties.
function longitudMaxima_CreateFcn(hObject, eventdata, handles)
% hObject    handle to longitudMaxima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function longitudBaseHoja_Callback(hObject, eventdata, handles)
% hObject    handle to longitudBaseHoja (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of longitudBaseHoja as text
%        str2double(get(hObject,'String')) returns contents of longitudBaseHoja as a double


% --- Executes during object creation, after setting all properties.
function longitudBaseHoja_CreateFcn(hObject, eventdata, handles)
% hObject    handle to longitudBaseHoja (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function area_Callback(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of area as text
%        str2double(get(hObject,'String')) returns contents of area as a double


% --- Executes during object creation, after setting all properties.
function area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
