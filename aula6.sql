USE projetos_prova2024;
SELECT COUNT(codcargo) AS "Numero de Cargos" FROM Cargo; 
SELECT SUM(salario) AS "Soma dos salários de todos os cargos" FROM Cargo; 
SELECT AVG(salario) AS "A média dos salários de todos os cargos" FROM Cargo; 
SELECT MAX(salario) AS "O maior salário entre todos os cargos" FROM Cargo; 
SELECT MIN(salario) AS "O menor salário entre todos os cargos" FROM Cargo; 
SELECT COUNT(matricula) AS "O número de empregados que o DDD é da Zona da Mata" FROM Empregado WHERE telefone LIKE '32%';
select*from Empregado;

/*Quantos orgãos estão cadastrados? 91*/
SELECT COUNT(codorgao) AS "Numero de Orgãos" FROM Orgao;

/*Qual a média dos salários da tabela cargo? 36850,22*/
SELECT AVG(salario) AS "A média dos salários de todos os cargos" FROM Cargo; 

/*Qual o telefone dos empregados que possuem 'ira' em qualquer parte do nome?*/
SELECT nome, telefone FROM Empregado WHERE nome LIKE '%ira%';

/*Listar os nomes de todos os cargos ordenados de forma decrescente*/
SELECT nomecargo FROM Cargo Order by nomecargo asc;

/*Listar o nome dos empregados sem repetição*/
SELECT DISTINCT nome FROM Empregado; 
