function population=InitializePopulation(populationSize, nCities)

population = zeros(populationSize, nCities);

for j=1:populationSize
    path = randperm(nCities);   
    population(j,:)= path;
end
end
