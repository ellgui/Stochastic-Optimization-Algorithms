function velocities=InitializeVelocities(xMin,xMax,alpha,deltaTime,numberOfParticles,numberOfVariables)

velocities=zeros(numberOfParticles,numberOfVariables);

for i=1:numberOfParticles
    for j=1:numberOfVariables
    r=rand;
    velocities(i,j)= (alpha/deltaTime)*(-(xMax-xMin)/2+r*(xMax-xMin));
    end
end
end