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

	% ESPAÑOL
	%Resumen e informacion de las propiedades    
	info2{1} = 'AREA: Número escalar, que representa la cantidad de pixeles en una región';
	info2{2} = 'BOUNDING BOX: Establece el rectángulo más pequeño que puede contener toda la región';
    info2{3} = 'CENTROID: Vector que especifica el centro de masa de la región, el primer elemento determina la coordenada horizontal x y el segundo la coordenada vertical y';
    info2{4} = 'CONVEX AREA: Número escalar que especifica la cantidad de pixeles de la propiedad ‘ConvexImage’. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{5} = 'CONVEX HULL: Matriz que especifica el polígono más pequeño que puede contener la región. Cada fila de la matriz contiene las coordenadas x y y de cada uno de los vértices del polígono. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{6} = 'CONVEX IMAGE: Imagen binaria que especifica el "ConvexHull" con todos los pixeles llenos, el tamaño de la imagen es el "BoundingBox"  de la región. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{7} = 'ECCENTRICITY: Escalar que especifica la excentricidad de la elipse que tiene los mismos second-moments como la región. La excentricidad es el radio de la distancia entre el foco de la elipse y la mayor longitud de su eje. Su valor esta entre 0 y 1 (Una elipse cuya excentricidad es 0 sería un circulo, mientras que una elipse con excentricidad 1 es un segmento de línea).';
    info2{8} = 'EQUIVALENT DIAMETER: Número escalar que especifica el diámetro de un circulo con la misma área de la región, se calcula asi: sqrt(4*Area/pi). Esta propiedad solo soporta como entrada matrices 2-D';
    info2{9} = 'EULER NUMBER: Numero escalar que especifica la cantidad de objetos en la región menos el número de agujeros en estos objetos. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{10} = 'EXTENT: Número escalar que especifica el radio de pixeles en la región sobre el total de pixeles en el bounding box. Se calcula como el área dividida por el área del bounding box. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{11} = 'EXTREMA: Retorna una matriz de 8x2 que especifica los puntos extremos en la región. Cada fila en la matriz contiene las coordenadas x y y, de cada uno de los puntos. El formato del vetor es [top-left top-right right-top right-bottom bottom-right bottom-left left-bottom left-top].';
    info2{12} = 'FILLED AREA: Número escalar que especifica la cantidad de pixeles en FilledImage';
    info2{13} = 'FILLED IMAGE: Retorna una imagen binaria del mismo tamaño del bounding box de la región. Los pixeles en on o en 1, corresponden a la región con todos los posibles agujeros internos completados.';
    info2{14} = 'IMAGE: Retorna una imagen binaria o lógica, con el mismo tamaño del bounding box de la región, los pixeles en on o o en 1 corresponden a la región y todos los otros pixeles están en off o en 0.';
    info2{15} = 'MAJOR AXIS LENGTH: Número escalar que especifica la longitud en pixeles del mayor eje de la elipse que tiene los mismos momentos centrales segunda normalizadas como la región. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{16} = 'MINOR AXIS LENGTH: Número escalar que especifica la longitud en pixeles del menor eje de la elipse que tiene los mismos momentos centrales segunda normalizadas como la región. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{17} = 'ORIENTATION: Número escalar que especifica el ángulo en grados entre el eje x y el eje mayor de la elipse que tiene los mismos segundos momentos-como la región. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{18} = 'PERIMETER: Numero escalar, determina la distancia alrededor de los límites de la región. Se realiza calculando la distancia entre cada par de puntos continuos de la región. Si la imagen contiene regiones discontinuas, regionprops retorna resultados inesperados. ';
    info2{19} = 'PIXEL INDEX LIST: Retorna un vector que contiene los índices lineares de los pixeles en la región.';
    info2{20} = 'PIXEL LIST: Retorna una matriz que especifica las ubicaciones de cada pixel en la región, donde cada fila de la matriz tiene la forma [x y] y específica así sus coordenadas.';
    info2{21} = 'SOLIDITY: Número escalar que especifica la proporción de pixeles en la ConvexHull que trambien están en la region. Se calcula como Area/ConvexArea. Esta propiedad solo soporta como entrada matrices 2-D';
    info2{22} = 'SUB ARRAY INDEX: .';

%%% Enciende el botón de cambio de idioma
set(handles.idioma,'Visible','on');

idioma = get(handles.idioma,'String');
if strcmp(idioma,'Español')						%%%% Mensajes en Español
	%set(handles.idioma,'String','English');
	set(handles.desc,'String',info{ind});
else											%%%% Mensajes en Ingles
	%set(handles.idioma,'String','Español');
	set(handles.desc,'String',info2{ind});
end


