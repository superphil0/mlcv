% data sets in data{1,2,3}
    
data = {data1, data2, data3};
targets = {target1, target2, target3};
epoches = 10;
for i = 1:3
    for j = 1:epoches
        X = data{i};
        t = targets{i};
        w = percTrain(X, t, j,1);
        b = ones(size(X,1),1);
        X = [b X]';

        t1 = perc(w, X);
        figure(1);
        g = @(x,y) w(1)+w(2)*x+w(3)*y;    
        ezplot(g,[-5,5,-5,5]);   
        hold on;    
        gscatter(X(2,:),X(3,:),t);    
        hold off;
        title(['Problem ', num2str(i), ' - perceptron with ', num2str(j),' epoches']);
        pause(.25);
    end
    w = waitforbuttonpress;
end