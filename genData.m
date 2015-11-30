function [ data, target ] = genData( n, d, stepwidth, separateable, mean1, cov1, mean2, cov2)
%GENDATA Summary of this function goes here
%   Detailed explanation goes here
% data soll n (Anzahl der Beobachtungen) * d (Dimension der
% Eingabevektoren) Matrix sein
% target: n-dimensionaler Vektor (-1, 1)
%
% n=100, d=2 -> 2 Klassen 50 Realisationen mit Diskretisierungsschrittweite
% e
% die 2 Klassen haben Mittelwerte und Kovarianzen
% 2 Klassen, jeweils 50 Realisationen

dist1 = repmat(mean1, n/2, 1) + randn(n/2, d) * chol(cov1);
dist2 = repmat(mean2, n/2, 1) + randn(n/2, d) * chol(cov2);

data = [dist1; dist2];

if (separateable)
    middle = (mean1 + mean2) / 2;
    direction = mean2 - mean1;
   %if the two mean-values are equal take the overall mean and the first main Eigenvector
    if norm(direction)==0 
        middle = mean(data, 1);
        coeff = princomp(data);
        direction=coeff(:,1)';
    end
    
    direction_normalized = direction / norm(direction);
    
    points_tmp = bsxfun(@minus, data, middle); % translate points, so that the middle value between the two distribution means lies on 0/0
    points_on_direction = points_tmp * direction_normalized'; % project the points on the direction vector
    target = sign(points_on_direction); %if a point is smaller zero, then it is before the middle, if >0 then after the middle

    last_shift=0;
    while sum(target==1) ~= n/2 || sum(target==-1) ~= n/2
%if there are not enough points on the left/right side, move the decision border
%to the left/right
        if (sum(target==-1) < n/2)
            if (last_shift > 0) %prohibit jumping over the same points over and over again
                stepwidth = stepwidth / 2;
            end
            points_on_direction = points_on_direction - stepwidth;
            target = sign(points_on_direction);
            last_shift=-1;
        else if (sum(target==1) < n/2) 
                if (last_shift < 0) %prohibit jumping over the same points over and over again
                    stepwidth = stepwidth / 2;
                end
                points_on_direction = points_on_direction + stepwidth;
                target = sign(points_on_direction); 
                last_shift=1;
            end
        end
    end
    
else
    target(1:n/2) = -1;
    target(n/2:n) = 1;
end

end