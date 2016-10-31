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

function [b] = mayorProps(a)

% --- Retorna el regionprops de mayor área

[m, n] = size(a);   % --- Se obtiene el número de regionprops
if m == 0           % --- Si no hay regionprops
    b = a;          % --- Se retorna el regionprops vacío que ingresó
    return;         % --- Finaliza la función
end

areaMayor = a(1).Area;          % --- Se toma la primera área como la mayor
props = a(1);                   % --- Se toma el primer regionprops como seleccionado
for i = 2 : m                   % --- Se recorren todos los regionprops
    if a(i).Area > areaMayor    % --- Si se encuentra un área mayor
        props = a(i);           % --- Se toma éste como el regionprops mayor
        areaMayor = a(i).Area;  % --- Se actualiza el área mayor
    end
end
b = props;                      % --- Se retorna el regionprops con el área mayor