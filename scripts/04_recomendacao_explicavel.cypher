
 // ============================================
 // MUSICMATCH EXPLAIN
 // 04 - Algoritmo de recomendacao explicavel
 // ============================================

 // Usuario de exemplo: Bruno (ID 2)

MATCH (alvo:Usuario {id: 2})
      -[:OUVIU]->(comum:Musica)
      <-[:OUVIU]-(similar:Usuario)

WHERE similar <> alvo

// Calcula as musicas compartilhadas
WITH alvo, similar,
     collect(DISTINCT comum.titulo) AS musicas_comuns

// Encontra novas musicas para recomendar
MATCH (similar)-[:OUVIU]->(sugestao:Musica)

WHERE NOT EXISTS {
    MATCH (alvo)-[:OUVIU]->(sugestao)
}

// Agrupa as justificativas
WITH sugestao,
     collect({
         usuario: similar.nome,
         musicas: musicas_comuns,
         quantidade: size(musicas_comuns)
     }) AS justificativas,
     sum(size(musicas_comuns)) AS pontuacao

// Retorna recomendacoes explicaveis
RETURN sugestao.titulo AS recomendacao,
       pontuacao,
       [j IN justificativas |
           j.usuario + ' ouviu esta musica e compartilha ' +
           toString(j.quantidade) +
           ' musicas com voce: ' +
           reduce(texto = '', musica IN j.musicas |
               texto +
               CASE
                   WHEN texto = '' THEN ''
                   ELSE ', '
               END +
               musica
           )
       ] AS explicacoes

ORDER BY pontuacao DESC,
         recomendacao ASC;
