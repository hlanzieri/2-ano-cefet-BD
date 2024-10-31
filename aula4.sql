/*Create || Use Schema */

CREATE SCHEMA aula3;
USE aula3;

/*Create Table*/

CREATE TABLE NotaVenda (
IdNV CHAR(6) NOT NULL,
DataNV DATE,
CONSTRAINT PK_NotaVenda PRIMARY KEY(IdNV));

CREATE TABLE Produto (
IdProd CHAR(5) NOT NULL,
DescProd VARCHAR(100),
PUnitProd DECIMAL(6,2),
QuantProd INTEGER,
TipoProd CHAR(12),
CONSTRAINT PK_Produto PRIMARY KEY(IdProd),
CHECK (TipoProd IN ('HARDWARE','SOFTWARE')));

CREATE TABLE ItemNota (
IdNV CHAR(6) NOT NULL,
IdProd CHAR(5) NOT NULL); 

/*Alter Table*/

ALTER TABLE ItemNota add constraint PK_ItemNota PRIMARY KEY(IdNV, IdProd);

ALTER TABLE Produto add CodBarraProd VarChar(20) NOT NULL;

ALTER TABLE NotaVenda add NomeVendedor VarChar(50);

ALTER TABLE Produto add Constraint CodBarraProd_Produto_UK UNIQUE (CodBarraProd);

ALTER TABLE `aula3`.`ItemNota` add CONSTRAINT `FK_ItemNota_NotaVenda` FOREIGN KEY (IdNV) REFERENCES `aula3`.`NotaVenda` (IdNV) ON DELETE CASCADE; 

ALTER TABLE `aula3`.`itemnota` add CONSTRAINT `FK_itemnota_Produto` FOREIGN KEY (IdProd) REFERENCES `aula3`.`produto` (IdProd) ON DELETE CASCADE; 

/*Create Index*/

CREATE INDEX DescProd_idx
ON Produto(DescProd);

CREATE INDEX Humberto
ON Produto(TipoProd);

/*Drop Index*/

DROP INDEX DescProd_idx
ON Produto;

/*Insert Into*/

INSERT INTO Produto
VALUES ('00010','Mouse duas cores',5.20,38,'HARDWARE','12345');

INSERT INTO Notavenda VALUES ('0001','2002-10-14','ANA');
INSERT INTO Notavenda VALUES ('0002','2004-10-14','JOANA');
INSERT INTO Notavenda VALUES ('0003','2003-08-14','ANA');
INSERT INTO Notavenda VALUES ('0004','2006-08-14','JOANA');
INSERT INTO Notavenda VALUES ('0005','2002-11-14','SILVANA');
INSERT INTO Notavenda VALUES ('0006','2005-12-14','SILVANA'); 

SELECT*FROM Notavenda;

INSERT INTO Produto (IdProd, DescProd, PUnitProd, QuantProd, TipoProd,
CodBarraProd)
VALUES ('00015','Drive CDROM', 50.00, 10, 'HARDWARE', '1122');

SELECT*FROM Produto;

/*Create Table*/

CREATE TABLE NotaVendaHistorico (
IdNV CHAR(6) NOT NULL PRIMARY KEY,
DataNV DATE); 

SELECT*FROM notavendahistorico;

/*Insert*/

INSERT INTO notavendahistorico (`IdNV`, `DataNV`) VALUES
('00123', '2005-10-10'); 

INSERT INTO NotaVendahistorico
SELECT IdNV, DataNV
FROM NotaVenda;

SELECT*FROM notavendahistorico WHERE IdNV <>'0001';

/*Delete*/

DELETE FROM Produto
WHERE IdProd = '00010';

/*Update*/

UPDATE NotaVenda
SET NomeVendedor = 'JAIR BATISTA'
WHERE IdNV = '0002';

SELECT*FROM NotaVenda;

UPDATE Produto
SET PunitProd = (PunitProd * 1.1) where CodBarraProd='1122'; 

UPDATE NotaVenda
Set NomeVendedor = 'Humberto';

SELECT*FROM Produto;

/*Select*/

SELECT DISTINCT NomeVendedor FROM NotaVenda; 
