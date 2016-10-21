clear all, close all, clc;
a = imread('3_Esquejes/esquejes (449).TIFF');
b = rgb2gray(a);
[b,c] = componentes_color(a);
%[d] = filtros(c);
d = c;
figure(2); imshow(b);
% figure(2); imshow(c);
% figure(3); imshow(d);
% e = impixel;
% em = min(e(:));
em = 160;
d(d > em) = 255; 
d(d < 255) = 0;
% figure(4); imshow(d);
[e] = elMayor(d);

%--- Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%--- mostrar en pantalla original y alineado

%f = alinearEsqueje(e);

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);
prop = regionprops(e,'all');
chiquita = prop.Image;
figure(6); subplot 131; imshow(e);

%Distancia suma
% g = chiquita;
% [m,n] = size(g);
% midM = fix(m/2);
% range = 10;
% maxSum = sum(sum(g(midM-range/2:midM+range/2,:)));
% minAng = 0;
% for i = 1:180
%     g = imrotate(chiquita, i);
%     [m,n] = size(g);
%     midM = fix(m/2);
%     sumI = sum(sum(g(midM-range/2:midM+range/2,:)));
%     if sumI > maxSum
%         maxSum = sumI;
%         minAng = i;
%     end
% end

%Distancia extremos
g = chiquita;
propImages = regionprops(chiquita, 'all');
maxDist = pdist([propImages.Extrema(4,:); propImages.Extrema(7,:)]);

minAng = 0;
for i = 1:180
    g = imrotate(chiquita, i);
    propImages = regionprops(g, 'all');
    distI = pdist([propImages.Extrema(4,:); propImages.Extrema(7,:)]);
    if distI > maxDist
        maxDist = distI;
        minAng = i;
    end
end

x = propImages.Extrema(7,1) - propImages.Extrema(4,1)
y = propImages.Extrema(7,2) - propImages.Extrema(4,2)
if (x>=0 && y>=0)
    factSign = 1;
else
    factSign = -1;
end

finalAng = minAng + factSign * rad2deg(atan((y)/(x)));
f = imrotate(chiquita, finalAng);
subplot 132; imshow(f);
subplot 131; imshow(imrotate(chiquita,minAng));
% Hallar máxima distancia
propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;
maxDist = pdist([extremaImage(4,:); extremaImage(7,:)]);
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

d = e;
d = [d,d,d];
[fil,col,cap] = size(a);
d = reshape(d,[fil,col,cap]);
a(d==0)=0;
figure(7);imshow(a);