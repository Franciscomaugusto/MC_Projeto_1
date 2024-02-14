function iteracoes = MetSec(func,a, b, x0, x1, K, max_iter, erro)
    format long;

    r = 1;

    %verifica se x0 e x1 estão dentro do intervalo [a, b]
    if (x0 < a || x0 > b) || (x1 < a || x1 > b)
        fprintf('Erro: x0 e x1 devem estar dentro do intervalo [a, b]\n');
        iteracoes = NaN;  % retorna NaN se x0 ou x1 não estão no intervalo
        return;
    end

    dif = abs(x1 - x0);
    xn = x1;
    xant = x0;

    %inicialização do vetor de iterações
    iteracoes = zeros(1, max_iter);

    %armazena as iterações x0 e x1
    iteracoes(1) = xant;
    n=2;
    iteracoes(2) = xn;
   
    while (n <= max_iter && dif >= erro)
        xnext =  xn - func(K, r,xn)*(xn - xant)/(func(K, r, xn) - func(K, r, xant)); 
        xant = xn;
        xn = xnext;
        dif = abs(xn - xant);
        n = n + 1;

        iteracoes(n) = xn;
    end

    iteracoes = iteracoes(1:n);
    
    if dif < erro
        fprintf('Convergência alcançada com erro %e\n', erro);
    else
        fprintf('Número máximo de iterações atingido\n');
    end
end
