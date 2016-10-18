function[b,c] = componentes_color(a)

[fil,col,cap] = size(a);

if cap==1
    b=a;c=a;
    return
end

% Componentes RGB
a1 = a;
a1 = normaliza(a1);
a1 = w2linea(a1);

% Componentes HSV
a2 = rgb2hsv(a);
a2 = normaliza(a2); 
s = a2(:,:,2);
a2 = w2linea(a2);

% Componentes LAB
cform = makecform('srgb2lab');
a3 = applycform(a,cform);
lab = a3;
a3 = normaliza(a3);
b1 = a3(:,:,3);
a3 = w2linea(a3);

% Componentes CMYK
cform = makecform('srgb2cmyk');
a4 = applycform(a,cform);
a4 = normaliza(a4);
k = a4(:,:,4);
a4 = a4(:,:,1:3);
y = a4(:,:,3);
a4 = w2linea(a4);

% Componentes LCH
cform = makecform('lab2lch');
a5 = applycform(lab,cform);
a5 = normaliza(a5);
a5 = w2linea(a5);

%
b = [a1;a2;a3;a4;a5];
y = normaliza(y);
c = y;

end