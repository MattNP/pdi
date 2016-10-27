%--- Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%--- mostrar en pantalla original y alineado

function f = alinearEsqueje(e)

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);
prop = regionprops(e,'all');
imageEsqueje = prop.Image;

%Distancia extremos
g = imageEsqueje;
propImages = regionprops(imageEsqueje, 'all');
%lados[1:4;5:8]
maxDist = pdist([propImages.Extrema(3,:); propImages.Extrema(7,:)]);
minAng = 0;

% for i = 10:10:180
%     g = imrotate(imageEsqueje, i);
%     imwrite(g, strcat('esquejeBonito',int2str(i), '.bmp'), 'bmp');
%     propImages = mayorProps(regionprops(g, 'all'));
%     disp(propImages.Area)
%     disp(propImages.Extrema(3,:))
%     disp(propImages.Extrema(7,:))
%     distI = pdist([propImages.Extrema(3,:); propImages.Extrema(7,:)]);
%     if distI > maxDist
%         maxDist = distI;
%         minAng = i;
%     end
% end

% f = imrotate(imageEsqueje, minAng);
f = imageEsqueje;
propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;

x = propImage.Extrema(7,1) - propImage.Extrema(3,1);
y = propImage.Extrema(7,2) - propImage.Extrema(3,2);
%%if (x<0 && y>=0) || (x<0 && y<0)
    %%finalAng = atand(abs(y/x));
finalAng = atand(y/x);
hip = sqrt(x^2 + y^2);
disp(['�ngulo imagen: ', num2str(finalAng, 3)]);
disp(['Hipotenusa: ', num2str(hip, 3)]);

x1 = extremaImage(3,1);
x2 = extremaImage(7,1);
y1 = extremaImage(3,2);
y2 = extremaImage(7,2);
subplot 131; imshow(f);
f1 = imdistline(gca,[x1 x2],[y1 y2]);

rotated = imrotate(f, finalAng);
propImage = regionprops(rotated,'all');
extremaImage = propImage.Extrema;

x = propImage.Extrema(7,1) - propImage.Extrema(3,1);
y = propImage.Extrema(7,2) - propImage.Extrema(3,2);
finalAng = atand(y/x);
hip = sqrt(x^2 + y^2);
disp(['�ngulo imagen rotada: ', num2str(finalAng, 3)]);
disp(['Hipotenusa: ', num2str(hip, 3)]);

x1 = extremaImage(3,1);
x2 = extremaImage(7,1);
y1 = extremaImage(3,2);
y2 = extremaImage(7,2);

subplot 132; imshow(rotated);
f2 = imdistline(gca,[x1 x2],[y1 y2]);
%%else
    %%finalAng = -atand(abs(y/x));
%%end

f = rotated;