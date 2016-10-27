function l = largoTallo(f)

propImage = regionprops(f,'all');
extremaImage = propImage.Extrema;

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
talloBase = pdist([x1,y1;x2,y2]);

l = talloBase;
