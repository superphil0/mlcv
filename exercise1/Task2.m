
mean1 = [-3 0];
cov1 = [1 0; 0 10];
mean2 = [3 0];
cov2 = [1 0; 0 10];

[data, target] = genData (100, 2, 1, 1, mean1, cov1, mean2, cov2);

[test, testTarget] = genData (10, 2, 1, 1, mean1, cov1, mean2, cov2);

disp('100% on train data Set');


correct = 0;

for i = 1:size(test,1)
    y = memory(data,target, test(i,:));
    if y == testTarget(i)
        correct = correct + 1;
    end;
end;

s = '%';
fprintf('%f%s on test data Set', correct / size(test,1) * 100,s);