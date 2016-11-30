clear all; close all; clc;

nMC = 20;
nMT = nMC*10;
trafficTargets = zeros(10, nMT);

for i=1:10
    trafficTargets(i,nMC*i-(nMC-1):i*nMC) = 1;
end

tM = 30;
nS = 100;

trafficInputs = zeros(tM*2+3, nMT);

for i=1:10
    for j=1:nMC
        a = imread(strcat('traffic_signals/', num2str(i), '/', num2str(j), '.ppm'));
        a = imresize(a, [tM tM]);
        [c,hImg,sImg] = componentes_color(a);
         
         
%         bImg(bImg < mean(bImg(:))) = 255; 
%         bImg(bImg < 77) = 255; 
%         bImg(bImg < 255) = 0;
%         bImg = rgb2gray(a);        
%         level=graythresh(bImg);
%         bImg=im2bw(a,level);
        
        imwrite(bImg, strcat('bin/', num2str((i-1)*10+j), '.jpg'));
%         imwrite(c, strcat('bin/c', num2str((i-1)*10+j), '.jpg'));
        r = a(:,:,1);
        g = a(:,:,2);
        b = a(:,:,3);
        mR = (1/256)* mean(r(:));
        mG = (1/256)* mean(g(:));
        mB = (1/256)* mean(b(:));
        trafficInputs(1,(i-1)*nMC+j) = mR;
        trafficInputs(2,(i-1)*nMC+j) = mG;
        trafficInputs(3,(i-1)*nMC+j) = mB;
        t = mean(bImg(:));
        for k=1:tM
            vh = mean(bImg(k,:)>t);
            hh = mean(bImg(:,k)>t);
            trafficInputs(k+3,(i-1)*nMC+j) = vh;
            trafficInputs(k+tM+3,(i-1)*nMC+j) = hh;
        end
    end
end
% i = 1;
% j = 1;
% a = imread(strcat('traffic_signals/', num2str(i), '/', num2str(j), '.ppm'));
% bImg = rgb2gray(a);
% [c,d] = componentes_color(a);
% [e] = filtros(bImg);
% figure(1); imshow(c);
% % figure(2); imshow(d);
% % figure(3); imshow(e);
% % 
% % level=graythresh(b);
% % 
% % BW=im2bw(b,level);
% 
% % e = impixel;
% % em = min(e(:));
% 
% d(d < mean(d(:))) = 255; 
% d(d < 255) = 0;
% figure(4); imshow(d);
% 
% % se = strel('disk',5);
% % d = imclose(d, se);
% % d = imclearborder(d);
% [e] = elMayor(d);
% figure(5); imshow(e);
% 
% figure(6); imhist(d);
% 
% h = imresize(bImg, [15 15]);
% figure(7); imshow(7);
% 
% figure(4); imshow(BW);
% 
% figure(5); imhist(bImg);

% props = regionprops(b, 'all');
% 
% points = detectSURFFeatures(b);
% figure(6); imshow(b); hold on;
% plot(points);

% regions = detectMSERFeatures(b);
% imshow(b); hold on;
% plot(regions);