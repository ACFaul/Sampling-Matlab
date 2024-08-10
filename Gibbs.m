target_mean = [2 3];
target_variance = [1 1.5; 1.5 3];
figure;
plotconell( target_mean, target_variance, 0.95 )
hold on;

N = 300; % Length of Markov chain.

% Set first element of the Markov chain.
samples(1,1) = target_mean(1);
samples(1,2) = target_mean(2);
for total = 2:N
    if mod(total,2)
        x = normrnd((samples(total-1,2))/2 + 1/2, 1/2);
        samples(total,1) = x;
        samples(total, 2) = samples(total-1,2);
    else
        y = normrnd(samples(total-1,1)/2,sqrt(3)/2);
        samples(total,1) = samples(total-1,1);
        samples(total,2) = y + 2;
    end
    % Draw random walk.
    line([samples(total-1,1) samples(total,1)],...
           [samples(total-1,2) samples(total,2)],...
           'Color','k');
end
axis equal
