
 // MusicMatch Explain
 // 01 - Criacao do modelo do grafo
 // Regras de unicidade

CREATE CONSTRAINT usuario_id IF NOT EXISTS
FOR (u:Usuario)
REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT musica_id IF NOT EXISTS
FOR (m:Musica)
REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT artista_id IF NOT EXISTS
FOR (a:Artista)
REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT genero_nome IF NOT EXISTS
FOR (g:Genero)
REQUIRE g.nome IS UNIQUE;
