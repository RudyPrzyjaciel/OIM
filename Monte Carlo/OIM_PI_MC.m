close;
clear;

%Creating square
squareX1 = -1;
squareX2 = 1;
squareY1 = -1;
squareY2 = 1;
sos = (squareX2 - squareX1) * (squareY2 - squareY1); %(surface of square)

squareX = [squareX1, squareX2, squareX2, squareX1, squareX1];
squareY = [squareY1, squareY1, squareY2, squareY2, squareY1];

circleR = 1;

% N = 2^16;
%range of number of points used for estimation N_max = 10^5
N = [10:10:100, 200:100:1000, 1200:200:3000]; 
bound = [-1, 1]; %bounds for rand function
% pi_est = []; %array for estimated values of pi
pi_est = zeros(3, numel(N));
for i = 1:numel(N)
    %generating N(i) points for pi calculations
    Points = rand(2, N(i)) * (bound(2) - bound(1)) + bound(1);
    Points(3,:) = zeros(); %flag array for points in circle

    for j = 1:N(i)
        d = sqrt((Points(1, j))^2 + (Points(2, j))^2);
        if d <= 1
            Points(3, j) = 1;
        end
    end
    %appending number of points N in iteration
    pi_est(1, i) = N(i);
    %estimating pi value
    pi_est(2, i) = sos * (sum(Points(3,:)./N(i)));
    %calculating error of estimation
    pi_est(3, i) = abs((pi - pi_est(2,i))); 
end

figure(1)
subplot(1, 3, 1)
plot(pi_est(1,:), pi_est(2,:), 'r');
title("Porownanie wartosci pi estymowanej z rzeczywista");
xlabel("Ilosc punktow");
ylabel('pi estymowane');
yline(pi,'-b', 'pi\_value');
axis([N(1),N(end), 2.5, 4]);
grid on;
pbaspect([1 1 1]);

subplot(1, 3, 2)
%Drawing points for last iteration
plot(Points(1,:), Points(2,:), '.g')
pbaspect([1 1 1])

title("Pi ~= " + pi_est(2,end));
hold on;

%Drawing square
plot(squareX, squareY, 'b-');
axis([-1.1,1.1,-1.1, 1.1]); 
hold on;

%Drawing circle
plt = plot(circleR*exp(1j*(0:pi/100:2*pi)), 'r'); 
plt.LineWidth = 1;
% hold on;

subplot(1, 3, 3)
plot(pi_est(1,:), pi_est(3,:), 'r');
title("Blad estymacji wzgledem ilosci punktow");
xlabel("Ilosc punktow");
ylabel('abs(blad estymacji)');
% axis([N(1),N(end), 2.5, 4]);
grid on;
pbaspect([1 1 1])