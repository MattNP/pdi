%--------------------------------------------------------------------------
%------- TRABAJO 2 --------------------------------------------------------
%------- Clasificación de esquejes ----------------------------------------
%------- Por: Mateo Noreña Pino    mateo.norena@udea.edu.co ---------------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1017221148, Wpp 3117597936 -------------------------------
%------------ John Edisson Tapias Zarrazola    jedisson.tapias@udea.edu.co 
%-------      Profesor Facultad de Ingenieria BLQ 21-409  -----------------
%-------      Estudiante Ingeniería de Sistemas  --------------------------
%-------      CC 1152205006, Wpp xxxxxxxxxx -------------------------------
%------- Curso BÃ¡sico de Procesamiento de ImÃ¡genes y VisiÃ³n Artificial--
%------- V1 Octubre de 2016------------------------------------------------
%--------------------------------------------------------------------------

function [b] = elMayor(a)

% --- Retorna la imagen con una sola región, la de mayor área

[fil,col,cap] = size(a);    % --- Se halla el tamaño de la imagen
if cap>1                    % --- Si la imagen tiene varias capas de color
    b=a;                    % --- Se retorna el valor sin realizar ningún proceso
    return;                 % --- Finaliza la función
end

[l,n] = bwlabel(a);         % --- Se segmenta la imagen
areaT = zeros(1, n);        % --- Se crea un vector de áreas
c = a*0;                    % --- Se crea una imagen vacía
for i = 1 : n               % --- Se recorren los segmentos
    c(l == i) = 1;          % --- Se agrega a la imagen el segmento i
    area = sum(c(:));       % --- Se mide el área del segmento
    areaT(i) = area;        % --- Se agrega el área al vector de áreas
    c = a * 0;              % --- Se vuelve a dejar la imagen en blanco
end
d = max(areaT(:));          % --- Se halla la mayor área
b = a*0;                    % --- Se crea una imagen vacía
    d = find(areaT == d);   % --- Encuentra el índice del área mayor 
    b(l == d) = 255;        % --- Pinta en la imagen a retornar el área mayor