clear all, close all, clc;
pruebas = [56, 87, 158, 160, 206, 210, 275, 292, 302, 303, 320, 333, 353, 442];
pruebas = [56];
[m, n] = size(pruebas);
for i=1:n
    archivo = strcat('img/esquejes (', num2str(pruebas(i)), ').TIFF');
    img = imread(archivo);
    %An�lisis de la im�gen
    [b,c] = componentes_color(img);
    d = c;
    em = 160;
    d(d > em) = 255; 
    d(d < 255) = 0;
    [e] = elMayor(d);

    ee = strel ('square',6);
    e = imclose(e,ee);
    e = logical(e);

    props = regionprops(e, 'all');
    disp(size(props));
    if size(props) ~= 0
        degrees = alinearEsqueje(e);
        f = imrotate(e, degrees);
        imwrite(f, strcat('img/pruebas/esquejes (', num2str(pruebas(i)), ').bmp'));
    end
    
end
