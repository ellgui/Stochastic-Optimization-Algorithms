function getNode = RouletteWheelSelection(tabuList,probabilityParameters, actualNode,numberOfNodes)

probabilities = ProbabilityOfNextNode(tabuList,probabilityParameters, actualNode,numberOfNodes);
r = rand;
totalFitness=sum(probabilities);

for i = 1:length(probabilities)
    eachFitness=sum(probabilities(1:i));
    cumulativeRelativeFitnessValue=eachFitness/totalFitness;
    if cumulativeRelativeFitnessValue > r
        output=i;
        break
    end
end
getNode=output;
end
