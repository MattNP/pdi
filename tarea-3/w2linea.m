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

function f = w2linea(g)

% --- Convierte una imagen de tres capas en una l�nea de im�genes con cada
% una de las capas

[fil,col,cap] = size(g);        % --- Se halla el tama�o de la imagen
f = reshape(g,[fil,col*cap]);   % --- Se reforma haciendo una l�nea de im�genes
end