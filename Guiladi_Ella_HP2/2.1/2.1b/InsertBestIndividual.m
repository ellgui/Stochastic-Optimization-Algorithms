function bestOfIndividuals=InsertBestIndividual(population, bestIndividual, numberOfCopiesOfBestIndividual)

bestOfIndividuals=population;
for j =1:numberOfCopiesOfBestIndividual
   bestOfIndividuals(j,:) = bestIndividual;
end