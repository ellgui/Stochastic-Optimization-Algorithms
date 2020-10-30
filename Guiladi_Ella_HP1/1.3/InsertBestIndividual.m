function bestOfIndividuals=InsertBestIndividual(population, bestIndividual, nrCopiesOfBestIndividuals)
%replace random copy with best chromsome
bestOfIndividuals=population;
for j =1:nrCopiesOfBestIndividuals
   bestOfIndividuals(j,:) = bestIndividual;
end