%--------------------------------------------------------------------------
%------- TRABAJO 3 --------------------------------------------------------
%------- Clasificaci� de señales de tránsito --------------------------
%------- Por: Mateo Nore� Pino    mateo.norena@udea.edu.co --------------
%-------      Estudiante Ingenier� de Sistemas  -------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------        -----------------------------------------------------------
%-------      Estudiante Ingenier� de Sistemas  -------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial--
%------- V1 Diciembre de 2016 ---------------------------------------------
%--------------------------------------------------------------------------

% Funci�n que obtiene la imagen de una se�al de tr�nsito para su identificaci�n
% y devuelve el �ndice de la neurona de salida activada, que resulta ser la
% clase a la cual pertenece

function ind = resultNet(img)

%--------------------------------------------------------------------------
%--1. Cargando de la red neuronal -----------------------------------------
%--------------------------------------------------------------------------
load('netRoadSigns2.mat');   % Se carga la red neuronal que guard� los datos anteriormente

%--------------------------------------------------------------------------
%--2. Obteniendo las caracter�sticas de la se�al ingresada  ---------------
%--------------------------------------------------------------------------
x = extractFeatures(img)

%--------------------------------------------------------------------------
%--3. Obteniendo la se�al clasificada  ------------------------------------
%--------------------------------------------------------------------------

yArr = net(x)

[y, ind] = max(yArr);