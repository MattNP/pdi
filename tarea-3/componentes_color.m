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

function[b,c] = componentes_color(a)

% --- Retorna un collage de imágenes en varios espacios de color y una
% imagen en un componente de un espacio de color

[fil,col,cap] = size(a);    % --- Se halla el tamaño de la imagen

if cap==1                   % --- Si la imagen no tiene colores
    b=a;c=a;                % --- Retorna la misma imagen sin realizar ningún proceso
    return;                 % --- Finaliza la función
end

% --- Componentes RGB

a1 = a;                 % --- Se crea una copia de la imagen
a1 = normaliza(a1);     % --- Se normaliza la imagen
a1 = w2linea(a1);       % --- Se pasa de tres capas a una línea de una capa

% --- Componentes HSV

a2 = rgb2hsv(a);        % --- Se hace el cambio de espacio de color
a2 = normaliza(a2);     % --- Se normaliza la imagen
a2 = w2linea(a2);       % --- Se pasa de tres capas a una línea de una capa

% --- Componentes LAB

cform = makecform('srgb2lab');      % --- Se crea un cform para realizar el cambio de espacio de color
a3 = applycform(a,cform);           % --- Se hace el cambio de espacio de color
lab = a3;                           % --- Se guarda el espacio de color para un uso posterior
a3 = normaliza(a3);                 % --- Se normaliza la imagen
a3 = w2linea(a3);                   % --- Se pasa de tres capas a una línea de una capa

% --- Componentes CMYK

cform = makecform('srgb2cmyk');     % --- Se crea un cform para realizar el cambio de espacio de color
a4 = applycform(a,cform);           % --- Se hace el cambio de espacio de color
a4 = normaliza(a4);                 % --- Se normaliza la imagen
a4 = a4(:,:,1:3);                   % --- Se obtienen las componentes CMY
c = a4(:,:,1);                      % --- Se obtiene la componente Y (amarillo) para retornarla posteriormente
a4 = w2linea(a4);                   % --- Se pasa de tres capas a una línea de una capa

% --- Componentes LCH

cform = makecform('lab2lch');   % --- Se crea un cform para realizar el cambio de espacio de color
a5 = applycform(lab,cform);     % --- Se hace el cambio de espacio de color
a5 = normaliza(a5);             % --- Se normaliza la imagen
a5 = w2linea(a5);               % --- Se pasa de tres capas a una línea de una capa

% --- Componentes YCbCr

a6 = rgb2ycbcr(a);        % --- Se hace el cambio de espacio de color
a6 = normaliza(a6);     % --- Se normaliza la imagen
a6 = w2linea(a6);       % --- Se pasa de tres capas a una línea de una capa

% --- Retorna resultados

b = [a1;a2;a3;a4;a5;a6];       % --- Se juntan todas las imágenes en línea y se retorna el resultado
c = normaliza(c);           % --- Se normaliza la imagen
c = c;                      % --- Se retorna la componente Y
end