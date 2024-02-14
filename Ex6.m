%parâmetros
alpha = 1.570796326794897; %encontramos este alfa com uma precisão de erro 10^-16 
K = 2 / pi;
x0 = 1.2;
x1 = 1.4;
max_iter = 100;


p = [1, 2, (1 + sqrt(5)) / 2]; %vetor com os valores de p que queremos testar
quociente_convergencia = zeros(length(p), max_iter);

for i = 1:length(p)
    p_c = p(i);  
    
    
    iteracoes = MetSec(@centroide,0, pi, x0, x1, K, max_iter, 1e-6);
    
    %calculo do quociente de convergência para cada iteração
    for n = 1:min(max_iter, length(iteracoes)-1)
        quociente_convergencia(i, n) = abs((alpha - iteracoes(n + 1)) / ((alpha - iteracoes(n))^p_c));
        disp(quociente_convergencia(i, n));
    end
end

%gráfico com os resultados
figure;
plot(1:min(max_iter, length(iteracoes)-1), quociente_convergencia(1, 1:min(max_iter, length(iteracoes)-1)), '-o', 'DisplayName', 'p = 1');
hold on;
plot(1:min(max_iter, length(iteracoes)-1), quociente_convergencia(2, 1:min(max_iter, length(iteracoes)-1)), '-o', 'DisplayName', 'p = 2');
plot(1:min(max_iter, length(iteracoes)-1), quociente_convergencia(3, 1:min(max_iter, length(iteracoes)-1)), '-o', 'DisplayName', 'p = (1 + sqrt(5))/2');
xlabel('Número de Iterações');
ylabel('Coeficiente de Convergência');
title('Verificação da Ordem de Convergência');
legend('show');
grid on;
ylim([-0.2 10]);