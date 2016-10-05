function [b] = elMayor(a)

[fil,col,cap] = size(a);
if cap>1 
    b=a;
    return;
end

[l,n] = bwlabel(a);
areaT = []; c = a*0;
for i = 1 : n
    c(l == i) = 1;
    area = sum(c(:));
    areaT = [areaT, area];
    c = a * 0;
end
d = max(areaT(:));
b = a*0; d = find(areaT == d);
b(l == d) = 255;
b = imclearborder(b);
b = imfill(b);
end