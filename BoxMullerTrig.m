function [y1,y2] = BoxMullerTrig(x1,x2)
% Transforms a bivariate uniform random variable in [0,1] x [0,1] to a
% bivariate normally distributed variable.
if nargin~=2
    error('Two input arguments needed.')
elseif x1<0 || x1>1 || x2<0 || x2 >1
    error('Input arguments must be in [0,1].')
end
y1 = sqrt( - 2 * log(x1) ) * cos( 2 * pi * x2 );
y2 = sqrt( - 2 * log(x1) ) * sin( 2 * pi * x2 );
end