%Calculate perceptron weight w for the training set (X; t)
%The training set's format is: The X(:,i) colums contain the i-th training
%example and t(i) contains the i-th target( class label in -1/+1 coding).
%maxEpoches is the maximal number of training epochs.
function [w] = perco(X,t, maxEpoches)

    %initialize w, gamma
    w = zeros(size(X,1),1);%w_i = 0, i = 1:d+1 (or 0:d as in slides)
    
    %has no influence on decision boundary(slide 49 in EFME_VI)
    %only here for the sake of completeness
    gamma = 1;
    
    
    %train
    for epoch = 1:maxEpoches
        for i = 1:size(t,2)%1:N
            if w'*(X(:,i)*t(i)) <= 0 %if i-th pattern is misclassified
                w = w + gamma*X(:,i)*t(i);
            end
        end
    end
end