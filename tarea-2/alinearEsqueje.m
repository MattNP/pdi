%Alinear el esqueje con el eje horizontal con el tallo del esqueje y 
%mostrar en pantalla original y alineado
function f = alinearEsqueje(e)

ee = strel ('square',6);
e = imclose(e,ee);
e = logical(e);
prop = regionprops(e,'all');
imageEsqueje = prop.Image;

%Distancia extremos
%g = imageEsqueje
props = regionprops(imageEsqueje, 'all');
dists = zeros(4,1);
xtr = [1:4;5:8];
dists(1) = pdist([props.Extrema(1,:); props.Extrema(5,:)]);
dists(2) = pdist([props.Extrema(2,:); props.Extrema(6,:)]);
dists(3) = pdist([props.Extrema(3,:); props.Extrema(7,:)]);
dists(4) = pdist([props.Extrema(4,:); props.Extrema(8,:)]);
[maxDist, ind] = max(dists);

left = xtr(1, ind);
right = xtr(2, ind);


% minAng = 0;

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
props = regionprops(f,'all');

convex = prop.ConvexImage;

x1 = props.Extrema(left,1);
x2 = props.Extrema(right,1);
y1 = props.Extrema(left,2);
y2 = props.Extrema(right,2);

x = x2 - x1;
y = y2 - y1;
%%if (x<0 && y>=0) || (x<0 && y<0)
    %%finalAng = atand(abs(y/x));
finalAng = atand(y/x);
hip = sqrt(x^2 + y^2);
disp(['�ngulo imagen: ', num2str(finalAng, 3)]);
disp(['Hipotenusa: ', num2str(hip, 3)]);

subplot 131; imshow(f);
f1 = imdistline(gca,[x1 x2],[y1 y2]);

rotated = imrotate(f, finalAng);
props = regionprops(rotated,'all');

x1 = props.Extrema(left,1);
x2 = props.Extrema(right,1);
y1 = props.Extrema(left,2);
y2 = props.Extrema(right,2);

x = x2 - x1;
y = y2 - y1;
finalAng = atand(y/x);
hip = sqrt(x^2 + y^2);
disp(['�ngulo imagen rotada: ', num2str(finalAng, 3)]);
disp(['Hipotenusa: ', num2str(hip, 3)]);

subplot 132; imshow(rotated);
f2 = imdistline(gca,[x1 x2],[y1 y2]);
%%else
    %%finalAng = -atand(abs(y/x));
%%end

f = rotated;