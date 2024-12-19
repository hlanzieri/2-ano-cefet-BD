USE projetos_INF2024_G10;

CREATE VIEW View_PostsDetalhados AS
SELECT 
    p.IdPost,
    p.titulo,
    p.conteudo,
    p.datapublicacao,
    d.nome AS destino,
    l.cidade,
    l.siglaestado
FROM 
    Post p
JOIN Destino d ON p.IdDestino = d.IdDestino
JOIN Localizacao l ON d.IdLocalizacao = l.IdLocalizacao;

CREATE VIEW View_ComentariosDetalhados AS
SELECT 
    c.IdComentario,
    c.data_hora,
    c.numcurtidas,
    c.conteudo AS comentario,
    u.nome AS autor,
    p.titulo AS post_titulo
FROM 
    Comentario c
JOIN Usuario u ON c.IdUsuario = u.IdUsuario
JOIN Post p ON c.IdPost = p.IdPost;

CREATE VIEW View_DestinosLocalizacao AS
SELECT 
    d.IdDestino,
    d.nome AS destino,
    d.descricao,
    l.cidade,
    l.siglaestado,
    l.rua,
    l.numero
FROM 
    Destino d
JOIN Localizacao l ON d.IdLocalizacao = l.IdLocalizacao;

CREATE VIEW View_FotosAssociadas AS
SELECT 
    f.IdFoto,
    f.Url,
    p.titulo AS post_titulo,
    d.nome AS destino
FROM 
    Foto f
JOIN Post p ON f.IdPost = p.IdPost
JOIN Destino d ON p.IdDestino = d.IdDestino;

CREATE VIEW View_DestinosPopulares AS
SELECT 
    d.IdDestino,
    d.nome AS destino,
    COUNT(c.IdComentario) AS total_comentarios
FROM 
    Destino d
JOIN Post p ON d.IdDestino = p.IdDestino
JOIN Comentario c ON p.IdPost = c.IdPost
GROUP BY 
    d.IdDestino, d.nome
ORDER BY 
    total_comentarios DESC;
    
    
CREATE VIEW View_UsuariosCurtidas AS
SELECT 
    u.IdUsuario,
    u.nome AS usuario,
    SUM(c.numcurtidas) AS total_curtidas
FROM 
    Usuario u
JOIN Comentario c ON u.IdUsuario = c.IdUsuario
GROUP BY 
    u.IdUsuario, u.nome
ORDER BY 
    total_curtidas DESC;
    
CREATE VIEW View_PostsRecentes AS
SELECT 
    p.IdPost,
    p.titulo,
    p.conteudo,
    p.datapublicacao,
    d.nome AS destino
FROM 
    Post p
JOIN Destino d ON p.IdDestino = d.IdDestino
ORDER BY 
    p.datapublicacao DESC
LIMIT 5;

CREATE VIEW View_ResumoComentarios AS
SELECT 
    p.IdPost,
    p.titulo,
    COUNT(c.IdComentario) AS total_comentarios,
    SUM(c.numcurtidas) AS total_curtidas
FROM 
    Post p
LEFT JOIN Comentario c ON p.IdPost = c.IdPost
GROUP BY 
    p.IdPost, p.titulo;
    
CREATE VIEW View_ComentariosMaisCurtidos AS
SELECT 
    c.IdComentario,
    c.conteudo AS Comentario,
    c.numcurtidas AS Curtidas,
    c.data_hora AS DataHora,
    u.nome AS Autor,
    p.titulo AS Post
FROM 
    Comentario c
JOIN 
    Usuario u ON c.IdUsuario = u.IdUsuario
JOIN 
    Post p ON c.IdPost = p.IdPost
ORDER BY 
    c.numcurtidas DESC;

ALTER TABLE Post ADD IdUsuario INT(10);
ALTER TABLE Post ADD FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario);

CREATE VIEW View_UsuariosComPostagens AS
SELECT 
    u.IdUsuario,
    u.nome AS NomeUsuario,
    COUNT(p.IdPost) AS TotalPostagens
FROM 
    Usuario u
LEFT JOIN 
    Post p ON u.IdUsuario = p.IdUsuario
GROUP BY 
    u.IdUsuario, u.nome
ORDER BY 
    TotalPostagens DESC;
