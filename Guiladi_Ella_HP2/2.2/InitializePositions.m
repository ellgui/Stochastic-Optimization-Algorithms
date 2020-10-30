function positions=InitializePositions(xMin,xMax,numberOfParticles,numberOfVariables)

positions=zeros(numberOfParticles,numberOfVariables);

for i=1:numberOfParticles
    for j=1:numberOfVariables
    r=rand;
    positions(i,j)=xMin+r*(xMax-xMin);
    end
end
end