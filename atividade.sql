USE projetos_INF2024_G10;
INSERT INTO COMENTARIO VALUES (1, 'Adorei a publicação! Muito informativa. Me deu confiança para visitar esta localidade!', now());
INSERT INTO COMENTARIO VALUES (2, 'O Rio de Janeiro comtinua lindo!', now());
INSERT INTO COMENTARIO VALUES (3, 'Apesar de toda a poluição da cidade de São Paulo, conhecer culturas como japonesa deve ser fantásatico!', now());
INSERT INTO COMENTARIO VALUES (4, 'Que lugar incrível! Mal posso esperar para visitar!', NOW());
INSERT INTO COMENTARIO VALUES (5, 'Adorei as dicas! São super úteis para quem planeja uma viagem.', NOW());
INSERT INTO COMENTARIO VALUES (6, 'As fotos ficaram espetaculares, parabéns pelo conteúdo!', NOW());
INSERT INTO COMENTARIO VALUES (7, 'Gostei muito de saber sobre a gastronomia local, parece deliciosa!', NOW());
INSERT INTO COMENTARIO VALUES (8, 'Muito informativo, obrigado por compartilhar essas curiosidades!', NOW());
INSERT INTO COMENTARIO VALUES (9, 'Já estive lá uma vez, e este artigo trouxe boas lembranças.', NOW());
INSERT INTO COMENTARIO VALUES (10, 'Conteúdo excelente, vou recomendar para meus amigos!', NOW());


INSERT INTO DESTINO (IdDestino, Nome, Localizacao, Descricao) VALUES 
(1000003, 'Praia do Forte', 'Cabo Frio, RJ', 'Praia limpa, com águas cristalinas e ótima infraestrutura para turistas'),
(1000004, 'Parque Ibirapuera', 'São Paulo, SP', 'Um espaço verde no meio da cidade, perfeito para caminhadas e lazer'),
(1000005, 'Serra do Cipó', 'Santana do Riacho, MG', 'Destino ideal para trilhas e contato direto com a natureza'),
(1000006, 'Centro Histórico', 'Ouro Preto, MG', 'Arquitetura colonial preservada com muitas igrejas e museus'),
(1000007, 'Mirante Dona Marta', 'Rio de Janeiro, RJ', 'Uma vista incrível da cidade e do Pão de Açúcar'),
(1000008, 'Praia dos Carneiros', 'Tamandaré, PE', 'Areias claras, águas mornas e uma das mais belas paisagens do Brasil'),
(1000009, 'Chapada Diamantina', 'Lençóis, BA', 'Parque nacional com cachoeiras e trilhas deslumbrantes'); 


select*from DESTINO;

INSERT INTO FOTO (IdFoto, Url, Descricao) VALUES
(100000, 'https://example.com/cachoeira-gloria-cataguases.jpg', 'Uma cachoeira tranquila e de fácil acesso, cercada por vegetação típica de Cataguases, MG'),
(100001, 'https://example.com/sitio-interior-mg.jpg', 'Uma propriedade no interior de Minas Gerais, com ampla área verde, chalés e piscina, ideal para finais de semana em família'),
(100002, 'https://buzios.rj.gov.br/imagem-praia-geriba.jpg', 'Vista panorâmica da Praia de Geribá, com ondas ao fundo e areia extensa, perfeita para esportes e relaxamento'),
(1000003, 'https://media-cdn.tripadvisor.com/media/photo-s/1c/51/02/77/praia-do-forte.jpg', 'Praia do Forte em Cabo Frio, RJ - Areia branca e águas cristalinas'),
(1000004, 'https://buzios.rj.gov.br/imagem-praia-geriba.jpg', 'Vista panorâmica da Praia de Geribá, com ondas ao fundo e areia extensa, perfeita para esportes e relaxamento'),
(1000005, 'https://example.com/cachoeira-gloria-cataguases.jpg', 'Uma cachoeira tranquila e de fácil acesso, cercada por vegetação típica de Cataguases, MG'),
(1000006, 'https://example.com/sitio-interior-mg.jpg', 'Uma propriedade no interior de Minas Gerais, com ampla área verde, chalés e piscina, ideal para finais de semana em família'),
(1000007, 'https://static.wixstatic.com/media/11062b_2b44d7d8ea74454a890ee05bdc3c73ba~mv2_d_1920_1280_s_2.jpg', 'Praia do Francês em Marechal Deodoro, AL - Beleza natural e ótima infraestrutura turística'),
(1000008, 'https://cdn.brasilturista.com.br/fotos/niteroi-rj-niteroi-contemporary-art-museum-3.jpg', 'Museu de Arte Contemporânea em Niterói, RJ - Arquitetura icônica de Oscar Niemeyer'),
(1000009, 'https://s3.amazonaws.com/zigzaggingaway/wp-content/uploads/2018/07/sao-miguel-das-missoes-3.jpg', 'Ruínas de São Miguel das Missões em RS - Patrimônio histórico e cultural da UNESCO');

INSERT INTO POST (IdPost, Titulo, Conteudo, DataPublicacao) VALUES
(1, 'A Cachoeira do Glória em Cataguases', 'A Cachoeira do Glória oferece um ambiente tranquilo e de fácil acesso, cercado por vegetação típica de Cataguases, MG. É um destino ideal para quem deseja um contato direto com a natureza.', '2024-12-05'),
(2, 'Sitio do Tonim em Cataguases', 'O Sitio do Tonim é uma excelente opção para quem busca um lugar tranquilo para passar o final de semana com a família, localizado em Cataguases, MG, com uma ampla área verde e chalés.', '2024-12-04'),
(3, 'Praia de Geribá em Búzios', 'A Praia de Geribá é uma das mais conhecidas de Búzios, RJ. Com suas águas claras e ondas perfeitas para esportes aquáticos, ela é um destino popular entre turistas de todas as idades.', '2024-12-03'),
(4, 'Praia do Forte em Cabo Frio', 'A Praia do Forte em Cabo Frio é um dos destinos mais procurados, com suas águas cristalinas e ótima infraestrutura. Ideal para quem deseja relaxar e aproveitar o sol.', '2024-12-02'),
(5, 'Parque Ibirapuera em São Paulo', 'O Parque Ibirapuera é um espaço verde no coração de São Paulo, ideal para caminhadas, passeios de bicicleta e momentos de lazer. Além disso, o parque é rodeado por importantes museus.', '2024-12-01'),
(6, 'Serra do Cipó em Santana do Riacho', 'A Serra do Cipó oferece diversas opções de ecoturismo, incluindo trilhas e cachoeiras, sendo um dos melhores destinos para quem busca contato com a natureza no estado de Minas Gerais.', '2024-11-30'),
(7, 'Centro Histórico de Ouro Preto', 'O Centro Histórico de Ouro Preto é um dos maiores patrimônios culturais do Brasil. Com suas igrejas e construções coloniais preservadas, é um destino perfeito para os amantes da história.', '2024-11-29'),
(8, 'Mirante Dona Marta no Rio de Janeiro', 'O Mirante Dona Marta oferece uma vista espetacular do Rio de Janeiro, incluindo o Pão de Açúcar e a Baía de Guanabara. Um local imperdível para quem visita a cidade maravilhosa.', '2024-11-28'),
(9, 'Praia dos Carneiros em Tamandaré', 'A Praia dos Carneiros, localizada em Tamandaré, PE, é famosa pelas suas águas mornas e paisagens deslumbrantes, ideal para quem busca tranquilidade e beleza natural.', '2024-11-27'),
(10, 'Chapada Diamantina em Lençóis', 'A Chapada Diamantina é um destino imperdível para os amantes de aventuras. Com suas trilhas e cachoeiras deslumbrantes, é o local perfeito para quem quer explorar a natureza em sua forma mais pura.', '2024-11-26');

INSERT INTO USUARIO (IdUsuario, Nome, Email, Senha) VALUES
(1, 'Humberto', 'humberto@gmail.com', 'HF123'),
(2, 'Diego', 'diego@gmail.com', 'DM123'),
(3, 'Daniel', 'daniel@gmail.com', 'DF123'),
(4, 'Antonio', 'antonio@gmail.com', 'AD123'),
(5, 'Nicolas', 'nicolas@gmail.com', 'NF123'),
(6, 'Gabriela', 'gabriela@gmail.com', 'GQ123'),
(7, 'Tulio', 'tulio@gmail.com', 'TT123'),
(8, 'Giovanna', 'giovanna@gmail.com', 'GC123'),
(9, 'João Mario', 'joao.mario@gmail.com', 'JM123'),
(10, 'Maria Clara', 'mariaclara@gmail.com', 'MC123');

select*from USUARIO;
