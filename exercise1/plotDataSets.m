function plotDataSets(data, target, name)

figure('name', name);
plot(data(target==-1, 1), data(target==-1, 2), '.r');
hold on;
plot(data(target==1, 1), data(target==1, 2), '.g');
axis equal;

end

