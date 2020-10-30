function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

numberOfNodes = size(pheromoneLevel,1);
path = zeros(1, numberOfNodes);
tabuList = zeros(1,numberOfNodes);
probabilityParameters = CalculateProbabilityParameters(numberOfNodes,pheromoneLevel,visibility,alpha,beta);
startingNode = randi(numberOfNodes);
tabuList(startingNode) = 1;
path(1) = startingNode;

for i = 2:numberOfNodes
    actualNode = path(i-1);
    getNextNode = RouletteWheelSelection(tabuList,probabilityParameters,actualNode,numberOfNodes);
    path(i) = getNextNode;
    tabuList(getNextNode) = 1; %1 if the node is in the tabuList
end
end



