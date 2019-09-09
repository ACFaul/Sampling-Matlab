target_mean = [2 3];
target_variance = [1 1.5; 1.5 3];
% Create function handle to unnormalized probability density.
target = @(x) exp(-0.5*(x-target_mean)/target_variance * ...
    (x-target_mean)');

% The variances of the components are given by the eigenvalues 
% of the variance matrix.
e = eig(target_variance);
figure;
hold on;

% Set variance of the proposal distribution to the identity matrix 
% times the smallest variance of the target distribution.
proposal_variance = e(1) * eye(2);

N = 300; % Length of Markov chain.

% Set first element of the Markov chain.
start = target_mean;
samples = target_mean;
% Evaluate the target distribution for the last element.
last = feval(target,start);
counter = [1];
total = 1;
accepted = 1;
while total < N
   % Generate candidate from normal distribution with mean 
   % samples(accepted) and variance proposal_variance.
   candidate = mvnrnd(samples(accepted,:), proposal_variance);
   %  Evaluate the target distribution for the candidate.
   new =  feval(target,candidate);
   % Evaluate acceptance probability.
   accept = min(1, new/last);
   if accept > rand
       % Draw random walk.
       line([samples(accepted,1) candidate(1)],...
           [samples(accepted,2) candidate(2)],...
           'Color','k');
       % Update Markov chain.
       samples = [samples; candidate];
       counter = [counter; 1];
       accepted = accepted +1;
       % Update evaluation of target distribution for the last element.
       last = new;
   else
       % Plot rejected candidate.
       plot(candidate(1), candidate(2),'k+');
       % Update counter for this state.
       counter(accepted) = counter(accepted)+1;
   end
   total = total +1;
end
% Calculate acceptance rate.
rate = accepted/total
axis equal
