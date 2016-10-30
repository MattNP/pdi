%Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%mostrar en pantalla original y alineado
function d = alinearEsqueje(e)

prop = regionprops(e,'all');
imageEsqueje = prop.Image;

f = imageEsqueje;

%Escoger lado donde se encuentra el tallo
[m, n] = size(f);
leftSide = f(:,1:n/2);
rightSide = f(:,n/2+1:n);
upSide = f(1:m/2,:);
downSide = f(m/2+1:m,:);

ratioLeft = sum(leftSide(:))/(m*n);
ratioRight = sum(rightSide(:))/(m*n);
ratioUp = sum(upSide(:))/(m*n);
ratioDown = sum(downSide(:))/(m*n);

subs1 = abs(ratioLeft - ratioRight);
subs2 = abs(ratioUp - ratioDown);

if(subs1 > subs2)
    if ratioLeft < ratioRight && sum(leftSide(:)) > 0
        talloLado = 'izquierda';
        side = leftSide;
        firstAng = 0;
    else
        talloLado = 'derecha';
        side = rightSide;
        firstAng = 180;
    end
else
    if ratioUp < ratioDown && sum(upSide(:)) > 0
        talloLado = 'arriba';
        side = upSide;
        firstAng = 90;
    else
        talloLado = 'abajo';
        side = downSide;
        firstAng = 270;
    end
end
 
disp(['Lado tallo: ', talloLado]);

portion = imrotate(side, firstAng);
rpPortion = mayorProps(regionprops(portion, 'all'));
i = 1;

    disp(['Area: ', num2str(rpPortion.Area)]);
    disp(['ConvexArea: ', num2str(rpPortion.ConvexArea)]);
    disp(['Area/ConvexArea: ', num2str(rpPortion.Area/rpPortion.ConvexArea)]);
    disp(['Eccentrecity: ', num2str(rpPortion.Eccentricity)]);

%Tomar una porción del tallo que sea muy parecida a un rectángulo
while (rpPortion.Area/rpPortion.ConvexArea) < 0.75 && i < 3
    
    [m, n] = size(portion);
    leftSide = portion(:,1:n/2);
    rightSide = portion(:,n/2+1:n);
    
    sides = {leftSide, rightSide};
    
    rpLeft = mayorProps(regionprops(leftSide, 'all'));
    rpRight = mayorProps(regionprops(rightSide, 'all'));
    
    ratioLeft = rpLeft.Area/rpLeft.ConvexArea;
    ratioRight = rpLeft.Area/rpRight.ConvexArea;
    
    ratiosSides = [ratioLeft,ratioRight];
    
    [maxRatio, indMaxRatio] = max(ratiosSides);
    
    portion = sides{indMaxRatio};
    
    rpPortion = mayorProps(regionprops(portion, 'all'));
    
    disp(['Area: ', num2str(rpPortion.Area)]);
    disp(['ConvexArea: ', num2str(rpPortion.ConvexArea)]);
    disp(['Area/ConvexArea: ', num2str(rpPortion.Area/rpPortion.ConvexArea)]);
    disp(['Eccentrecity: ', num2str(rpPortion.Eccentricity)]);
    
    figure(1); imshow(portion);
    i = i+1;
end

angTallo = rpPortion.Orientation;
sideRotated = imrotate(side, -angTallo);
figure(1); imshow(sideRotated);
imgRotated = imrotate(f, firstAng-angTallo);
figure(2); imshow(imgRotated);

d = firstAng-angTallo;