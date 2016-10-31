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

function d = alinearEsqueje(f)

% --- Escoger lado donde se encuentra el tallo

[m, n] = size(f);           % Se encuentra el tamaño de la imagen
leftSide = f(:,1:n/2);      % Se establecen los límites del lado izquierdo
rightSide = f(:,n/2+1:n);   % Se establecen los límites del lado derecho
upSide = f(1:m/2,:);        % Se establecen los límites del lado de arriba
downSide = f(m/2+1:m,:);    % Se establecen los límites del lado de abajo

ratioLeft = sum(leftSide(:))/(m*n);     % Se calcula la cantidad de pixeles en el lado izquierdo respecto a la imagen completa
ratioRight = sum(rightSide(:))/(m*n);   % Se calcula la cantidad de pixeles en el lado derecho respecto a la imagen completa
ratioUp = sum(upSide(:))/(m*n);         % Se calcula la cantidad de pixeles en el lado de arriba respecto a la imagen completa
ratioDown = sum(downSide(:))/(m*n);     % Se calcula la cantidad de pixeles en el lado de abajo respecto a la imagen completa

subs1 = abs(ratioLeft - ratioRight);    % Se busca la mayor variación en la cantidad de pixeles a la izquierda y derecha
subs2 = abs(ratioUp - ratioDown);       % Se busca la mayor variación en la cantidad de pixeles arriba y abajo

if subs1 > subs2                                        % Si hay mayor variación en la izquierda y derecha el tallo está en uno de esos lados
    if ratioLeft < ratioRight && sum(leftSide(:)) > 0   % Si la razón a la izquierda es menor, el tallo está en ese lado
        side = leftSide;                                % El tallo está a la izquierda
        firstAng = 0;                                   % No se debe agregar angulo porque ya está a la izquierda el tallo
    else                                                % Si la razón a la derecha es mayor, el tallo está en ese lado
        side = rightSide;                               % El tallo está a la derecha
        firstAng = 180;                                 % Se agregan 180 grados para que el tallo esté a la izquierda
    end
else                                                    % Si hay mayor variación arriba y abajo el tallo está en uno de esos lados
    if ratioUp < ratioDown && sum(upSide(:)) > 0        % Si la razón arriba es menor, el tallo está en ese lado
        side = upSide;                                  % El tallo está arriba
        firstAng = 90;                                  % Se agregan 90 grados para que el tallo esté a la izquierda
    else                                                % Si la razón abajo es menor, el tallo está en ese lado
        side = downSide;                                % El tallo está abajo
        firstAng = 270;                                 % Se agregan 270 grados para que el tallo esté a la izquierda
    end
end

% --- Alineación del tallo

portion = imrotate(side, firstAng);                     % --- Se toma el lado hallado y se ubica el tallo a la izquierda
rpPortion = mayorProps(regionprops(portion, 'Area', ... % --- Se hallan las propiedades del lado encontrado, se toma el área mayor con mayorprops
                       'ConvexArea', 'Orientation'));

% --- Para la alineación del tallo se cortará la imagen hasta que se
% encuentre un lado  con una región simétrica, rectangular, que represente 
% una porción significativa del tallo, y ésta será la que se alineará con el eje.
% El criterio para que una región sea simétrica es la razón 
% Area/ConvexArea, cuyo valor debe ser superior a 0.75, este proceso se
% llevará a cabo máximo tres veces, ya que después de tres cortes la
% porción se torna cuadrada y no alineará correctamente

i = 1;      % --- Se inicializa un contador

while (rpPortion.Area/rpPortion.ConvexArea) < 0.75 && i < 3     % --- Tomar una porción del tallo que sea simétrica
    
    [m, n] = size(portion);         % --- Se halla el tamaño de la porción     
    leftSide = portion(:,1:n/2);    % --- Se toma el lado izquierdo
    rightSide = portion(:,n/2+1:n); % --- Se toma el lado derecho
    
    sides = {leftSide, rightSide};  % --- Se crea una estructura para contener los lados
    
    rpLeft = mayorProps(regionprops(leftSide, 'Area', 'ConvexArea'));   % --- Se halla el área y el ConvexArea del lado izquierdo usando regionprops, se toma el área mayor con mayorprops          
    rpRight = mayorProps(regionprops(rightSide, 'Area', 'ConvexArea')); % --- Se halla el área y el ConvexArea del lado derecho usando regionprops, se toma el área mayor con mayorprops
    
    ratioLeft = rpLeft.Area/rpLeft.ConvexArea;      % --- Se halla la razón del lado izquierdo
    ratioRight = rpLeft.Area/rpRight.ConvexArea;    % --- Se halla la razón del lado derecho
    
    ratiosSides = [ratioLeft,ratioRight];           % --- Se guardan las razones en un vector
    
    [maxRatio, indMaxRatio] = max(ratiosSides);     % --- Se halla la razón máxima y su índice para ubicar el lado en la estructura
    
    portion = sides{indMaxRatio};                   % --- Se obtiene el lado correcto de la estructura
    
    rpPortion = mayorProps(regionprops(portion, 'Area', 'ConvexArea', 'Orientation'));  % --- Se hallan el área, el ConvexArea y la orientación del lado seleccionado, se toma el área mayor con mayorprops
    
    i = i+1;    % --- Paso del contado

end

angTallo = rpPortion.Orientation;   % --- El ángulo del tallo está dado por la orientación hallada en regionprops

d = firstAng-angTallo;	% --- Se retorna el ángulo necesario para que el tallo esté a la izquierda menos el ángulo de rotación para alinear el esqueje