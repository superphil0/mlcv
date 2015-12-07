%Calculate perceptron weight w for the training set (X; t)
%The training set's format is: The X(:,i) colums contain the i-th training
%example and t(i) contains the i-th target( class label in -1/+1 coding).
%maxEpoches is the maximal number of training epochs.
function [y] = perc(w, x)
    y = sign(w'*x);
end