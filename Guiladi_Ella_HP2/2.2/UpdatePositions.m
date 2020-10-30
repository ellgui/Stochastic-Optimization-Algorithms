function updatePositions=UpdatePositions(positions,velocities,deltaTime)

numberOfParticles=size(positions,1);
numberOfVariables=size(positions,2);
updatePositions=zeros(numberOfParticles,numberOfVariables);

for i=1:numberOfParticles
    for j =1:numberOfVariables
        updatePositions(i,j)=positions(i,j)+velocities(i,j)*deltaTime;
    end
end
end
