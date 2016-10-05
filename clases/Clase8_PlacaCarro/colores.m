function [b1,y,s,r,k,b] = colores(a)

[fil, col, cap] = size (a);
if cap == 1; return; end
a1 = reshape(a,[fil, col*cap]);
r = a(:,:,1);
a2 = rgb2hsv(a);
a2 = normaliza (a2);
s = a2(:,:,2);
a2 = reshape (a2,[fil, col*cap]);
cform = makeform('srgb2cmyk');
a3 = applycform (a, cform); 
k = a3(:,:,4); 
a3 = a3(:,:,1:3);
a3 = normaliza(a3);
y = a3(:,:,3);
a3 = reshape(a3, [fil, col*cap]);
cform = makecform('srgb2lab');
a4 = applycform(a, cform);
a4 = normaliza(a4);
b1 = a4(:,:,3);
a4 = reshape(a4,[fil, col*cap]);
b = [a1;a2;a3;a4];
end 
