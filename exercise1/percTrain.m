%Calculate perceptron weight w for the training set (X; t)
%The training set's format is: The X(:,i) colums contain the i-th training
%example and t(i) contains the i-th target( class label in -1/+1 coding).
%maxEpoches is the maximal number of training epochs.
function [w] = percTrain(X,t, maxEpoches, online)

    
    % add bias
    b = ones(size(X,1),1);
    X = [b X]';
    t = t';

    %initialize w, gamma
    w = zeros(size(X,1),1);%w_i = 0, i = 1:d+1     
    gamma = 1;
    %train
    wd = 0;
    for epoch = 1:maxEpoches
        for i = 1:size(t,2)%1:N
            if w'*(X(:,i)*t(i)) <= 0 %if i-th pattern is misclassified
                wd = wd + gamma*X(:,i)*t(i);
            end
            if online
                 w = w + wd;
                 wd = 0;
            end
        end
        if online ~= 1
            w = w +wd;
            wd = 0;
        end
    end
end