x = [0:0.1:5];
y = 2*x.^2 + 5*x + 1;

xtrain = x(1:6:51); 
ytrain = []

for t = y(1:6:51)
    ytrain = [ytrain, t + normrnd(0, 0.7)];
end
