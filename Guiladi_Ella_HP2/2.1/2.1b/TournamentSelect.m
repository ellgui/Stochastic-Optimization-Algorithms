function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)

populationSize = size(fitness,1);
tempCandidate=zeros(tournamentSize,2);

for i=1:tournamentSize
    tempCandidate(i,2) = 1 + fix(rand*populationSize);
    tempCandidate(i,1) = fitness(tempCandidate(i,2));
end

tempCandidate = sortrows(tempCandidate(),'descend');
r=rand;
iSelected = 0;

while iSelected==0
    if r < pTournament
    iSelected = tempCandidate(1,2);
    
    elseif length(tempCandidate(:,1)) > 1
        tempCandidate=tempCandidate(2,:);
        r=rand;
    else
        iSelected=tempCandidate(1,2); %else get the worst 
    end
end
end
