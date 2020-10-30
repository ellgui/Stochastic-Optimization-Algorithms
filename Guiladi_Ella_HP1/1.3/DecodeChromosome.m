function x = DecodeChromosome(chromosome,numberVariables,variableRange)

chromosomeLength =  length(chromosome);
kBits = chromosomeLength/numberVariables;

  for i = 1:numberVariables
      x(i) = 0.0;
      for j = 1:kBits
          x(i) = x(i)+chromosome(j+kBits*(i-1))*2^(-j); 
      end
      x(i) = -variableRange + 2*variableRange*x(i) / (1-2^(-kBits));
  end
 
