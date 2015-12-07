
mean1 = [-3 0];
cov1 = [1 0; 0 10];
mean2 = [3 0];
cov2 = [1 0; 0 10];

[data, target] = genData (100, 2, 1, 1, mean1, cov1, mean2, cov2);

y = memory(data,target, [0,0]);

y