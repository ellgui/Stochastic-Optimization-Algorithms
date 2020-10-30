clear all
clc
format long

xMin=-5;
xMax=5;
deltaTime=1;
vMax=(xMax-xMin)/deltaTime;
numberOfParticles=30;
numberOfVariables=2;
alpha = 1;
c1 = 2;
c2 = 2;
numberOfIterations=100;
a=0.01;
initialInertiaWeight = 1.4;
lowerBoundInertiaWeight = 0.4;
beta = 0.97;

%plot minimum of function
coordinates = linspace(-5,5);
[X, Y] = meshgrid(coordinates, coordinates);
Z = log(a + (X.^2+Y-11).^2+(X+Y.^2-7).^2);

figure
contour(X, Y, Z,60)
hold on;

%initializing particles and velocities
positions=InitializePositions(xMin,xMax,numberOfParticles,numberOfVariables);
velocities=InitializeVelocities(xMin,xMax,alpha,deltaTime,numberOfParticles,numberOfVariables);


functionValueOfParticle=zeros(numberOfParticles,1);

functionValueOfBestParticle=zeros(numberOfParticles, 1);
positionOfBestParticle=zeros(numberOfParticles,numberOfVariables);

functionValueGlobalParticle=zeros(numberOfParticles,numberOfVariables);
positionOfGlobalBestParticle=zeros(1,2);

%initialize initial inertia weight in order to reduce it in each iteration
inertiaWeight=initialInertiaWeight;


for i=1:numberOfIterations
    
    for j=1:numberOfParticles
        particles = positions(j,:);
        functionValueOfParticle= EvaluateFunction(particles);
        functionValueOfBestParticle=EvaluateFunction(positionOfBestParticle(j,:));
        functionValueGlobalParticle=EvaluateFunction(positionOfGlobalBestParticle);
        
        %update xpb
        if functionValueOfParticle < functionValueOfBestParticle
            positionOfBestParticle(j,:)=particles;
        end
        
        %update xsb
        if functionValueOfParticle < functionValueGlobalParticle
            positionOfGlobalBestParticle = particles;
        end
    end
    
    %update velocities and positions
    positions=UpdatePositions(positions,velocities,deltaTime);
    velocities=UpdateVelocities(velocities,positions,positionOfBestParticle,positionOfGlobalBestParticle,c1,c2,vMax,inertiaWeight,deltaTime);
    
    for k=1:numberOfParticles
        for l=1:numberOfVariables
            if velocities(k,l) > vMax
                velocities(k,l) = vMax;
            elseif velocities(k,l)< -vMax
                velocities(k,l) = -vMax;
            end
        end
    end
    
    
    %update inertia weigths
    inertiaWeight=UpdateInertiaWeigths(inertiaWeight,beta,lowerBoundInertiaWeight);
   
end
disp('Positions of the global best particle:')
disp(positionOfGlobalBestParticle)
disp('Functionvalue of the global best particle:')
disp(functionValueGlobalParticle)


scatter(positionOfGlobalBestParticle(1),positionOfGlobalBestParticle(2),'o', 'MarkerFaceColor', 'r')
hold off
     
        
     