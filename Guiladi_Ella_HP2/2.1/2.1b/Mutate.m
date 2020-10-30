function mutatedChromosome=Mutate(chromosome,mutationProbability)

nGenes = size(chromosome,2);
mutatedChromosome = chromosome;

for j = 1:nGenes
    r = rand;
    if (r < mutationProbability)
        generatedIndex=randi(nGenes);
        newChromosome1= mutatedChromosome(j);
        newChromosome2= mutatedChromosome(generatedIndex);

        mutatedChromosome(generatedIndex)=newChromosome1;
        mutatedChromosome(j)=newChromosome2;
      
    end
end
end




