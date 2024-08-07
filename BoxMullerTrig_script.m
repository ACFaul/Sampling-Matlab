% Usage example for BoxMullerTrig.
% Generates N normally distributed bivariate variables and displays 
% the scatter plot.
N = 1000;
Y= zeros(N,2);
for n=1:N
    x1 = rand;
    x2 = rand;
    [Y(n,1),Y(n,2)] = BoxMullerTrig(x1,x2);
end
figure;
scatter(Y(:,1),Y(:,2),'.');
axis equal;
    