i=1;
j=1;
a = imread(strcat('traffic_signals/', num2str(i), '/', num2str(j), '.ppm'));
a = imresize(a, [tM tM]);

a2 = rgb2hsv(a);        % --- Se hace el cambio de espacio de color
h = a2(:,:,1);
s = a2(:,:,2);

[m, n] = size(h);

H = zeros(m,n);
S = zeros(m,n);

for i=1:m
    for j=1:n
        if h(i,j)>=0 && h(i,j)<=min(h(:))
            H(i,j) = 255*(min(h(:)+h(i,j)))/min(h(:));
        else if h(i,j)>= min(h(:)) && h(i,j)<max(h(:))
                H(i,j) = 0;
            else
                H(i,j) = 255*(h(i,j)+max(h(:)))/max(h(:));
            end
        end
        if s(i,j)>=min(s(:)) && s(i,j)<=255
            S(i,j) = 255;
        else 
            S(i,j) = s(i,j);
        end
    end
end
figure(1); imshow(h);
figure(2); imshow(s);
figure(3); imshow(H);
figure(4); imshow(S);
figure(5); imshow(H.*S);