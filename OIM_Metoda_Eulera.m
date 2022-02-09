clear;
close;


theta0 = 0.01;
% theta0 = pi;
% h = 1e-3;
h = 1e-1;
t = 0:h:10;

g = 9.81;
l = 1;
a = (-g/l);
omega = sqrt(g/l);

y1(1) = theta0;
y2(2) = theta0;
an(1) = theta0;
test(1) = theta0;

for i=2:length(t)
    y2(i) = y2(i-1) - a*h*sin(y1(i-1));
    y1(i) = y1(i-1) - h*y2(i-1);
    an(i) = theta0 * cos(omega*t(i));
end


figure(1);
subplot(2,1,1)
% title()
stairs(t, y1, 'b');
hold on;
stairs(t, an, 'r');
legend('numeryczna', 'analityczna')
subplot(2,1,2)
stairs(t, (y1 - an), 'r');
xlabel("czas")
ylabel("Różnica m. numerycznej i analitycznej")

