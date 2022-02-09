clear;
close;

N = 2^20; %number of points for Monte Carlo method

% d = 3; %dimentions
p = 2; %p factor
r = 1; %radius of `sphere` and `cube`

maxD = 20;
VofD = zeros(1,maxD);

for d = 1:maxD
    MCPoints = 2 * rand(d, N) - 1; %generating points in `cube`
    MCPoints = [MCPoints;zeros(1,N)];
    cubeV = (2*r).^d;
    
    for j = 1:N   
        norma = 0; 
        for i=1:d
            norma = norma + (abs(MCPoints(i, j))).^(p);
        end 
        norma = norma.^(1/p);
        if norma <= r
            MCPoints(end, j) = 1;
        end
    end
    
    ptsSphere = sum(MCPoints(end, :));
    
    VofD(1,d) = (ptsSphere/N) * cubeV;

    MCPoints = [];
end

figure(1)
plot(1:maxD,VofD);
title("p = " + p);
xlabel("d");
ylabel("Objetosc 'kuli'");
grid on;
