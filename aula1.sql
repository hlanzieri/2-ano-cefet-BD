Use AULA2024;
Create Schema AULA2024;

Create table NotaVenda(
IdNV CHAR(6) NOT NULL,
DataNV DATE,
CONSTRAINT PK_NotaVenda PRIMARY KEY(IdNV)
);

Create Index DataNV_idx
ON NotaVenda(DataNV);

Alter table NotaVenda
ADD NomeVendedor VarChar(50);

Create table PRODUTO(
IdP CHAR(6) NOT NULL,
DescricaoP CHAR(35) NOT NULL,
CONSTRAINT PK_PRODUTO PRIMARY KEY(IdP)
);

Drop Table PRODUTO;
Drop Index DataNV_idx ON NotaVenda;

Select * from NotaVenda;

Insert into NotaVenda values
('0001', '2002-10-14', 'Ana');

Update NotaVenda
Set NomeVendedor='Jair Batista'
Where IdNV='0001';

Delete from NotaVenda
Where NomeVendedor='Ana';

Delete from NotaVenda
