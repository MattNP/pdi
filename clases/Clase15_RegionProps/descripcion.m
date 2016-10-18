function descripcion(handles)

global ind

	% INGLES
    %Resumen e informacion de las propiedades    
    info{1} = 'AREA: Scalar; the actual number of pixels in the region (This value might differ slightly from the value returned by bwarea, which weights different patterns of pixels differently.)';
    info{2} = 'BOUNDING BOX: The smallest rectangle containing the region, a 1-by-Q *2 vector, where Q is the number of image dimensions: ndims(L), ndims(BW), or numel(CC.ImageSize). BoundingBox is [ul_corner width]';
    info{3} = 'CENTROID:  1-by-Q vector that specifies the center of mass of the region. Note that the first element of Centroid is the horizontal coordinate (or x-coordinate) of the center of mass, and the second element is the vertical coordinate (or y-coordinate). All other elements of Centroid are in order of dimension.';
    info{4} = 'CONVEX AREA: Scalar that specifies the number of pixels in ConvexImage. This property is supported only for 2-D input label matrices';
    info{5} = 'CONVEX HULL: p-by-2 matrix that specifies the smallest convex polygon that can contain the region. Each row of the matrix contains the x- and y-coordinates of one vertex of the polygon. This property is supported only for 2-D input label matrices';
    info{6} = 'CONVEX IMAGE: Binary image (logical) that specifies the convex hull, with all pixels within the hull filled in (i.e., set to on). (For pixels that the boundary of the hull passes through, regionprops uses the same logic as roipoly to determine whether the pixel is inside or outside the hull.) The image is the size of the bounding box of the region. This property is supported only for 2-D input label matrices.';
    info{7} = 'ECCENTRICITY: Scalar that specifies the eccentricity of the ellipse that has the same second-moments as the region.';
    info{8} = 'EQUIVALENT DIAMETER:  Scalar that specifies the diameter of a circle with the same area as the region.';
    info{9} = 'EULER NUMBER: Scalar that specifies the number of objects in the region minus the number of holes in those objects.';
    info{10} = 'EXTENT: Scalar that specifies the ratio of pixels in the region to pixels in the total bounding box.';
    info{11} = 'EXTREMA: 8-by-2 matrix that specifies the extrema points in the region.';
    info{12} = 'FILLED AREA: Scalar specifying the number of on pixels in FilledImage';
    info{13} = 'FILLED IMAGE: Binary image (logical) of the same size as the bounding box of the region.';
    info{14} = 'IMAGE: inary image (logical) of the same size as the bounding box of the region.';
    info{15} = 'MAJOR AXIS LENGTH: Scalar specifying the length (in pixels) of the major axis of the ellipse that has the same normalized second central moments as the region.';
    info{16} = 'MINOR AXIS LENGTH:  Scalar; the length (in pixels) of the minor axis of the ellipse that has the same normalized second central moments as the region.';
    info{17} = 'ORIENTATION:  Scalar; the angle (in degrees ranging from -90 to 90 degrees) between the x-axis and the major axis of the ellipse that has the same second-moments as the region.';
    info{18} = 'PERIMETER:  Scalar; the distance around the boundary of the region.';
    info{16} = 'PIXEL INDEX LIST:  p-element vector containing the linear indices of the pixels in the region.';
    info{20} = 'PIXEL LIST:  p-by-Q matrix specifying the locations of pixels in the region.';
    info{21} = 'SOLIDITY: Scalar specifying the proportion of the pixels in the convex hull that are also in the region.';
    info{22} = 'SUB ARRAY INDEX: .';

	% ESPA�OL
	%Resumen e informacion de las propiedades    
	info2{1} = 'AREA: N�mero escalar, que representa la cantidad de pixeles en una regi�n';
	info2{2} = 'BOUNDING BOX: Establece el rect�ngulo m�s peque�o que puede contener toda la regi�n';
    info2{3} = 'CENTROID: Vector que especifica el centro de masa de la regi�n, el primer elemento determina la coordenada horizontal x y el segundo la coordenada vertical y';
    info2{4} = 'CONVEX AREA: N�mero escalar que especifica la cantidad de pixeles de la propiedad �ConvexImage�. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{5} = 'CONVEX HULL: Matriz que especifica el pol�gono m�s peque�o que puede contener la regi�n. Cada fila de la matriz contiene las coordenadas x y y de cada uno de los v�rtices del pol�gono. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{6} = 'CONVEX IMAGE: Imagen binaria que especifica el "ConvexHull" con todos los pixeles llenos, el tama�o de la imagen es el "BoundingBox"  de la regi�n. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{7} = 'ECCENTRICITY: Escalar que especifica la excentricidad de la elipse que tiene los mismos second-moments como la regi�n. La excentricidad es el radio de la distancia entre el foco de la elipse y la mayor longitud de su eje. Su valor esta entre 0 y 1 (Una elipse cuya excentricidad es 0 ser�a un circulo, mientras que una elipse con excentricidad 1 es un segmento de l�nea).';
    info2{8} = 'EQUIVALENT DIAMETER: N�mero escalar que especifica el di�metro de un circulo con la misma �rea de la regi�n, se calcula asi: sqrt(4*Area/pi). Esta propiedad solo soporta como entrada matrices 2-D';
    info2{9} = 'EULER NUMBER: Numero escalar que especifica la cantidad de objetos en la regi�n menos el n�mero de agujeros en estos objetos. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{10} = 'EXTENT: N�mero escalar que especifica el radio de pixeles en la regi�n sobre el total de pixeles en el bounding box. Se calcula como el �rea dividida por el �rea del bounding box. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{11} = 'EXTREMA: Retorna una matriz de 8x2 que especifica los puntos extremos en la regi�n. Cada fila en la matriz contiene las coordenadas x y y, de cada uno de los puntos. El formato del vetor es [top-left top-right right-top right-bottom bottom-right bottom-left left-bottom left-top].';
    info2{12} = 'FILLED AREA: N�mero escalar que especifica la cantidad de pixeles en FilledImage';
    info2{13} = 'FILLED IMAGE: Retorna una imagen binaria del mismo tama�o del bounding box de la regi�n. Los pixeles en on o en 1, corresponden a la regi�n con todos los posibles agujeros internos completados.';
    info2{14} = 'IMAGE: Retorna una imagen binaria o l�gica, con el mismo tama�o del bounding box de la regi�n, los pixeles en on o o en 1 corresponden a la regi�n y todos los otros pixeles est�n en off o en 0.';
    info2{15} = 'MAJOR AXIS LENGTH: N�mero escalar que especifica la longitud en pixeles del mayor eje de la elipse que tiene los mismos momentos centrales segunda normalizadas como la regi�n. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{16} = 'MINOR AXIS LENGTH: N�mero escalar que especifica la longitud en pixeles del menor eje de la elipse que tiene los mismos momentos centrales segunda normalizadas como la regi�n. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{17} = 'ORIENTATION: N�mero escalar que especifica el �ngulo en grados entre el eje x y el eje mayor de la elipse que tiene los mismos segundos momentos-como la regi�n. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{18} = 'PERIMETER: Numero escalar, determina la distancia alrededor de los l�mites de la regi�n. Se realiza calculando la distancia entre cada par de puntos continuos de la regi�n. Si la imagen contiene regiones discontinuas, regionprops retorna resultados inesperados. ';
    info2{19} = 'PIXEL INDEX LIST: Retorna un vector que contiene los �ndices lineares de los pixeles en la regi�n.';
    info2{20} = 'PIXEL LIST: Retorna una matriz que especifica las ubicaciones de cada pixel en la regi�n, donde cada fila de la matriz tiene la forma [x y] y espec�fica as� sus coordenadas.';
    info2{21} = 'SOLIDITY: N�mero escalar que especifica la proporci�n de pixeles en la ConvexHull que trambien est�n en la region. Se calcula como Area/ConvexArea. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{22} = 'SUB ARRAY INDEX: .';

%%% Enciende el bot�n de cambio de idioma
set(handles.idioma,'Visible','on');

idioma = get(handles.idioma,'String');
if strcmp(idioma,'Espa�ol')						%%%% Mensajes en Espa�ol
	%set(handles.idioma,'String','English');
	set(handles.desc,'String',info{ind});
else											%%%% Mensajes en Ingles
	%set(handles.idioma,'String','Espa�ol');
	set(handles.desc,'String',info2{ind});
end


