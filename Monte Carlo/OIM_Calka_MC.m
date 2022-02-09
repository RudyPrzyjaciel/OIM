close;
clear;

%number of points for integral
N = 2^13;

%symbolic function declaration
f = @(x) (1/sqrt(2*pi)) * exp(-((x.^2)/2));

%creating linspace in integral borders
ft = 0:3/(N-1):3;

%surface of rectangle set by integral borders
surf = 3 * 1/2;

%creating matrix of (X, Y, iFlag), further iFlag == 1 if Y <= f(X)
Points = 1/2 * rand(2, N); 
Points = [Points;zeros(1, N)];

%checking each point and setting iFlag to 1 where needed
for i = 1:N
    Points(1, i) = 6 * Points(1, i);
    if Points(2,i) <= f(Points(1,i))
        Points(3, i) = 1;
    end
end

%counting how many points are in integral zone
ptsUnder = sum(Points(3,:));

%estimating integral value
solution = (ptsUnder/N) * surf;

%calculating real integral value for comparison
sIntegral = integral(f,0,3);

%plotting function, points, calculated values and error of estimation 
plot(Points(1,:),Points(2,:), 'g.', ft, f(ft), 'r');
title("MC = [" + solution + "] Integral = [" + sIntegral + "] Błąd: [" + ...
   (100 -(solution/sIntegral)*100) + "%]");

%changing axis and grid for better visibility
axis([-0.1 3.1 -0.1 0.6]);
grid on;
