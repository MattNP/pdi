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

% Funci�n que retorna un vector de caracter�sticas de una imagen de una
% se�al de tr�nsito

function x = extractFeatures(a)

%--------------------------------------------------------------------------
%--1. Extracci�n de caracter�sticas de la imagen --------------------------
%--------------------------------------------------------------------------
tM = 30;                        % Se establece el tama�o de la imagen

x = zeros(tM*2+3,1);            % Se declara la matriz que contendr� las caracter�sticas de cada muestra

a = imresize(a, [tM tM]);       % Se redimensiona la imagen al tama�o espec�ficado anteriormente
bImg = rgb2gray(a);             % Se pasa la imagen a escala de grises
r = a(:,:,1);                   % Se toma la capa roja
g = a(:,:,2);                   % Se toma la capa verde
b = a(:,:,3);                   % Se toma la cada azul
mR = (1/255)* mean(r(:));       % Se calcula el promedio normalizado de la capa roja
mG = (1/255)* mean(g(:));       % Se calcula el promedio normalizado de la capa verde
mB = (1/255)* mean(b(:));       % Se calcula el promedio normalizado de la capa azul
x(1) = mR;                      % Se guarda en el vector de caracter�sticas de cada imagen el promedio de la capa roja
x(2) = mG;                      % Se guarda en el vector de caracter�sticas de cada imagen el promedio de la capa verde
x(3) = mB;                      % Se guarda en el vector de caracter�sticas de cada imagen el promedio de la capa azul
t = mean(bImg(:));              % Se calcula el promedio de la imagen en blanco y negro
for k=1:tM                      % Por cada fila o columna
    vh = mean(bImg(k,:)>t);     % Se calcula el promedio de los valores de la columna que est�n sobre la media de la imagen completa
    hh = mean(bImg(:,k)>t);     % Se calcula el promedio de los valores de la fila que est�n sobre la media de la imagen completa
    x(k+3) = vh;                % Se guarda en el vector de caracter�sticas de cada imagen el promedio de columnas
    x(k+tM+3) = hh;             % Se guarda en el vector de caracter�sticas de cada imagen el promedio de filas
end