clear all, close all, clc;
a = imread('3_Esquejes/esquejes (66).TIFF');
b = rgb2gray(a);
[b,c] = componentes_color(a);
d = c;
figure(2); imshow(b);
em = 160;
d(d > em) = 255; 
d(d < 255) = 0;
[e] = elMayor(d);

%--- Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%--- mostrar en pantalla original y alineado

%f = alinearEsqueje(e);

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);
prop = regionprops(e,'all');
imageEsqueje = prop.Image;

%Distancia extremos
g = imageEsqueje;
propImages = regionprops(imageEsqueje, 'all');
maxDist = pdist([propImages.Extrema(4,:); propImages.Extrema(7,:)]);

minAng = 0;
for i = 1:180
    g = imrotate(imageEsqueje, i);
    propImages = regionprops(g, 'all');
    distI = pdist([propImages.Extrema(4,:); propImages.Extrema(7,:)]);
    if distI > maxDist
        maxDist = distI;
        minAng = i;
    end
end

f = imrotate(imageEsqueje, minAng);
propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;
x = propImage.Extrema(7,1) - propImage.Extrema(4,1);
y = propImage.Extrema(7,2) - propImage.Extrema(4,2);
%%if (x<0 && y>=0) || (x<0 && y<0)
    %%finalAng = atand(abs(y/x));
    finalAng = -atand(abs(y/x));
%%else
    %%finalAng = -atand(abs(y/x));
%%end

subplot 131; imshow(f);
f = imrotate(f, finalAng);

x1 = extremaImage(4,1);
x2 = extremaImage(7,1);
y1 = extremaImage(4,2);
y2 = extremaImage(7,2);
f1 = imdistline(gca,[x1 x2],[y1 y2]);

subplot 132; imshow(f);
propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;

factorConversion = 0.15;

% Hallar m�xima distancia
maxDist = pdist([extremaImage(4,:); extremaImage(7,:)]);
distMilimeters = maxDist * factorConversion;
[lengthEsqueje, y] = max(sum(f,2));
x1 = extremaImage(4,1);
x2 = extremaImage(7,1);
y1 = extremaImage(4,2);
y2 = extremaImage(7,2);
% f3 = imdistline(gca,[0 n],[midM midM]);
f2 = imdistline(gca,[x1 x2],[y1 y2]);

[fil,col] = size(f);
vec = zeros(1,col);
for i=1: col
   for j =1: fil
       if (f(j,i) == 1)
           vec(i) = vec(i)+1;
       end
   end
end

subplot 133; plot(vec);
[m, n] = size(vec);
for i = 1 : n
    if vec(i) >= 80
        break
    end
end

[val, side] = min(sum(vec(1:i),sum(vec(i+1:n))));

if side == 0
    x1 = extremaImage(7,1);
    y1 = (extremaImage(7,2)+extremaImage(8,2))/2;
    x2 = i;
    y2 = (extremaImage(7,2)+extremaImage(8,2))/2;
else
    x1 = i+1;
    y1 = (extremaImage(3,2)+extremaImage(4,2))/2;
    x2 = extremaImage(3,1);
    y2 = (extremaImage(3,2)+extremaImage(4,2))/2;
end
talloBase = pdist([x1,y1;x2,y2])
talloBaseMilimeters = talloBase * factorConversion


area = propImage.Area * factorConversion^2;

d = e;
d = [d,d,d];
[fil,col,cap] = size(a);
d = reshape(d,[fil,col,cap]);
a(d==0)=0;
figure(7);imshow(a);