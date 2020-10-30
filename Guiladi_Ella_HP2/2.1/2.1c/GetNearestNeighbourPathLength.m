function nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation)

cityLocation = LoadCityLocations();
numberOfCities=size(cityLocation,1);
startingCity=randi(numberOfCities);
nearestNeighbourPathLength=0;

originCity=startingCity;
originCityLocation=cityLocation;
tabuList=[];
routeLength=[];
counter=1;

while (size(tabuList,1)+1< numberOfCities)
    routeLength=[];
    
    for i=1:(numberOfCities-size(tabuList,1))
        routeLength(i,:)=[pdist2(cityLocation(startingCity,:),cityLocation(i,:)) cityLocation(i,:)];
    end
    
    tabuList(counter,:)= startingCity;
    cityLocation(startingCity,:)=[];
    
    routeLengthAscending=sortrows(routeLength);
    shortestRouteLength=routeLengthAscending(2,1);
    
    [row,column]=find(cityLocation==routeLengthAscending(2,2));
    
    startingCity=row;;
    
    counter=counter+1;
    
    nearestNeighbourPathLength=shortestRouteLength+nearestNeighbourPathLength;
    
end

nearestNeighbourPathLength=nearestNeighbourPathLength+pdist2(originCityLocation(originCity,:),cityLocation(1,:)); 

end