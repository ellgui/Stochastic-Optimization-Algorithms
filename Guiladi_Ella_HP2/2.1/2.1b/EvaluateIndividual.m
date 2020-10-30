function fitnessFunction= EvaluateIndividual(individual,cityLocation)

fitnessFunction=[];

tempIndividual=[individual, individual(1)]; 
modifiedPath=(length(tempIndividual)-1);
totalDistance=0;

for j=1:modifiedPath
    location1=tempIndividual(j);
    location2=tempIndividual(j+1);
    
    coordinateX1=cityLocation(location1,1);
    coordinateY1=cityLocation(location1,2);
    coordinateX2=cityLocation(location2,1);
    coordinateY2=cityLocation(location2,2);
    
    cartesianDistance=sqrt((coordinateX2-coordinateX1)^2+(coordinateY2- coordinateY1)^2);
    
    totalDistance=cartesianDistance+totalDistance;
end 

fitnessFunction=1/totalDistance;

end
