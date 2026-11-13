
 // ============================================
 // MUSICMATCH EXPLAIN
 // 05 - Consultas analiticas
 // ============================================

 // CONSULTA 1 - Musicas mais reproduzidas

MATCH (u:Usuario)-[r:OUVIU]->(m:Musica)
RETURN m.titulo AS musica,
       sum(r.reproducoes) AS total_reproducoes,
       count(DISTINCT u) AS total_usuarios
ORDER BY total_reproducoes DESC;


// CONSULTA 2 - Artistas mais populares

MATCH (u:Usuario)-[r:OUVIU]->(m:Musica)
      -[:INTERPRETADA_POR]->(a:Artista)
RETURN a.nome AS artista,
       sum(r.reproducoes) AS total_reproducoes,
       count(DISTINCT u) AS ouvintes
ORDER BY total_reproducoes DESC;


// CONSULTA 3 - Generos mais ouvidos

MATCH (u:Usuario)-[r:OUVIU]->(m:Musica)
      -[:PERTENCE_A]->(g:Genero)
RETURN g.nome AS genero,
       sum(r.reproducoes) AS reproducoes,
       count(DISTINCT u) AS ouvintes
ORDER BY reproducoes DESC;


// CONSULTA 4 - Usuarios mais ativos

MATCH (u:Usuario)-[r:OUVIU]->(m:Musica)
RETURN u.nome AS usuario,
       count(DISTINCT m) AS musicas_diferentes,
       sum(r.reproducoes) AS total_reproducoes
ORDER BY total_reproducoes DESC;


// CONSULTA 5 - Resumo do banco

MATCH (n)
WITH count(n) AS total_nos
MATCH ()-[r]->()
RETURN total_nos,
       count(r) AS total_relacionamentos;
