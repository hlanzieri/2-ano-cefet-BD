use projetos_prova2024;

/*Exercício 1*/
SELECT o.nomeorgao, COUNT(nc.codcargo) AS 'quantidade de cargos' FROM Orgao o 
LEFT JOIN Novo_Contem nc ON o.codorgao = nc.codorgao
LEFT JOIN Cargo c ON nc.codcargo = c.codcargo GROUP BY o.codorgao, o.nomeorgao;

/*Exercício 2*/
SELECT o.nomeorgao, SUM(c.salario) AS 'folha de pagamento' FROM Orgao o
LEFT JOIN Novo_Contem nc ON o.codorgao = nc.codorgao
LEFT JOIN Cargo c ON nc.codcargo = c.codcargo GROUP BY o.codorgao, o.nomeorgao;

/*Exercício 3*/
SELECT o.nomeorgao AS 'Orgãos que possuem o cargo mateus_engenheiro de software' FROM Orgao o 
JOIN Novo_Contem nc ON o.codorgao = nc.codorgao 
JOIN Cargo c ON nc.codcargo = c.codcargo WHERE c.nomecargo = 'mateus_engenheiro de software';

