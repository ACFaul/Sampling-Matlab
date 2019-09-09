function Y = BoxMuller(N)
% Generates N bivariate normally distributed variables avoiding the 
% use of the trigonometric functions.
Y = zeros(N,2);
for n = 1:N
    w = 1;
    % Generate random number within the unit circle.
    while w >= 1
        x1 = 2.0 * rand - 1.0;
        x2 = 2.0 * rand - 1.0;
        w = x1 * x1 + x2 * x2;
    end
    w = sqrt( (-2.0 * log( w ) ) / w );
    Y(n,1) = x1 * w;
    Y(n,2) = x2 * w;
end