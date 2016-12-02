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

% Función que retorna un vector de características de una imagen de una
% señal de tránsito

function x = extractFeatures(a)

%--------------------------------------------------------------------------
%--1. Extracción de características de la imagen --------------------------
%--------------------------------------------------------------------------
tM = 30;                        % Se establece el tamaño de la imagen

x = zeros(tM*2+3,1);            % Se declara la matriz que contendrá las características de cada muestra

a = imresize(a, [tM tM]);       % Se redimensiona la imagen al tamaño específicado anteriormente
bImg = rgb2gray(a);             % Se pasa la imagen a escala de grises
r = a(:,:,1);                   % Se toma la capa roja
g = a(:,:,2);                   % Se toma la capa verde
b = a(:,:,3);                   % Se toma la cada azul
mR = (1/255)* mean(r(:));       % Se calcula el promedio normalizado de la capa roja
mG = (1/255)* mean(g(:));       % Se calcula el promedio normalizado de la capa verde
mB = (1/255)* mean(b(:));       % Se calcula el promedio normalizado de la capa azul
x(1) = mR;                      % Se guarda en el vector de características de cada imagen el promedio de la capa roja
x(2) = mG;                      % Se guarda en el vector de características de cada imagen el promedio de la capa verde
x(3) = mB;                      % Se guarda en el vector de características de cada imagen el promedio de la capa azul
t = mean(bImg(:));              % Se calcula el promedio de la imagen en blanco y negro
for k=1:tM                      % Por cada fila o columna
    vh = mean(bImg(k,:)>t);     % Se calcula el promedio de los valores de la columna que están sobre la media de la imagen completa
    hh = mean(bImg(:,k)>t);     % Se calcula el promedio de los valores de la fila que están sobre la media de la imagen completa
    x(k+3) = vh;                % Se guarda en el vector de características de cada imagen el promedio de columnas
    x(k+tM+3) = hh;             % Se guarda en el vector de características de cada imagen el promedio de filas
end