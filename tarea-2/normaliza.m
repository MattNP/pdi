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

function d = normaliza(e)

% --- Normaliza una imagen

e = double(e);          % --- Convierte los valores en valores de coma flotante
e = e/max(e(:))*255;    % --- Normaliza respecto al m�ximo valor de la imagen
d = uint8(e);           % --- Retorna la imagen con los valores en uint8
end