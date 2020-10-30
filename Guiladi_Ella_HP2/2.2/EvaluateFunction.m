function objectiveFunction=EvaluateFunction(positions)

x=positions(1);
y=positions(2);
objectiveFunction=(x^2+y-11)^2+(x+y^2-7)^2;
end
