clear;
close;

Wynik = zeros();

for alpha = 0:0.001:4
    X0 = 0.2;

    for i = 1:10000
        X0_n = alpha * (X0 - X0^2);
        X0 = X0_n;
    end

    for j = 1:10000
        X0_n = alpha * (X0 - X0^2);
        X0 = X0_n;
        Wynik(1, length(Wynik) + 1) = alpha;
        Wynik(2, length(Wynik)) = X0_n;
    end
end
plot(Wynik(1,:), Wynik(2,:), '.', 'MarkerSize', 1);
ylabel('x');
xlabel('alpha');