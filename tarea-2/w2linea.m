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

function f = w2linea(g)

% --- Convierte una imagen de tres capas en una línea de imágenes con cada
% una de las capas

[fil,col,cap] = size(g);        % --- Se halla el tamaño de la imagen
f = reshape(g,[fil,col*cap]);   % --- Se reforma haciendo una línea de imágenes
end