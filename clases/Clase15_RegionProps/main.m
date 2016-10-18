function varargout = main(varargin)
%MAIN M-file for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('Property','Value',...) creates a new MAIN using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to main_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MAIN('CALLBACK') and MAIN('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MAIN.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 15-Jun-2015 19:57:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

set(handles.propiedades,'Visible','off');
set(handles.idioma,'Visible','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
% hObject    handle to cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img prop N;

[filename,pathname,~] = uigetfile('*.bmp','Escoja un archivo');

if filename~=0
	if strcmp(filename(end-2:end),'bmp')
		img = imread([pathname filename]);
	else
		errordlg('El archivo debe ser .bmp');
		return
	end

	prop	= regionprops(img,'all');
	N = length(prop);
	set(handles.propiedades,'Visible','on');

	% Graficar la imagen
	set(handles.imagen,'visible','on');
	imshow(img);
end


% --- Executes when selected object is changed in propiedades.
function propiedades_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in propiedades
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)



%%%% AREA
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1

global prop N img ind
ind = 1;

%Calculo de los valores
x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);
for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).Area;
%                     text(x(i)-20,y(i),sprintf('%2.1f', valores(i)),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end
%                 hold off

%Printar sobre la imagen
pintarTextoCentro(x,y,valores,img,N);

descripcion(handles);

                

%%%% BOUNDING BOX
% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton2

global prop N img ind
ind = 2;

imshow(img);
hold on

for i=1:N
	rectangle('Position',prop(i).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off

descripcion(handles);


%%% CENTROID
% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton3

global prop N img ind
ind = 3;

imshow(img);
hold on

for i=1:N
	plot(prop(i).Centroid(1),prop(i).Centroid(2),'*','MarkerSize',10,'LineWidth',2);
end
hold off

descripcion(handles)


%%%% CONVEX AREA
% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton4

global prop N img ind
ind = 4;

imshow(img);
hold on

for i=1:N
	x =(prop(i).Centroid(1))-20;
	y =prop(i).Centroid(2);
	text(x,y,sprintf('%2.1f', prop(i).ConvexArea),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end
hold off

descripcion(handles);


%%% CONVEX HULL
% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton5

global prop N img ind
ind = 5;

imshow(img);
hold on

for i=1:N
	plot(prop(i).ConvexHull(:,1),prop(i).ConvexHull(:,2),'LineWidth',2);
end
hold off

descripcion(handles);


%%%%% CONVEX IMAGE
% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton6

global prop N img ind
ind = 6;

IMaux = 0*img;

for i=1:N
	A = prop(i).ConvexImage;
	[a,b] = size(A);
	x = round(prop(i).Centroid(2));
	y = round(prop(i).Centroid(1));
	IMaux(x-round(a/2):(x-round(a/2))+a-1,y-round(b/2):(y-round(b/2))+b-1) = A;
end

imshow(IMaux)

descripcion(handles);


%%% Eccentricity
% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton7

global prop N img ind
ind = 7;

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).Eccentricity;
end
fprintf(''); 

pintarTextoCentro(x,y,valores,img,N);

descripcion(handles);


%%%% EQUIVALENT DIAMETER
% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton8

global prop N img ind
ind = 8;

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).EquivDiameter;
end

pintarTextoCentro(x,y,valores,img,N);                

descripcion(handles);


%%%% EULER NUMBER
% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton9

global prop N img ind
ind = 9;

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).EulerNumber;
end

pintarTextoCentro(x,y,valores,img,N);  

descripcion(handles);


%%%% EXTENT
% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton10

global prop N img ind
ind = 10;

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).Extent;
end

pintarTextoCentro(x,y,valores,img,N);  

descripcion(handles);


%%%%% EXTREMA
% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton11

global prop N img ind
ind = 11;

imshow(img);
hold on

for i=1:N
   plot(prop(i).Extrema(:,1),prop(i).Extrema(:,2),'m*','LineWidth',1.5); 
end
hold off

descripcion(handles);


%%%%% FILLED AREA
% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton12

global prop N img ind
ind = 12;

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).FilledArea;
end

pintarTextoCentro(x,y,valores,img,N);  

descripcion(handles);


%%%% FILLED IMAGE
% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton13

global prop N img ind
ind = 13;

IMaux = 0*img;

for i=1:N
	A = prop(i).FilledImage;
	[a,b] = size(A);
	x = round(prop(i).Centroid(2));
	y = round(prop(i).Centroid(1));
	IMaux(x-round(a/2):(x-round(a/2))+a-1,y-round(b/2):(y-round(b/2))+b-1) = A;
end

imshow(IMaux)

descripcion(handles);


%%%% IMAGE
% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton14

global prop N img ind
ind = 14;

IMaux = 0*img;

for i=1:N
	A = prop(i).Image;
	[a,b] = size(A);
	x = round(prop(i).Centroid(2));
	y = round(prop(i).Centroid(1));
	IMaux(x-round(a/2):(x-round(a/2))+a-1,y-round(b/2):(y-round(b/2))+b-1) = A;
end

imshow(IMaux)

descripcion(handles);


%%%% 'MajorAxisLength'
% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton15

global prop N img ind
ind = 15;

imshow(img);
hold on;
phi = linspace(0,2*pi,50);            
cosphi = cos(phi);
sinphi = sin(phi);
for k=1:N
	xbar = prop(k).Centroid(1);
	ybar = prop(k).Centroid(2);
	a = prop(k).MajorAxisLength/2; 
	b = prop(k).MinorAxisLength/2;         
	theta = pi*prop(k).Orientation/180;
	R = [ cos(theta)   sin(theta)       
		 -sin(theta)   cos(theta)];     
	xy = [a*cosphi; b*sinphi];
	xy = R*xy;
	x = xy(1,:) + xbar;
	y = xy(2,:) + ybar;
	plot(x,y,'r','LineWidth',2); 
	text(xbar-20,ybar,sprintf('%2.1f', prop(k).MajorAxisLength),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end
			
descripcion(handles);


%%%% 'MinorAxisLength'
% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton16

global prop N img ind
ind = 16;

imshow(img);
hold on;
phi = linspace(0,2*pi,50);            
cosphi = cos(phi);
sinphi = sin(phi);
for k=1:N
	xbar = prop(k).Centroid(1);
	ybar = prop(k).Centroid(2);
	a = prop(k).MajorAxisLength/2; 
	b = prop(k).MinorAxisLength/2;         
	theta = pi*prop(k).Orientation/180;
	R = [ cos(theta)   sin(theta)       
		 -sin(theta)   cos(theta)];     
	xy = [a*cosphi; b*sinphi];
	xy = R*xy;
	x = xy(1,:) + xbar;
	y = xy(2,:) + ybar;
	plot(x,y,'r','LineWidth',2); 
	text(xbar-20,ybar,sprintf('%2.1f', prop(k).MinorAxisLength),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end

descripcion(handles);


%%%%% ORIENTATION
% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton17

global prop N img ind
ind = 17;

imshow(img);

hold on;
phi = linspace(0,2*pi,50);            
cosphi = cos(phi);
sinphi = sin(phi);
for k=1:N
	xbar = prop(k).Centroid(1);
	ybar = prop(k).Centroid(2);
	a = prop(k).MajorAxisLength/2; 
	b = prop(k).MinorAxisLength/2;         
	theta = pi*prop(k).Orientation/180;
	R = [ cos(theta)   sin(theta)       
		 -sin(theta)   cos(theta)];     
	xy = [a*cosphi; b*sinphi];
	xy = R*xy;
	x = xy(1,:) + xbar;
	y = xy(2,:) + ybar;
	plot(x,y,'r','LineWidth',2); 
	text(xbar-20,ybar,sprintf('%2.1f', prop(k).Orientation),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end

descripcion(handles);


%%% PERIMETER
% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton18

global prop N img ind
ind = 18;

imshow(img);
b = bwboundaries(img);
hold on 

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	%Capturo los bordes para señalar el perimetro
	boundary = b{i};
	plot(boundary(:,2),boundary(:,1),'b','LineWidth',2);

	% Escribo el perimetro en el pie del esqueje
	x(i) = prop(i).Centroid(1)-20;
	y(i) = prop(i).Centroid(2);
	valores(i) = prop(i).Perimeter;
	text(x(i),y(i),sprintf('%2.1f',valores(i)),'EdgeColor','b','Color','b','BackgroundColor',[.4 .9 .5]);
end 
hold off

descripcion(handles);


%%%% pixelidxlist
% --- Executes on button press in radiobutton19.
function radiobutton19_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton19

global prop N img ind
ind = 19;

imshow(img);
hold on

Im = zeros(size(img));
for i=1:N
	A = prop(i).PixelIdxList;
	B = 1:length(A);
	Im(A) = B'/max(B);
end

imshow(Im)
hold off  

descripcion(handles);

%%%%% PIXELLIST			
% --- Executes on button press in radiobutton20.
function radiobutton20_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton20

global prop N img ind
ind = 20;

imshow(img);
hold on

for i=1:N
	x = i/N;
	plot(prop(i).PixelList(:,1),prop(i).PixelList(:,2),'.','Color',[x 0 x]);
end
hold off

descripcion(handles);


%%%%% SOLIDITY
% --- Executes on button press in radiobutton21.
function radiobutton21_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton21

global prop N img ind
ind = 21;

x = zeros(N,1);
y = zeros(N,1);
valores = zeros(N,1);

for i=1:N
	x(i)=prop(i).Centroid(1);
	y(i)=prop(i).Centroid(2);
	valores(i) = prop(i).Solidity;
end

pintarTextoCentro(x,y,valores,img,N);

descripcion(handles);


%%%% 'SubarrayIdx'
% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton22

global prop N img ind
ind = 22;

% imshow(img);
% hold on
% 
% [L,~]=bwlabel(img);           %Identificamos y etiquetamos cada esqueje
% 
% % Im = zeros(size(img));
% for i=1:N
% 	A = prop(i).SubarrayIdx{1};
% 	%B = 1:length(A);
% 	Im = zeros(ceil(sqrt(max(A))));
% 	Im(A) = 1;%B'/max(B);
% 	imshow(Im)
% 	pause(1)		
% end

% imshow(Im)
% hold off 

descripcion(handles);


%%%%% Cambia de idioma
% --- Executes on button press in idioma.
function idioma_Callback(hObject, eventdata, handles)
% hObject    handle to idioma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

idioma = get(handles.idioma,'String');
if strcmp(idioma,'Español')						%%%% Mensajes en Español
	set(handles.idioma,'String','English');
else											%%%% Mensajes en Ingles
	set(handles.idioma,'String','Español');
end

descripcion(handles);
