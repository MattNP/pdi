nMC = 20;
nMT = nMC*10;
trafficTargets = zeros(10, nMT);
for i=1:10
    trafficTargets(i,nMC*i-(nMC-1):i*nMC) = 1;
end
