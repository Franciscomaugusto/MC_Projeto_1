%limitamos o valor de x entre 0 e 10
x_intervalo = linspace(0, 10, 1000);

val_k = [0.002 0.004 0.006 0.008 0.496 0.498 0.5 0.502 0.504 0.994 0.996 0.998 1];

pontos_intersecao = [];

%loop para o calculo com diferentes valores de k
for k = val_k
    
    f1 = @(x) sin(x);
    f2 = @(x) k * x;

    
    pontos_intersecao_k = [];
    primeiro_ponto_encontrado = false; 
    
    for i = 1:length(x_intervalo)-1
        x1 = x_intervalo(i);
        x2 = x_intervalo(i+1);
        
       %verificação da existencia de uma raiz num intervalo
        if sign(f1(x1) - f2(x1)) * sign(f1(x2) - f2(x2)) <= 0
            ponto_intersecao = fzero(@(x) f1(x) - f2(x), [x1, x2]);
            
            %verifica se a raiz encontrada está dentro do intervalo
            %desejado e exclui a interceção no ponto (0,0)
            if ponto_intersecao <= 10
                if primeiro_ponto_encontrado
                    pontos_intersecao_k = [pontos_intersecao_k; ponto_intersecao, f1(ponto_intersecao)];
                else
                    primeiro_ponto_encontrado = true;
                end
            end
        end
    end
    
    
    if ~isempty(pontos_intersecao_k)
        pontos_intersecao = [pontos_intersecao; pontos_intersecao_k];
        
        fprintf('Para k = %f, os pontos de interseção são:\n', k);
        disp(pontos_intersecao_k);
    end
end

%gráfico das funções
figure;
fplot(@(x) sin(x), [0 10], 'DisplayName', 'sin(x)');
hold on;
for k = val_k
    fplot(@(x) k * x, [0 10], 'DisplayName', ['k = ' num2str(k)]);
end



hold off;
ylim([-0.1 1.1])
grid on;
xlabel('x');
ylabel('f(x)');
title('Gráfico da interseção entre sin(x) e Kx');
legend;
