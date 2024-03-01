/* Lógico_1: */

CREATE TABLE Professor (
    Codigo NUMERIC PRIMARY KEY,
    Nome CHARACTER
);

CREATE TABLE Disciplinas (
    Codigo NUMERIC PRIMARY KEY,
    Carga_Horaria TIME,
    Nome CHARACTER,
    fk_Professor_Codigo NUMERIC
);

CREATE TABLE Livro_texto (
    Codigo NUMERIC PRIMARY KEY,
    Titulo CHARACTER,
    Autor CHARACTER
);

CREATE TABLE possui (
    fk_Livro_texto_Codigo NUMERIC,
    fk_Disciplinas_Codigo NUMERIC
);
 
ALTER TABLE Disciplinas ADD CONSTRAINT FK_Disciplinas_2
    FOREIGN KEY (fk_Professor_Codigo)
    REFERENCES Professor (Codigo)
    ON DELETE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Livro_texto_Codigo)
    REFERENCES Livro_texto (Codigo)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Disciplinas_Codigo)
    REFERENCES Disciplinas (Codigo)
    ON DELETE SET NULL;
