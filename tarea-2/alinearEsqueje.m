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

function d = alinearEsqueje(f)

% --- Escoger lado donde se encuentra el tallo

[m, n] = size(f);           % Se encuentra el tama�o de la imagen
leftSide = f(:,1:n/2);      % Se establecen los l�mites del lado izquierdo
rightSide = f(:,n/2+1:n);   % Se establecen los l�mites del lado derecho
upSide = f(1:m/2,:);        % Se establecen los l�mites del lado de arriba
downSide = f(m/2+1:m,:);    % Se establecen los l�mites del lado de abajo

ratioLeft = sum(leftSide(:))/(m*n);     % Se calcula la cantidad de pixeles en el lado izquierdo respecto a la imagen completa
ratioRight = sum(rightSide(:))/(m*n);   % Se calcula la cantidad de pixeles en el lado derecho respecto a la imagen completa
ratioUp = sum(upSide(:))/(m*n);         % Se calcula la cantidad de pixeles en el lado de arriba respecto a la imagen completa
ratioDown = sum(downSide(:))/(m*n);     % Se calcula la cantidad de pixeles en el lado de abajo respecto a la imagen completa

subs1 = abs(ratioLeft - ratioRight);    % Se busca la mayor variaci�n en la cantidad de pixeles a la izquierda y derecha
subs2 = abs(ratioUp - ratioDown);       % Se busca la mayor variaci�n en la cantidad de pixeles arriba y abajo

if subs1 > subs2                                        % Si hay mayor variaci�n en la izquierda y derecha el tallo est� en uno de esos lados
    if ratioLeft < ratioRight && sum(leftSide(:)) > 0   % Si la raz�n a la izquierda es menor, el tallo est� en ese lado
        side = leftSide;                                % El tallo est� a la izquierda
        firstAng = 0;                                   % No se debe agregar angulo porque ya est� a la izquierda el tallo
    else                                                % Si la raz�n a la derecha es mayor, el tallo est� en ese lado
        side = rightSide;                               % El tallo est� a la derecha
        firstAng = 180;                                 % Se agregan 180 grados para que el tallo est� a la izquierda
    end
else                                                    % Si hay mayor variaci�n arriba y abajo el tallo est� en uno de esos lados
    if ratioUp < ratioDown && sum(upSide(:)) > 0        % Si la raz�n arriba es menor, el tallo est� en ese lado
        side = upSide;                                  % El tallo est� arriba
        firstAng = 90;                                  % Se agregan 90 grados para que el tallo est� a la izquierda
    else                                                % Si la raz�n abajo es menor, el tallo est� en ese lado
        side = downSide;                                % El tallo est� abajo
        firstAng = 270;                                 % Se agregan 270 grados para que el tallo est� a la izquierda
    end
end

% --- Alineaci�n del tallo

portion = imrotate(side, firstAng);                     % --- Se toma el lado hallado y se ubica el tallo a la izquierda
rpPortion = mayorProps(regionprops(portion, 'Area', ... % --- Se hallan las propiedades del lado encontrado, se toma el �rea mayor con mayorprops
                       'ConvexArea', 'Orientation'));

% --- Para la alineaci�n del tallo se cortar� la imagen hasta que se
% encuentre un lado  con una regi�n sim�trica, rectangular, que represente 
% una porci�n significativa del tallo, y �sta ser� la que se alinear� con el eje.
% El criterio para que una regi�n sea sim�trica es la raz�n 
% Area/ConvexArea, cuyo valor debe ser superior a 0.75, este proceso se
% llevar� a cabo m�ximo tres veces, ya que despu�s de tres cortes la
% porci�n se torna cuadrada y no alinear� correctamente

i = 1;      % --- Se inicializa un contador

while (rpPortion.Area/rpPortion.ConvexArea) < 0.75 && i < 3     % --- Tomar una porci�n del tallo que sea sim�trica
    
    [m, n] = size(portion);         % --- Se halla el tama�o de la porci�n     
    leftSide = portion(:,1:n/2);    % --- Se toma el lado izquierdo
    rightSide = portion(:,n/2+1:n); % --- Se toma el lado derecho
    
    sides = {leftSide, rightSide};  % --- Se crea una estructura para contener los lados
    
    rpLeft = mayorProps(regionprops(leftSide, 'Area', 'ConvexArea'));   % --- Se halla el �rea y el ConvexArea del lado izquierdo usando regionprops, se toma el �rea mayor con mayorprops          
    rpRight = mayorProps(regionprops(rightSide, 'Area', 'ConvexArea')); % --- Se halla el �rea y el ConvexArea del lado derecho usando regionprops, se toma el �rea mayor con mayorprops
    
    ratioLeft = rpLeft.Area/rpLeft.ConvexArea;      % --- Se halla la raz�n del lado izquierdo
    ratioRight = rpLeft.Area/rpRight.ConvexArea;    % --- Se halla la raz�n del lado derecho
    
    ratiosSides = [ratioLeft,ratioRight];           % --- Se guardan las razones en un vector
    
    [maxRatio, indMaxRatio] = max(ratiosSides);     % --- Se halla la raz�n m�xima y su �ndice para ubicar el lado en la estructura
    
    portion = sides{indMaxRatio};                   % --- Se obtiene el lado correcto de la estructura
    
    rpPortion = mayorProps(regionprops(portion, 'Area', 'ConvexArea', 'Orientation'));  % --- Se hallan el �rea, el ConvexArea y la orientaci�n del lado seleccionado, se toma el �rea mayor con mayorprops
    
    i = i+1;    % --- Paso del contado

end

angTallo = rpPortion.Orientation;   % --- El �ngulo del tallo est� dado por la orientaci�n hallada en regionprops

d = firstAng-angTallo;	% --- Se retorna el �ngulo necesario para que el tallo est� a la izquierda menos el �ngulo de rotaci�n para alinear el esqueje