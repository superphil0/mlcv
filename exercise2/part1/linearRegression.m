function w = linearRegression(x, y, w, gamma, N)
    x_plot = [];
    y_plot = [];
    for i = 1:N
        for idx = 1:size(x,1)
            x_i = x(idx,:);
            y_i = y(idx);
            delta = -(y_i - w*x_i')* x_i;
            w = w - gamma * delta;
        end
        x_plot(i) = i;
        cost = 0.5 * sum((y - w*x') .^2);
        y_plot(i) = cost;
    end
    
    plot(x_plot,y_plot);
    legend('weight');
    title('Weight function');
    xlabel('iteration t') % x-axis label
    ylabel('weight(t)') % y-axis label
end