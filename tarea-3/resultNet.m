%--------------------------------------------------------------------------
%------- TRABAJO 3 --------------------------------------------------------
%------- Clasificaciï¿½ de seÃ±ales de trÃ¡nsito --------------------------
%------- Por: Mateo Noreï¿½ Pino    mateo.norena@udea.edu.co --------------
%-------      Estudiante Ingenierï¿½ de Sistemas  -------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------        -----------------------------------------------------------
%-------      Estudiante Ingenierï¿½ de Sistemas  -------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso BÃ¡sico de Procesamiento de ImÃ¡genes y VisiÃ³n Artificial--
%------- V1 Diciembre de 2016 ---------------------------------------------
%--------------------------------------------------------------------------

% Función que obtiene la imagen de una señal de tránsito para su identificación
% y devuelve el índice de la neurona de salida activada, que resulta ser la
% clase a la cual pertenece

function ind = resultNet(img)

%--------------------------------------------------------------------------
%--1. Cargando de la red neuronal -----------------------------------------
%--------------------------------------------------------------------------
load('netRoadSigns2.mat');   % Se carga la red neuronal que guardó los datos anteriormente

%--------------------------------------------------------------------------
%--2. Obteniendo las características de la señal ingresada  ---------------
%--------------------------------------------------------------------------
x = extractFeatures(img)

%--------------------------------------------------------------------------
%--3. Obteniendo la señal clasificada  ------------------------------------
%--------------------------------------------------------------------------

yArr = net(x)

[y, ind] = max(yArr);