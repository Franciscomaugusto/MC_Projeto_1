fplot(@(x) -2 * x / pi + sin(x), [0 6])

ylim([-pi pi])
grid on
xlabel('x');
ylabel('f(x)');
title('Gráfico de -2x/\pi + sin(x)');

%através do gráfico escolhemos o intervalo [1.3,1.7] 