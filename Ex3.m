figure;
fplot(@(x) sin(x), [0 15], 'DisplayName', 'sin(x)');
hold on;
for k = [0.07 0.11 0.21 0.5 1 1.2]
    fplot(@(x) k * x, [0 15], 'DisplayName', ['k = ' num2str(k)]);
end



hold off;
ylim([-0.1 1.2])
grid on;
xlabel('x');
ylabel('f(x)');
title('Interseções consoante variações de Kx');
legend;