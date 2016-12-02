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

clear all; close all; clc; % Se limpia el espacio de trabajo

%--------------------------------------------------------------------------
%--1. Extracción de características ---------------------------------------
%--------------------------------------------------------------------------

nMC = 20;                           % Número de muestras de cada clase
nMT = nMC*10;                       % Numero de variables target
trafficTargets = zeros(10, nMT);    % Se declara un vector que contiene los targets

for i=1:10                                      % Por cada clase
    trafficTargets(i,nMC*i-(nMC-1):i*nMC) = 1;  % La matriz se llenará en orden, donde cada columna representa una muestra, y se encontrará en 1 en la fila correspondiente a la clase
end

tM = 30;                                % Tamaño al cual se redimensionarán las imágenes

% Se seleccionan tres características de cada capa de color, siendo cada una el promedio normalizado
% Las características restantes, tM*2, están dadas por los valores que son mayores que el promedio de 
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

% Se selecciona la función 'Scaled conjugate gradient backpropagation' como
% función de entrenamiento
trainFcn = 'trainscg';  % .

% Se crea la red neuronal artificial con 100 neuronas en la capa oculta
hiddenLayerSize = 100;
net = patternnet(hiddenLayerSize);

% Se establece la división de datos para entrenamiento, validación y prueba
net.divideParam.trainRatio = 70/100;    % Se asigna el 70% de los datos para entrenamiento
net.divideParam.valRatio = 15/100;      % Se asigna el 15% de los datos para validación
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