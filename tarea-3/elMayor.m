%--------------------------------------------------------------------------
%------- TRABAJO 2 --------------------------------------------------------
%------- Clasificaci�n de esquejes ----------------------------------------
%------- Por: Mateo Nore�a Pino    mateo.norena@udea.edu.co ---------------
%-------      Estudiante Ingenier�a de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------      Profesor Facultad de Ingenieria BLQ 21-409  -----------------
%-------      Estudiante Ingenier�a de Sistemas  --------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial--
%------- V1 Octubre de 2016------------------------------------------------
%--------------------------------------------------------------------------

function [b] = elMayor(a)

% --- Retorna la imagen con una sola regi�n, la de mayor �rea

[fil,col,cap] = size(a);    % --- Se halla el tama�o de la imagen
if cap>1                    % --- Si la imagen tiene varias capas de color
    b=a;                    % --- Se retorna el valor sin realizar ning�n proceso
    return;                 % --- Finaliza la funci�n
end

[l,n] = bwlabel(a);         % --- Se segmenta la imagen
areaT = zeros(1, n);        % --- Se crea un vector de �reas
c = a*0;                    % --- Se crea una imagen vac�a
for i = 1 : n               % --- Se recorren los segmentos
    c(l == i) = 1;          % --- Se agrega a la imagen el segmento i
    area = sum(c(:));       % --- Se mide el �rea del segmento
    areaT(i) = area;        % --- Se agrega el �rea al vector de �reas
    c = a * 0;              % --- Se vuelve a dejar la imagen en blanco
end
d = max(areaT(:));          % --- Se halla la mayor �rea
b = a*0;                    % --- Se crea una imagen vac�a
    d = find(areaT == d);   % --- Encuentra el �ndice del �rea mayor 
    b(l == d) = 255;        % --- Pinta en la imagen a retornar el �rea mayor