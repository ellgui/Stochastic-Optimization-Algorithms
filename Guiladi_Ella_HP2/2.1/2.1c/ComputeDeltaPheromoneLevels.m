function  deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

numberOfNodes=size(pathCollection,2);
numberOfAnts=size(pathCollection,1);

deltaPheromoneLevel=zeros(numberOfNodes);

for k=1:numberOfAnts
    pheromoneLevel=1/pathLengthCollection(k);
    
    for l=1:numberOfNodes-1
        
        firstNode=pathCollection(k,l);
        endNode=pathCollection(k,l+1);
        
        %add pheromone level to existing pheromone level
        deltaPheromoneLevel(firstNode,endNode)=deltaPheromoneLevel(firstNode,endNode)+pheromoneLevel;
    end
    
    firstNode = pathCollection(k, 1);
    endNode = pathCollection(k, end);
    
    deltaPheromoneLevel(firstNode,endNode)=deltaPheromoneLevel(firstNode,endNode)+pheromoneLevel;
end
end