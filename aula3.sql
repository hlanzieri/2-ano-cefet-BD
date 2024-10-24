CREATE SCHEMA aula3;
USE aula3;

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

ALTER TABLE ItemNota add constraint PK_ItemNota PRIMARY KEY(IdNV, IdProd);

ALTER TABLE Produto add CodBarraProd VarChar(20) NOT NULL;

ALTER TABLE NotaVenda add NomeVendedor VarChar(50);

ALTER TABLE Produto add Constraint CodBarraProd_Produto_UK UNIQUE (CodBarraProd);

ALTER TABLE `aula3`.`ItemNota` add CONSTRAINT `FK_ItemNota_NotaVenda` FOREIGN KEY (IdNV) REFERENCES `aula3`.`NotaVenda` (IdNV) ON DELETE CASCADE; 

ALTER TABLE `aula3`.`itemnota` add CONSTRAINT `FK_itemnota_Produto` FOREIGN KEY (IdProd) REFERENCES `aula3`.`produto` (IdProd) ON DELETE CASCADE; 

/* DROP TABLE Produto;
