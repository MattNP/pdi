clear all, close all, clc;
a = imread('36.TIFF');

b = rgb2gray(a);
[b,c] = componentes_color(a);
%[d] = filtros(c);
d = c;
% figure(1); imshow(b);
% figure(2); imshow(c);
% figure(3); imshow(d);
% e = impixel;
% em = min(e(:));
em = 200;
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
subplot 131; imshow(e);

g = chiquita;
[m,n] = size(g);
midM = fix(m/2);
range = 30;
maxSum = sum(sum(g(midM-range/2:midM+range/2,:)));
minAng = 0;
for i = 1:180
    g = imrotate(chiquita, i);
    [m,n] = size(g);
    midM = fix(m/2);
    sumI = sum(sum(g(midM-range/2:midM+range/2,:)));
    if sumI > maxSum
        maxSum = sumI;
        minAng = i;
    end
end

f = imrotate(chiquita, minAng);
subplot 132; imshow(f);

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

% d = e;
% d = [d,d,d];
% [fil,col,cap] = size(a);
% d = reshape(d,[fil,col,cap]);
% a(d==0)=0;
% figure(7);imshow(a);