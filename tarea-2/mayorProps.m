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

function [b] = mayorProps(a)

% --- Retorna el regionprops de mayor �rea

[m, n] = size(a);   % --- Se obtiene el n�mero de regionprops
if m == 0           % --- Si no hay regionprops
    b = a;          % --- Se retorna el regionprops vac�o que ingres�
    return;         % --- Finaliza la funci�n
end

areaMayor = a(1).Area;          % --- Se toma la primera �rea como la mayor
props = a(1);                   % --- Se toma el primer regionprops como seleccionado
for i = 2 : m                   % --- Se recorren todos los regionprops
    if a(i).Area > areaMayor    % --- Si se encuentra un �rea mayor
        props = a(i);           % --- Se toma �ste como el regionprops mayor
        areaMayor = a(i).Area;  % --- Se actualiza el �rea mayor
    end
end
b = props;                      % --- Se retorna el regionprops con el �rea mayor