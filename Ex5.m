%parâmetros do exercicio
    a = 0;
    b = pi;
    x0 = 1.2;
    x1 = 1.4;
    k=2/pi;
    max_iter = 10000;
    erro = 1e-6;


solucao = MetSec((@centroide), a, b, x0, x1, k, max_iter, erro);
disp('Solução:');
disp(solucao);
