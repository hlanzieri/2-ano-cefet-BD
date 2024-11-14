use projetos_prova2024;
select *from Orgao;

/*1) Inserir 5 registros em cada tabela. Para as tabelas Cargo, Empregado e Orgao a entrada
deverá conter <seuprimeironome>_novo dado para os atributos nomecargo, nome e
nomeorgao. Exemplo de nova inserção na tabela Cargo – (001, “Luan_Analista de redes”,
3200.00).*/

insert into Empregado values ('0000122', 'Humberto_Diego', '14412334524','3284024543', 2,  1102);
insert into Empregado values ('0000123', 'Humberto_Tulio', '14412334523','3284024548', 4,  1104);
insert into Empregado values ('0000124', 'Humberto_Nicolas', '14412334522','3284024547',1,  1105);
insert into Empregado values ('0000125', 'Humberto_Gabriela', '14412334521','3284024544',3 ,  1106);
insert into Empregado values ('0000126', 'Humberto_Antonio', '87087117824','3294024545', 8,  1101);

insert into Orgao values (169242, 'Butantan', 'BNT');
insert into Orgao values (169243, 'Cupinxas', 'CPX');
insert into Orgao values (169244, 'Comando Vermelho', 'CV');
insert into Orgao values (169245, 'Primeiro Comando da Capital', 'PCC');
insert into Orgao values (169246, 'Terceiro Comando Puro', 'TCP');

insert into Cargo values (169559, 'Planejador', 10000.0);
insert into Cargo values (169558, 'Delator', 1000.0);
insert into Cargo values (169557, 'Atirador', 15000.0);
insert into Cargo values (169556, 'Linha de Frente', 1400.0);
insert into Cargo values (169555, 'Administrador', 5000.0);

/*2) Faça a alteração de um registro que você inseriu em cada uma das tabelas.*/

UPDATE Orgao
SET nomeorgao = 'Agencia Nacional de Transporte Terrestres'
WHERE codorgao = '169246';
UPDATE Orgao
SET siglaorgao = 'ANTT'
WHERE codorgao = '169246';
UPDATE Cargo
SET nomecargo = 'Gestor de Dados'
WHERE codcargo = '169556';
UPDATE Cargo
SET siglacargo = 'GBD'
WHERE codcargo = '169556';
UPDATE Empregado
SET nome = 'Daniel'
WHERE matricula = '0000123';

/*3) Delete um registro inserido por você em cada uma das tabelas.*/
delete from Orgao where codorgao=169244;
delete from Cargo where codcargo=169557;
delete from Empregado where matricula='0000125';

/*4) Apresente uma consulta que exiba todos os dados da tabela empregado.*/
select *from Empregado;

/*5) Apresente uma consulta que exiba o nome e a sigla de todos os órgãos.*/
select distinct nomeorgao, siglaorgao from Orgao;

/*6) Apresente uma consulta que exiba o nome e o salário de todos os cargos ordenados de
forma crescente pelo salário.*/
select nomecargo, salario from Cargo order by(salario)asc;

/*7) Apresentar uma consulta que exiba o valor de todos os salários cadastrados sem
repetição.*/
select distinct salario from Cargo;

/*8) Apresentar uma consulta que exiba o nome e o salário de todos os cargos que possuam
salário superior a R$ 8000,00.*/
select salario from Cargo where (salario>8000.0);

/*9) Apresentar uma consulta que exiba o nome e o salário de todos os cargos que possuam
salário inferior a R$ 3000,00.*/
select salario from Cargo where (salario<3000.0);

/*10) Apresentar uma consulta que exiba o nome e o salário de todos os cargos que possuam
salário com valor entre R$ 3000,00 e R$ 5000,00.*/
select salario from Cargo where (3000.0<salario) and (salario<5000);

/*11) Apresentar uma consulta que exiba o nome e o salário de todos os cargos que possuam
salário diferente dos seguintes valores R$ 2300,00, R$ 6700,00, R$ 7200,00.*/
select nomecargo, salario from Cargo where salario not in('2300', '6700', '7200');

/*12) Apresentar uma consulta que exiba o nome e o salário de todos os cargos que possuam
salário superior a R$ 8000,00.*/
select nomecargo, salario from Cargo where (salario>8000.0);

/*13) Apresentar uma consulta que exiba o nome, cpf e telefone para todos os empregados
cujo telefone seja nulo.*/
select nome, cpf, telefone from Empregado where telefone is null;

/*14) Apresentar uma consulta que exiba o nome, e sigla para todos os orgãos cuja sigla seja
nulo. O resultado deve ser apresentado em ordem decrescente considerando a sigla do
órgão.*/
select nomeorgao, siglaorgao from Orgao where siglaorgao = null ORDER BY siglaorgao DESC;

/*15) Apresentar uma consulta que exiba o nome e telefone para todos os empregados que
possuem número de telefone válido.*/
select nome, telefone from Empregado where telefone is not null;

/*16) Apresentar uma consulta que exiba todos os dados dos empregados cujo nome iniciam
com a sequência de caracteres “Ma”.*/

/*17) Apresentar uma consulta que exiba todos os dados dos empregados que possuem a
sequência de caracteres “eir” em qualquer posição do nome. O resultado deve ser
apresentado em ordem crescente.*/

/*18) Apresentar uma consulta que exiba o nome do cargo e seu respectivo salário ajustado
com um aumento de 10%. O nome da coluna deverá ser “Novo Salário”.*/

/*19) Apresentar uma consulta que exiba o nome do empregado e o nome do cargo que o
empregado possui.*/

/*20) Apresentar uma consulta que exiba o nome do empregado e a sigla do órgão em que o
empregado está lotado.*/

/*21) Apresentar uma consulta que exiba o nome e o salário de maior valor. A coluna deverá ser
exibida com o nome “Maior Salário.*/

/*22) Apresentar uma consulta que exiba o nome e o salário de menor valor. A coluna deverá
ser exibida com o nome “Menor Salário”.*/

/*23) Apresentar uma consulta que exiba a média de todos os salários cadastrados. A coluna
deverá ser exibida com o nome “Média Salarial”.*/

/*24) Apresentar uma consulta que exiba a quantidade de Cargos cadastrados.*/

/*25) Apresentar uma consulta que exiba o nome do órgão e o nome do cargo para todos os
cargos ofertados por cada órgão.*/



