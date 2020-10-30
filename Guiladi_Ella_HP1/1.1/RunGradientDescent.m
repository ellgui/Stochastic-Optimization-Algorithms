function runGradient=RunGradientDescent(startPoint, my, stepLength, threshold)
iterationCount = 1; 
matrixWithValues(1,:)= startPoint; 
normcomputeGradient=1;

while normcomputeGradient > threshold
    computeGradient = ComputeGradient(matrixWithValues(iterationCount,1),matrixWithValues(iterationCount,2),my);
    matrixWithValues(iterationCount+1,:) = matrixWithValues(iterationCount,:)-(stepLength.*computeGradient);
    normcomputeGradient=norm(computeGradient);
    iterationCount = iterationCount+1;
    
end

runGradient=[my,matrixWithValues(iterationCount,1),matrixWithValues(iterationCount,2)];

end

