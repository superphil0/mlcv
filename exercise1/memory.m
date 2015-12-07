function [ y ] = memory( data, target, x)
% memory Summary of this function
% if x is contained in data then output the corresponding target
% if not output -1

xSize = size(x,1);

y = -1;

for i = 1: size(data,1)
    if sum(data(i,:) == x) == xSize 
        y = target(i);
    end
end
