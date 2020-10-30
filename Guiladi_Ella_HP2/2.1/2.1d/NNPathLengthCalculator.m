clear all
clc

cityLocation = LoadCityLocations();
numberOfCities=size(cityLocation,1);
startingCity=InitializeRandomCity(numberOfCities);
nearestNeighbourPathLength=0;

originCity=startingCity;
originCityLocation=cityLocation;
tabuList=[];
counter=1;

while (size(tabuList,1)+1< numberOfCities)
    routeLength=[];
    
    for i=1:(numberOfCities-size(tabuList,1))
        routeLength(i,:)=[pdist2(cityLocation(startingCity,:),cityLocation(i,:)),cityLocation(i,:)]; 
    end
    
    tabuList(counter,:)= startingCity;
    cityLocation(startingCity,:)=[];
    
    counter=counter+1;
    
    routeLengthAscending=sortrows(routeLength);
    shortestRouteLength=routeLengthAscending(2,1);

    [row,column]=find(cityLocation(:,1)==routeLengthAscending(2,2)); %in order to find next node
    
    startingCity=row; %new starting city
    
    nearestNeighbourPathLength=shortestRouteLength+nearestNeighbourPathLength;
    
end
%go back to startpoint
nearestNeighbourPathLength=nearestNeighbourPathLength+pdist2(originCityLocation(originCity,:),cityLocation(1,:)); 

disp('Nearest neighbourhood pathlength is:')
disp(nearestNeighbourPathLength)

