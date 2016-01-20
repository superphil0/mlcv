x = [0:0.1:5];
y = 2*x.^2 + 5*x + 1;

xtrain = x(1:6:51); 
ytrain = [];

for t = y(1:6:51)
    ytrain = [ytrain, t + normrnd(0, 0.7)];
end

xtrain = [xtrain', xtrain', xtrain'] .^ repmat([0, 1 , 2], size(xtrain,2),1);

w = zeros(1, size(xtrain,2));
gamma = 0.001;
nrIterations = 10000;

w = linearRegression(xtrain, ytrain, w, gamma, nrIterations);

w_exact = ((pinv(xtrain*xtrain')*xtrain)'*ytrain')';

w
w_exact
figure;
plotLinearRegression(x,y,w, 'Gradient Descent');
figure;
plotLinearRegression(x,y,w_exact, 'Optimal Weight Vector');