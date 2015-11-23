subplot(1,1,1);%for setting subplotting to one plot again

%AND problem
for i = 1:10
    figure(1);
    X = [1,1,1,1;0,0,1,1;0,1,0,1];
    o = [-1,-1,-1,1];
    w = perco(X,o,i);

    g = @(x,y) w(1)+w(2)*x+w(3)*y;

    ezplot(g,[-1,2,-1,2]);
    hold on;
    gscatter(X(2,:),X(3,:),o);
    hold off;
    title(['AND-Problem perceptron with ', num2str(i), ' epoches']);
    pause(.25);
end
%OR problem
for i = 1:10
    figure(2);
    X = [1,1,1,1;0,0,1,1;0,1,0,1];
    o = [-1,1,1,1];
    w = perco(X,o,i);

    g = @(x,y) w(1)+w(2)*x+w(3)*y;

    ezplot(g,[-1,2,-1,2]);
    hold on;
    gscatter(X(2,:),X(3,:),o);
    hold off;
    title(['OR-Problem perceptron with ', num2str(i), ' epoches']);
    pause(.25);
end
%XOR problem (perco always returns w = 0 0 0)
for i = 1:10
    figure(3);
    X = [1,1,1,1;0,0,1,1;0,1,0,1];
    o = [-1,1,1,-1];
    w = perco(X,o,i);

    g = @(x,y) w(1)+w(2)*x+w(3)*y;

    ezplot(g,[-1,2,-1,2]);
    hold on;
    gscatter(X(2,:),X(3,:),o);
    hold off;
    title(['XOR-Problem perceptron with ', num2str(i), ' epoches']);
    pause(.25);
end

%Load INPUT vectors
inputs = load('perceptrondata.dat')';%transpose because .dat samples are saved as rows
X = [ones(1,size(inputs,2));inputs];%convert to homogenous coordinates

%load classlabels/targets and convert encoding from 0/1 to -1/1
%t1 = (t1_1, t1_2, ... t1_N), t1_i el. {1, -1}
t1 = load('perceptrontarget1.dat')'*2 - 1;
t2 = load('perceptrontarget2.dat')'*2 - 1;

for i = 1:10
    %train perceptrons
    w1 = perco(X,t1,i);
    w2 = perco(X,t2,i);

    %decisionboundary functions
    g1 = @(x,y) w1(1)+w1(2)*x+w1(3)*y;
    g2 = @(x,y) w2(1)+w2(2)*x+w2(3)*y;

    %plot classmemberships of training points for both t1 and t2
    figure(4);title('test');
    subplot(2,1,1);
    ezplot(g1,[0,1,0,1]); hold on;
    gscatter(X(2,:),X(3,:),t1); hold off
    title(['First set with ', num2str(i),' epoches']);
    subplot(2,1,2);
    ezplot(g2,[0,1,0,1]); hold on;
    gscatter(X(2,:),X(3,:),t2); hold off;
    title(['Second set with ', num2str(i),' epoches']);
    pause(0.25);
end