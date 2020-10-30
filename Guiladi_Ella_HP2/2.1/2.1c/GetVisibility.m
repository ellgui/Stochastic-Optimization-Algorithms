function visibility = GetVisibility(cityLocation)

numberOfCities = length(cityLocation);
visibility = zeros(numberOfCities,numberOfCities);

for i=1:numberOfCities
    for j=1:numberOfCities
        if i==j
        visibility(i,j)=0;
        else
        distance=pdist2(cityLocation(i,:),cityLocation(j,:));
        visibility(i,j) = 1/distance;
        end
    end
end







