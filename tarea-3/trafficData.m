

% trafficTargets = zeros(10, 100);
% for i=1:10
%     trafficTargets(i,10*i-9:i*10) = 1;
% end

nMC = 20;
nMT = nMC*10;
trafficTargets = zeros(10, nMT);
for i=1:10
    trafficTargets(i,nMC*i-(nMC-1):i*nMC) = 1;
end

% 1:10
% 11:20
% 21:30
% 31:40