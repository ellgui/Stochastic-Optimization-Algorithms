function computeGradient=ComputeGradient(x1,x2,my)
inequalityConstraint = x1^2+x2^2-1;

if inequalityConstraint > 0
    derivativeOfx1=2*(x1-1)+4*my*x1*((x1)^2+(x2)^2-1);
    derivativeOfx2=4*(x2-2)+4*my*x2*((x1)^2+(x2)^2-1);
else
    derivativeOfx1=2*(x1-1);
    derivativeOfx2=4*(x2-2);
    
end

computeGradient=[derivativeOfx1, derivativeOfx2];

end


