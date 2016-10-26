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

% Last Modified by GUIDE v2.5 21-Oct-2016 01:10:06

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
[filename1,filepath1]=uigetfile({'*.*','All Files'},...
  'Seleccione el esqueje a analizar');
  %cd(filepath1);
 %handles.rawimg=imread([filepath1 filename1]);
 a=imread([filepath1 filename1]);

largo = str2double(get(handles.edit1,'String'));
corto = str2double(get(handles.edit2,'String'));
hoja = str2double(get(handles.edit3,'String'));

%An�lisis de la im�gen
%a = imread('3_Esquejes/esquejes (66).TIFF');
b = rgb2gray(a);
[b,c] = componentes_color(a);
d = c;
figure(2); imshow(b);
em = 160;
d(d > em) = 255; 
d(d < 255) = 0;
[e] = elMayor(d);

%--- Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%--- mostrar en pantalla original y alineado

%f = alinearEsqueje(e);

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);
prop = regionprops(e,'all');
imageEsqueje = prop.Image;

%Distancia extremos
g = imageEsqueje;
propImages = regionprops(imageEsqueje, 'all');
maxDist = pdist([propImages.Extrema(4,:); propImages.Extrema(7,:)]);

minAng = 0;
for i = 1:180
    g = imrotate(imageEsqueje, i);
    imwrite(g, strcat('esquejeBonito',int2str(i), '.bmp'), 'bmp');
    propImages = mayorProps(regionprops(g, 'all'));
    disp(propImages.Area)
    disp(propImages.Extrema(4,:))
    disp(propImages.Extrema(7,:))
    distI = pdist([propImages.Extrema(4,:); propImages.Extrema(7,:)]);
    if distI > maxDist
        maxDist = distI;
        minAng = i;
    end
end

f = imrotate(imageEsqueje, minAng);
propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;
x = propImage.Extrema(7,1) - propImage.Extrema(4,1);
y = propImage.Extrema(7,2) - propImage.Extrema(4,2);
%%if (x<0 && y>=0) || (x<0 && y<0)
    %%finalAng = atand(abs(y/x));
    finalAng = -atand(abs(y/x));
%%else
    %%finalAng = -atand(abs(y/x));
%%end

subplot 131; imshow(f);
f = imrotate(f, finalAng);

x1 = extremaImage(4,1);
x2 = extremaImage(7,1);
y1 = extremaImage(4,2);
y2 = extremaImage(7,2);
f1 = imdistline(gca,[x1 x2],[y1 y2]);

subplot 132; imshow(f);
propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;

factorConversion = 0.15;

% Hallar m�xima distancia
maxDist = pdist([extremaImage(4,:); extremaImage(7,:)]);
distMilimeters = maxDist * factorConversion;
[lengthEsqueje, y] = max(sum(f,2));
x1 = extremaImage(4,1);
x2 = extremaImage(7,1);
y1 = extremaImage(4,2);
y2 = extremaImage(7,2);
% f3 = imdistline(gca,[0 n],[midM midM]);
f2 = imdistline(gca,[x1 x2],[y1 y2]);

hold on
plot(propImage.ConvexHull(:,1),propImage.ConvexHull(:,2),'LineWidth',2);
hold off

[fil,col] = size(f);
vec = zeros(1,col);
for i=1: col
   for j =1: fil
       if (f(j,i) == 1)
           vec(i) = vec(i)+1;
       end
   end
end

subplot 133; plot(vec);
[m, n] = size(vec);
for i = 1 : n
    if vec(i) >= 80
        break
    end
end

[val, side] = min(sum(vec(1:i),sum(vec(i+1:n))));

if side == 0
    x1 = extremaImage(7,1);
    y1 = (extremaImage(7,2)+extremaImage(8,2))/2;
    x2 = i;
    y2 = (extremaImage(7,2)+extremaImage(8,2))/2;
else
    x1 = i+1;
    y1 = (extremaImage(3,2)+extremaImage(4,2))/2;
    x2 = extremaImage(3,1);
    y2 = (extremaImage(3,2)+extremaImage(4,2))/2;
end
talloBase = pdist([x1,y1;x2,y2])
talloBaseMilimeters = talloBase * factorConversion


area = propImage.Area * factorConversion^2;

d = e;
d = [d,d,d];
[fil,col,cap] = size(a);
d = reshape(d,[fil,col,cap]);
a(d==0)=0;
figure(7);imshow(a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%y = str2num(get(handles.edit1,'string'));
set(handles.edit1,'String','0');
set(handles.edit2,'String','0');
set(handles.edit3,'String','0');


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

