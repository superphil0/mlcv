x = [0:0.1:5];
y = 2*x.^2 + 5*x + 1;

xtrain = x(1:6:51); 
ytrain = [];

for t = y(1:6:51)
    ytrain = [ytrain, t + normrnd(0, 0.7)];
end

xtrain = [xtrain', xtrain', xtrain'] .^ repmat([0, 1 , 2], size(xtrain,2),1);

w = zeros(1, size(xtrain,2));
gammas = [1, 0.01, 0.005, 0.001, 0.0001];
nrIterations = 10000;

for gamma = gammas
    w = linearRegression(xtrain, ytrain, w, gamma, nrIterations);

    figure;
    plotLinearRegression(x,y,w, sprintf('Gradient Descent with gamma: %f',gamma));
    figure;
end
w_exact = ((pinv(xtrain*xtrain')*xtrain)'*ytrain')';
figure;
plotLinearRegression(x,y,w_exact, 'Optimal Weight Vector');