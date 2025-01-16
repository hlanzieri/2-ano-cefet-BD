USE projetos_INF2024_G10;

-- Tabela Localizacao
CREATE TABLE Localizacao (
    IdLocalizacao INT(10) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    rua CHAR(30) NOT NULL,
    bairro CHAR(15) NOT NULL,
    numero INT(5) NOT NULL,
    cidade CHAR(20) NOT NULL,
    siglaestado CHAR(2) NOT NULL,
    CONSTRAINT PK_IdLocalizacao PRIMARY KEY (IdLocalizacao)
);

-- Tabela Usuario
CREATE TABLE Usuario (
    IdUsuario INT(10) NOT NULL,
    nome CHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(30) NOT NULL,
    CONSTRAINT PK_IdUsuario PRIMARY KEY (IdUsuario)
);

-- Tabela Destino
CREATE TABLE Destino (
    IdDestino INT(10) NOT NULL,
    nome CHAR(30) NOT NULL,
    IdLocalizacao INT(10) NOT NULL,
    descricao CHAR(255) NOT NULL,
    CONSTRAINT PK_IdDestino PRIMARY KEY (IdDestino),
    CONSTRAINT FK_IdLocalizacao FOREIGN KEY (IdLocalizacao) REFERENCES Localizacao (IdLocalizacao)
);

-- Tabela Post
CREATE TABLE Post (
    IdPost INT(10) NOT NULL,
    titulo CHAR(30) NOT NULL,
    conteudo CHAR(255) NOT NULL,
    datapublicacao DATETIME NOT NULL,
    IdDestino INT(10) NOT NULL,
    IdLocalizacao INT(10) NOT NULL,
    IdCategoria INT(10) NOT NULL,
    CONSTRAINT PK_IdPost PRIMARY KEY (IdPost),
    CONSTRAINT FK_IdDestino FOREIGN KEY (IdDestino) REFERENCES Destino (IdDestino),
    CONSTRAINT FK_IdLocalizacao FOREIGN KEY (IdLocalizacao) REFERENCES Localizacao (IdLocalizacao)
);

-- Tabela Categoria
CREATE TABLE Categoria (
    IdCategoria INT(10) NOT NULL,
    nomecategoria CHAR(50) NOT NULL,
    CONSTRAINT PK_IdCategoria PRIMARY KEY (IdCategoria)
);

-- Tabela Tem (Relação entre Destino e Categoria)
CREATE TABLE Tem (
    IdCategoria INT(10) NOT NULL,
    IdDestino INT(10) NOT NULL,
    CONSTRAINT FK_IdCategoria FOREIGN KEY (IdCategoria) REFERENCES Categoria (IdCategoria),
    CONSTRAINT FK_IdDestino FOREIGN KEY (IdDestino) REFERENCES Destino (IdDestino)
);

-- Tabela Foto
CREATE TABLE Foto (
    IdFoto INT(10) NOT NULL,
    Url VARCHAR(255) NOT NULL,
    IdPost INT(10) NOT NULL,
    CONSTRAINT PK_IdFoto PRIMARY KEY (IdFoto),
    CONSTRAINT FK_IdPost FOREIGN KEY (IdPost) REFERENCES Post (IdPost)
);

-- Tabela Comentario
CREATE TABLE Comentario (
    IdComentario INT(10) NOT NULL,
    data_hora DATE NOT NULL,
    numcurtidas INT(10) DEFAULT 0,
    conteudo CHAR(255) NOT NULL,
    IdPost INT(10) NOT NULL,
    IdUsuario INT(10) NOT NULL,
    CONSTRAINT PK_IdComentario PRIMARY KEY (IdComentario),
    CONSTRAINT FK_IdPost FOREIGN KEY (IdPost) REFERENCES Post (IdPost),
    CONSTRAINT FK_IdUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

-- Tabela Curtida
CREATE TABLE Curtida (
    IdCurtida INT(10) NOT NULL,
    IdUsuario INT(10) NOT NULL,
    CONSTRAINT PK_IdCurtida PRIMARY KEY (IdCurtida),
    CONSTRAINT FK_IdUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

-- Tabela Recebe (Relação entre Curtida e Post)
CREATE TABLE Recebe (
    IdCurtida INT(10) NOT NULL,
    IdPost INT(10) NOT NULL,
    CONSTRAINT FK_IdCurtida FOREIGN KEY (IdCurtida) REFERENCES Curtida (IdCurtida),
    CONSTRAINT FK_IdPost FOREIGN KEY (IdPost) REFERENCES Post (IdPost)
);

-- Tabela Busca (Relação entre Usuario e Destino)
CREATE TABLE Busca (
    IdUsuario INT(10) NOT NULL,
    IdDestino INT(10) NOT NULL,
    CONSTRAINT FK_IdUsuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario),
    CONSTRAINT FK_IdDestino FOREIGN KEY (IdDestino) REFERENCES Destino (IdDestino)
);

-- Inserção

-- Inserções na tabela Localizacao
INSERT INTO Localizacao (IdLocalizacao, cep, rua, bairro, numero, cidade, siglaestado) VALUES
(1, '12345-678', 'Rua Principal', 'Centro', 100, 'São Paulo', 'SP'),
(2, '22345-678', 'Av. Atlântica', 'Copacabana', 200, 'Rio de Janeiro', 'RJ'),
(3, '32345-678', 'Rua das Flores', 'Jardim', 150, 'Belo Horizonte', 'MG'),
(4, '42345-678', 'Av. Brasil', 'Centro', 50, 'Fortaleza', 'CE'),
(5, '52345-678', 'Rua do Porto', 'Beira Mar', 300, 'Recife', 'PE'),
(6, '62345-678', 'Av. Paulista', 'Bela Vista', 400, 'São Paulo', 'SP'),
(7, '72345-678', 'Rua do Comércio', 'Centro', 250, 'Salvador', 'BA'),
(8, '82345-678', 'Av. das Palmeiras', 'Jardins', 350, 'Curitiba', 'PR'),
(9, '92345-678', 'Rua do Sol', 'Praia', 450, 'Natal', 'RN'),
(10, '10345-678', 'Av. dos Bandeirantes', 'Centro', 500, 'Campinas', 'SP');

-- Inserções na tabela Destino
INSERT INTO Destino (IdDestino, nome, IdLocalizacao, descricao) VALUES
(1, 'Praia do Forte', 2, 'Praia com águas cristalinas e boa infraestrutura.'),
(2, 'Cachoeira do Glória', 3, 'Cachoeira com águas tranquilas, ideal para relaxar.'),
(3, 'Parque Ibirapuera', 6, 'Um parque icônico no coração de São Paulo.'),
(4, 'Mirante Dona Marta', 2, 'Vista panorâmica incrível do Rio de Janeiro.'),
(5, 'Chapada Diamantina', 7, 'Destino perfeito para trilhas e contato com a natureza.'),
(6, 'Praia dos Carneiros', 5, 'Uma das praias mais belas do Brasil.'),
(7, 'Serra do Cipó', 3, 'Região com belas trilhas e cachoeiras.'),
(8, 'Centro Histórico de Ouro Preto', 4, 'Rico em história e arquitetura colonial.'),
(9, 'Museu Oscar Niemeyer', 8, 'Museu com arquitetura marcante em Curitiba.'),
(10, 'Praia de Ponta Negra', 9, 'Praia famosa pelo Morro do Careca.');

-- Inserções na tabela Usuario
INSERT INTO Usuario (IdUsuario, nome, email, senha) VALUES
(1, 'Humberto', 'humberto@gmail.com', 'HL123'),
(2, 'Diego', 'diego@gmail.com', 'DG123'),
(3, 'Daniel', 'daniel@gmail.com', 'DF123'),
(4, 'Antonio', 'antonio@gmail.com', 'AD123'),
(5, 'Nicolas', 'nicolas@gmail.com', 'NF123'),
(6, 'Gabriela', 'gabriela@gmail.com', 'GQ123'),
(7, 'Tulio', 'tulio@gmail.com', 'TT123'),
(8, 'Giovanna', 'giovanna@gmail.com', 'GC123'),
(9, 'João Mario', 'joaomario@gmail.com', 'JM123'),
(10, 'Maria Clara', 'mariaclara@gmail.com', 'MC123');

-- Inserções na tabela Categoria
INSERT INTO Categoria (IdCategoria, nomecategoria) VALUES
(1 , 'Praia'),
(2 , 'Romântico'),
(3 , 'Para família'),
(4, 'Para curtir com amigos'),
(5, 'Cachoeira'),
(6, 'Trilha'),
(7, 'Aventura'),
(8, 'Arte e história'),
(9, 'Mirante'),
(10, 'Música');

-- Inserções na tabela Post
INSERT INTO Post (IdPost, titulo, conteudo, datapublicacao, IdDestino, IdLocalizacao, IdCategoria) VALUES
(1, 'Visita à Praia do Forte', 'Um destino incrível em Cabo Frio.', '2024-12-01 10:00:00', 1, 2, 1), 
(2, 'A beleza da Cachoeira do Glória', 'Uma experiência relaxante em Minas Gerais.', '2024-12-02 11:00:00', 2, 3, 5), 
(3, 'Passeio pelo Parque Ibirapuera', 'Natureza e lazer em São Paulo.', '2024-12-03 12:00:00', 3, 6, 3), 
(4, 'A vista do Mirante Dona Marta', 'Panoramas inesquecíveis do Rio de Janeiro.', '2024-12-04 13:00:00', 4, 2, 9), 
(5, 'Trilhas na Chapada Diamantina', 'Belezas naturais no coração da Bahia.', '2024-12-05 14:00:00', 5, 7, 6),
(6, 'Praia dos Carneiros: um paraíso', 'Uma praia perfeita em Pernambuco.', '2024-12-06 15:00:00', 6, 5, 1), 
(7, 'Aventura na Serra do Cipó', 'Contato direto com a natureza em Minas.', '2024-12-07 16:00:00', 7, 3, 7), 
(8, 'Ouro Preto histórico', 'Um mergulho na história colonial brasileira.', '2024-12-08 17:00:00', 8, 4, 8), 
(9, 'Arte no Museu Niemeyer', 'Cultura e arquitetura em Curitiba.', '2024-12-09 18:00:00', 9, 8, 8), 
(10, 'Sol e diversão em Ponta Negra', 'Um lugar incrível para relaxar em Natal.', '2024-12-10 19:00:00', 10, 9, 4); 

