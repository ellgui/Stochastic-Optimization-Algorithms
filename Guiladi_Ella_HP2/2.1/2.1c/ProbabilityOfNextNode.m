function probabilities = ProbabilityOfNextNode(tabuList,probabilityParameters, actualNode,numberOfNodes)

indexNextNode = actualNode;
pathPossibilities = zeros(1,numberOfNodes);
    
for i = 1:numberOfNodes
    if tabuList(i)~= 1
        probability = probabilityParameters(i,indexNextNode);
        pathPossibilities(i) = probability; %new probability for each path
    end
end
sumOfProbability = sum(pathPossibilities);
probabilities = pathPossibilities/sumOfProbability;
end








