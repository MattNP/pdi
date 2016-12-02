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

clear all; close all; clc; % Se limpia el espacio de trabajo

%--------------------------------------------------------------------------
%--1. Extracci�n de caracter�sticas ---------------------------------------
%--------------------------------------------------------------------------

nMC = 20;                           % N�mero de muestras de cada clase
nMT = nMC*10;                       % Numero de variables target
trafficTargets = zeros(10, nMT);    % Se declara un vector que contiene los targets

for i=1:10                                      % Por cada clase
    trafficTargets(i,nMC*i-(nMC-1):i*nMC) = 1;  % La matriz se llenar� en orden, donde cada columna representa una muestra, y se encontrar� en 1 en la fila correspondiente a la clase
end

tM = 30;                                % Tama�o al cual se redimensionar�n las im�genes

% Se seleccionan tres caracter�sticas de cada capa de color, siendo cada una el promedio normalizado
% Las caracter�sticas restantes, tM*2, est�n dadas por los valores que son mayores que el promedio de 
% cada una de las filas y cada una de las columnas en la imagen en escala de grises 


trafficInputs = zeros(tM*2+3, nMT);

for i=1:10                      % Para cada una de las clases
    for j=1:nMC                 % Para cada una de las muestras de cada clase
        a = imread(strcat('resources/road_signs_train/', num2str(i), '/', num2str(j), '.ppm')); % Se lee la imagen
        trafficInputs(:,(i-1)*nMC+j) = extractFeatures(a);
    end
end

%--------------------------------------------------------------------------
%--2. Entrrenamiento de la red neuronal -----------------------------------
%--------------------------------------------------------------------------

x = trafficInputs;  % Se cargan los datos de entrenamiento de la red neuronal
t = trafficTargets; % Se cargan los targets de los datos de entrenamiento de la red neuronal

% Se selecciona la funci�n 'Scaled conjugate gradient backpropagation' como
% funci�n de entrenamiento
trainFcn = 'trainscg';  % .

% Se crea la red neuronal artificial con 100 neuronas en la capa oculta
hiddenLayerSize = 100;
net = patternnet(hiddenLayerSize);

% Se establece la divisi�n de datos para entrenamiento, validaci�n y prueba
net.divideParam.trainRatio = 70/100;    % Se asigna el 70% de los datos para entrenamiento
net.divideParam.valRatio = 15/100;      % Se asigna el 15% de los datos para validaci�n
net.divideParam.testRatio = 15/100;     % Se asigna el 15% de los datos para prueba

% Se entrena la red neuronal con los datos de entrenamiento y los
% respectivos targets
[net,tr] = train(net,x,t);

% Se prueba la red para comprobar su eficiencia
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

view(net)   % Se visualiza la red neuronal

%--------------------------------------------------------------------------
%--3. Guardado de la red neuronal -----------------------------------
%--------------------------------------------------------------------------

save('netRoadSigns2.mat'); % Se guardan los datos de la red neuronal para su posterior uso