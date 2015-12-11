%Create at least 2 linear separateable Datasets and plot them

mean1 = [-3 0];
cov1 = [1 0; 0 10];
mean2 = [3 0];
cov2 = [1 0; 0 10];

[data1, target1] = genData (100, 2, 0.1, 1, mean1, cov1, mean2, cov2);
plotDataSets(data1, target1, 'Simple Seperateable DataSets');


mean1 = [0 0];
cov1 = [1 0; 0 1];
mean2 = [0 0];
cov2 = [1 0; 0 1];

[data2, target2] = genData (100, 2, 0.1, 1, mean1, cov1, mean2, cov2);
plotDataSets(data2, target2, 'Seperateable DataSets although the mean and covariances are equal');


mean1 = [-3 0];
cov1 = [3 2; 2 10];
mean2 = [3 0];
cov2 = [3 -2; -2 10];

[data3, target3] = genData (100, 2, 0.1, 0, mean1, cov1, mean2, cov2);
plotDataSets(data3, target3, 'Non-Seperateable DataSets');