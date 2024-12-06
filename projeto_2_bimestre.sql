USE projetos_INF2024_G10;

CREATE TABLE Usuario(
	IdUsuario int(10),
	nome char(50),
    email varchar(50),
    senha varchar(30),
    CONSTRAINT PK_IdUsuario PRIMARY KEY (IdUsuario)
);

CREATE TABLE Post(
	IdPost int(10),
    titulo char(30),
    conteudo char(255),
    datapublicacao datetime,
    IdDestino int(10),
    IdLocalizacao int(10),
    CONSTRAINT PK_IdPost PRIMARY KEY (IdPost),
    FOREIGN KEY (IdLocalizacao) REFERENCES Localizacao (IdLocalizacao),
    FOREIGN KEY (IdDestino) REFERENCES Destino (IdDestino)
);

CREATE TABLE Comentario (
    IdComentario int,
    data_hora date,
    numcurtidas int,
    conteudo char,
    IdPost int,
    IdUsuario int,
    CONSTRAINT PK_IdComentario PRIMARY KEY (IdComentario), 
    FOREIGN KEY (IdPost) REFERENCES Post (IdPost),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario)
);

CREATE TABLE Destino(
	IdDestino int(10),
    nome char(30), 
    IdLocalizacao int(10),
    descricao char(255),
    CONSTRAINT PK_IdDestino PRIMARY KEY (IdDestino),
    FOREIGN KEY (IdLocalizacao) REFERENCES Localizacao (IdLocalizacao)
);

CREATE TABLE Foto(
	IdFoto int(10),
    Url varchar(255),
    IdPost int(10),
	CONSTRAINT PK_IdFoto PRIMARY KEY (IdFoto),
    FOREIGN KEY (IdPost) REFERENCES Post (IdPost)
);

CREATE TABLE Localizacao(
	IdLocalizacao int(10), 
    cep varchar(9),
    rua char(30),
    bairro char(15), 
    numero int (5),
    cidade char(20),
    siglaestado char(2),
    CONSTRAINT PK_IdLocalizacao PRIMARY KEY (IdLocalizacao)
);

-- Tabela Localizacao
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

SELECT*FROM Localizacao;

-- Tabela Destino
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


-- Tabela Usuario
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

-- Tabela Post
INSERT INTO Post (IdPost, titulo, conteudo, datapublicacao, IdDestino, IdLocalizacao) VALUES
(1, 'Visita à Praia do Forte', 'Um destino incrível em Cabo Frio.', '2024-12-01 10:00:00', 1, 2),
(2, 'A beleza da Cachoeira do Glória', 'Uma experiência relaxante em Minas Gerais.', '2024-12-02 11:00:00', 2, 3),
(3, 'Passeio pelo Parque Ibirapuera', 'Natureza e lazer em São Paulo.', '2024-12-03 12:00:00', 3, 6),
(4, 'A vista do Mirante Dona Marta', 'Panoramas inesquecíveis do Rio de Janeiro.', '2024-12-04 13:00:00', 4, 2),
(5, 'Trilhas na Chapada Diamantina', 'Belezas naturais no coração da Bahia.', '2024-12-05 14:00:00', 5, 7),
(6, 'Praia dos Carneiros: um paraíso', 'Uma praia perfeita em Pernambuco.', '2024-12-06 15:00:00', 6, 5),
(7, 'Aventura na Serra do Cipó', 'Contato direto com a natureza em Minas.', '2024-12-07 16:00:00', 7, 3),
(8, 'Ouro Preto histórico', 'Um mergulho na história colonial brasileira.', '2024-12-08 17:00:00', 8, 4),
(9, 'Arte no Museu Niemeyer', 'Cultura e arquitetura em Curitiba.', '2024-12-09 18:00:00', 9, 8),
(10, 'Sol e diversão em Ponta Negra', 'Um lugar incrível para relaxar em Natal.', '2024-12-10 19:00:00', 10, 9);

SELECT*FROM Destino;

-- Tabela Comentario
INSERT INTO Comentario (IdComentario, data_hora, numcurtidas, conteudo, IdPost, IdUsuario) VALUES
(1, '2024-12-01', 5, 'Adorei a publicação!', 1, 1),
(2, '2024-12-02', 3, 'Lugar maravilhoso!', 2, 2),
(3, '2024-12-03', 7, 'Quero visitar!', 3, 3),
(4, '2024-12-04', 2, 'Fotos incríveis!', 4, 4),
(5, '2024-12-05', 10, 'Recomendo muito.', 5, 5),
(6, '2024-12-06', 6, 'Parece um paraíso!', 6, 6),
(7, '2024-12-07', 8, 'História fascinante.', 7, 7),
(8, '2024-12-08', 4, 'Ótimo post!', 8, 8),
(9, '2024-12-09', 9, 'Quero ir agora!', 9, 9),
(10, '2024-12-10', 3, 'Ótima dica!', 10, 10);

-- Tabela Foto
INSERT INTO Foto (IdFoto, Url, IdPost) VALUES
(1, 'https://images.unsplash.com/photo-1613042355245-9c1f748f5b34', 1), -- Praia do Forte
(2, 'https://media.gettyimages.com/photos/boat-on-the-beach-at-praia-do-forte-bahia-brazil-picture-id134104135', 2), -- Praia do Forte
(3, 'https://images.unsplash.com/photo-1571785224377-6d276c48e442', 3), -- Cabo Frio
(4, 'https://media.gettyimages.com/photos/aerial-view-of-cabo-frio-brazil-picture-id115530147', 4), -- Cabo Frio
(5, 'https://images.unsplash.com/photo-1576741466675-688ecb726051', 5), -- Parque Ibirapuera
(6, 'https://media.gettyimages.com/photos/mirante-dona-marta-view-of-rio-de-janeiro-picture-id114517252', 6), -- Mirante Dona Marta
(7, 'https://images.unsplash.com/photo-1599530137522-b99a8d91f507', 7), -- Chapada Diamantina
(8, 'https://cdn.brasilturismo.com.br/fotos/serra-do-cipo-minas-gerais-3.jpg', 8), -- Serra do Cipó
(9, 'https://cdn.brasilturista.com.br/fotos/ouro-preto-mg.jpg', 9), -- Ouro Preto
(10, 'https://media.gettyimages.com/photos/museu-de-arte-contemporanea-niteroi-picture-id466740914', 10); -- Museu Niemeyer
