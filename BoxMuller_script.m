% Usage example for BoxMullerTrig.
% Generates N normally distributed bivariate variables and displays 
% the scatter plot.
N = 1000;
Y = BoxMuller(N);
figure;
scatter(Y(:,1),Y(:,2),'.');
axis equal;
    