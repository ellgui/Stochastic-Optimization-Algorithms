function fitnessFunction = EvaluateIndividual(x)

evalutedFunction1 = (1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*x(1)^2-14*x(2)+6*x(1)*x(2)+3*x(2)^2));
evalutedFunction2 = (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*x(1)^2+48*x(2)-36*x(1)*x(2)+27*x(2)^2));

fitnessFunction = 1/(evalutedFunction1*evalutedFunction2);
end

