function updateInertiaWeigths=UpdateInertiaWeigths(inertiaWeight,beta,lowerBoundInertiaWeight)

updateInertiaWeigths=max(inertiaWeight*beta,lowerBoundInertiaWeight); 

end