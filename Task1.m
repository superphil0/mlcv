%Create at least 2 linear separateable Datasets and plot them

mean1 = [-3 0];
cov1 = [1 0; 0 10];
mean2 = [3 0];
cov2 = [1 0; 0 10];

[data, target] = genData (100, 2, 1, 1, mean1, cov1, mean2, cov2);
plotDataSets(data, target, 'Simple Seperateable DataSets');


mean1 = [0 0];
cov1 = [1 0; 0 1];
mean2 = [0 0];
cov2 = [1 0; 0 1];

[data, target] = genData (100, 2, 1, 1, mean1, cov1, mean2, cov2);
plotDataSets(data, target, 'Seperateable DataSets although the mean and covariances are equal');


mean1 = [-3 0];
cov1 = [3 2; 2 10];
mean2 = [3 0];
cov2 = [3 -2; -2 10];

[data, target] = genData (100, 2, 1, 0, mean1, cov1, mean2, cov2);
plotDataSets(data, target, 'Non-Seperateable DataSets');