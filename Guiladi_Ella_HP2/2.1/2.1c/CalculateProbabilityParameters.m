function probabilityParameters = CalculateProbabilityParameters(numberOfNodes, pheromoneLevel, visibility,alpha,beta)

probabilityParameters = zeros(numberOfNodes);

for k = 1:numberOfNodes
    for m = 1:numberOfNodes
        pheromoneParameter = pheromoneLevel(k,m);
        visibilityParameter = visibility(k,m);
        probabilityNumerator = pheromoneParameter^alpha * visibilityParameter^beta;
        probabilityParameters(k,m) = probabilityNumerator;
    end
end
end