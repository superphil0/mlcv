function plotLinearRegression(x,y,weight, ptitle) 
    x = [x', x', x'] .^ repmat([0, 1 , 2], size(x,2),1);
    plot(1:size(y,2), x*weight', 'r.-', 1:size(y,2), y, 'bx-');
    legend('o(x)', 't', 'Location', 'northwest');
    title(ptitle);
    xlabel('testsamples') % x-axis label
    ylabel('calculated and real values') % y-axis label