function updateVelocities=UpdateVelocities(velocities,positions,positionOfBestParticle,globalBestPositionParticle,c1,c2,vMax,inertiaWeight,deltaTime)

numberOfParticles=size(positions,1);
numberOfVariables=size(positions,2);
updateVelocities=zeros(numberOfParticles,numberOfVariables);

for i=1:numberOfParticles
    for j=1:numberOfVariables
        r=rand;
        q=rand;
        cognitiveComponent=c1*q*((positionOfBestParticle(i,j)-positions(i,j))/deltaTime);
        socialComponent=c2*r*((globalBestPositionParticle(j)-positions(i,j))/deltaTime);
        
        updateVelocities(i,j)=inertiaWeight*velocities(i,j)+cognitiveComponent+socialComponent;
        
    end
end
end
