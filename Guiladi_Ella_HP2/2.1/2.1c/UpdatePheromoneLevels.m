function pheromoneLevelNew = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);

pheromoneLevelNew=(1-rho)*pheromoneLevel+deltaPheromoneLevel;

end