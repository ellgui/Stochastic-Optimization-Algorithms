clear all
clc

cityLocation = LoadCityLocations;
nCities = size(cityLocation,1);

populationSize = 100;
mutationProbability=1/nCities;
tournamentSelectionParameter = 0.75;
numberOfCopiesOfBestIndividual = 1;
numberOfGenerations = 5000;
tournamentSize=2;

tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]);
connection = InitializeConnections(cityLocation);

maximumFitness =0.0; 
population = InitializePopulation(populationSize, nCities);

for iGeneration=1:numberOfGenerations
    
    fitness = zeros(populationSize,1);
    for i = 1:populationSize
        fitness(i) = EvaluateIndividual(population(i,:), cityLocation);
    end
    
    tempPopulation = population;
    
    %2.Selection
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter, tournamentSize);
        
        chromosome1 = population(i1, :);
        chromosome2 = population(i2, :);
        
        tempPopulation(i, :) = chromosome1;
        tempPopulation(i + 1, :) = chromosome2;
    end
    
    %3.Mutation
    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    %5.Elitism
    for i = 1:populationSize
        if (fitness(i) > maximumFitness)
            bestIndividual = population(i,:);
            maximumFitness = fitness(i);
           PlotPath(connection,cityLocation,bestIndividual);
        end
    end
        
    %Replacement
    population = InsertBestIndividual(tempPopulation, bestIndividual, numberOfCopiesOfBestIndividual);

end

disp('Shortest path length')
disp(1/maximumFitness)
