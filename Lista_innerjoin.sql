USE projetos_prova2024;

-- 1) Listar a sigla dos órgãos e a quantidade de cargos associados a cada órgão
SELECT O.siglaorgao, COUNT(C.codcargo) AS "Total de Cargos por Órgão"
FROM Novo_Orgao O
JOIN Novo_Contem C ON O.codorgao = C.codorgao
GROUP BY O.siglaorgao;

-- 2) Listar o nome do cargo e a quantidade de órgãos associados a cada cargo
SELECT C.nomecargo, COUNT(DISTINCT N.codorgao) AS "Cargo associado ao total de Órgãos igual"
FROM Novo_Cargo C
JOIN Novo_Contem N ON C.codcargo = N.codcargo
GROUP BY C.nomecargo;

-- 3) Listar a sigla do órgão e a quantidade de empregados associados a cada órgão
SELECT O.siglaorgao, COUNT(E.matricula) AS "Total de Empregados por Órgão"
FROM Novo_Orgao O
JOIN Novo_Empregado E ON O.codorgao = E.codorgao
GROUP BY O.siglaorgao;

-- 4) Listar o nome e salário dos empregados ordenados pelo salário
SELECT E.nome, C.salario
FROM Novo_Empregado E
JOIN Novo_Cargo C ON E.codcargo = C.codcargo
ORDER BY C.salario;

-- 5) Listar todos os valores de salários cadastrados sem repetição e ordenados
SELECT DISTINCT salario
FROM Novo_Cargo
ORDER BY salario;

-- 6) Listar o número total de empregados cadastrados
SELECT COUNT(*) AS "Total de Empregados Cadastrados"
FROM Novo_Empregado;

-- 7) Listar a sigla do órgão, o nome do cargo, o nome do empregado e o seu respectivo salário
SELECT O.siglaorgao, C.nomecargo, E.nome, C.salario
FROM Novo_Orgao O
JOIN Novo_Empregado E ON O.codorgao = E.codorgao
JOIN Novo_Cargo C ON E.codcargo = C.codcargo
ORDER BY O.siglaorgao, C.nomecargo, E.nome;

-- 8) Listar o nome e salário dos empregados que recebem salário igual ao salário atribuído ao cargo "Técnico do Banco Central"
SELECT E.nome, C.salario
FROM Novo_Empregado E
JOIN Novo_Cargo C ON E.codcargo = C.codcargo
WHERE C.salario = (SELECT salario FROM Novo_Cargo WHERE nomecargo = 'Técnico do Banco Central');

-- 9) Listar o código do órgão e o custo da folha de pagamento de cada órgão que possuem salário igual ao salário atribuído ao cargo "Delegado de Polícia Federal"
SELECT E.codorgao, SUM(C.salario) AS "Custo da Folha de Pagamento"
FROM Novo_Empregado E
JOIN Novo_Cargo C ON E.codcargo = C.codcargo
WHERE C.salario = (SELECT salario FROM Novo_Cargo WHERE nomecargo = 'Delegado de Polícia Federal')
GROUP BY E.codorgao;

-- 10) Listar o nome do órgão e o valor do salário médio dos cargos associados ao órgão de sigla igual "BCB"
SELECT O.nomeorgao, AVG(C.salario) AS "Salário Médio"
FROM Novo_Orgao O
JOIN Novo_Contem N ON O.codorgao = N.codorgao
JOIN Novo_Cargo C ON N.codcargo = C.codcargo
WHERE O.siglaorgao = 'BCB'
GROUP BY O.nomeorgao;

-- 11) Listar o nome do cargo e salário para os cargos que possuem salário igual ao salário do cargo "Diplomata"
SELECT nomecargo, salario
FROM Novo_Cargo
WHERE salario = (SELECT salario FROM Novo_Cargo WHERE nomecargo = 'Diplomata');

-- 12) Listar o nome de todos os empregados e o nome dos cargos associados a cada empregado, ordenado pelo nome do cargo
SELECT E.nome, C.nomecargo
FROM Novo_Empregado E
JOIN Novo_Cargo C ON E.codcargo = C.codcargo
ORDER BY C.nomecargo;

-- 13) Listar o nome de todos os cargos e o nome dos empregados associados a cada cargo
SELECT C.nomecargo, E.nome
FROM Novo_Cargo C
JOIN Novo_Empregado E ON C.codcargo = E.codcargo;

-- 14) Listar a sigla de todos os órgãos e o nome dos empregados associados a cada órgão, ordenado pela sigla do órgão
SELECT O.siglaorgao, E.nome
FROM Novo_Orgao O
JOIN Novo_Empregado E ON O.codorgao = E.codorgao
ORDER BY O.siglaorgao;

-- 15) Listar o nome dos empregados e a sigla de todos os órgãos associados a cada empregado, ordenado pelo nome do empregado
SELECT E.nome, O.siglaorgao
FROM Novo_Empregado E
JOIN Novo_Orgao O ON E.codorgao = O.codorgao
ORDER BY E.nome;

-- 16) Listar a sigla dos órgãos e o menor salário do cargo cadastrado em cada órgão, agrupado pela sigla do órgão e ordenado pelo salário
SELECT O.siglaorgao, MIN(C.salario) AS "Menor Salário"
FROM Novo_Orgao O
JOIN Novo_Contem N ON O.codorgao = N.codorgao
JOIN Novo_Cargo C ON N.codcargo = C.codcargo
GROUP BY O.siglaorgao
ORDER BY "Menor Salário";

-- 17) Listar o nome dos órgãos e nome do empregado quando o telefone do empregado iniciar com "33", ordenado pelo nome do órgão
SELECT O.nomeorgao, E.nome
FROM Novo_Orgao O
JOIN Novo_Empregado E ON O.codorgao = E.codorgao
WHERE E.telefone LIKE '33%'
ORDER BY O.nomeorgao;

-- 18) Listar a sigla dos órgãos e nome do empregado quando o telefone do empregado não iniciar com "33", ordenado pelo nome do órgão
SELECT O.siglaorgao, E.nome
FROM Novo_Orgao O
JOIN Novo_Empregado E ON O.codorgao = E.codorgao
WHERE E.telefone NOT LIKE '33%'
ORDER BY O.siglaorgao;

-- 19) Listar o nome dos cargos que possuem empregados
SELECT DISTINCT C.nomecargo
FROM Novo_Cargo C
JOIN Novo_Empregado E ON C.codcargo = E.codcargo;

-- 20) Listar o nome dos órgãos que possuem empregados
SELECT DISTINCT O.nomeorgao
FROM Novo_Orgao O
JOIN Novo_Empregado E ON O.codorgao = E.codorgao;
