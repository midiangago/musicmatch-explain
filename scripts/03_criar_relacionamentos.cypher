
 // MusicMatch Explain
 // 03 - Criacao dos relacionamentos
 // Total esperado: 35 relacionamentos

// ==================================
// MUSICAS E ARTISTAS
// ==================================

UNWIND [
  {musica: 1, artista: 1},
  {musica: 2, artista: 1},
  {musica: 3, artista: 2},
  {musica: 4, artista: 2},
  {musica: 5, artista: 3},
  {musica: 6, artista: 3},
  {musica: 7, artista: 4},
  {musica: 8, artista: 4},
  {musica: 9, artista: 5},
  {musica: 10, artista: 6}
] AS dados

MATCH (m:Musica {id: dados.musica})
MATCH (a:Artista {id: dados.artista})

MERGE (m)-[:INTERPRETADA_POR]->(a);

// ==================================
// MUSICAS E GENEROS
// ==================================

UNWIND [
  {musica: 1, genero: 'Rock'},
  {musica: 2, genero: 'Rock'},
  {musica: 3, genero: 'Pop'},
  {musica: 4, genero: 'Pop'},
  {musica: 5, genero: 'Pop'},
  {musica: 6, genero: 'Pop'},
  {musica: 7, genero: 'Rock'},
  {musica: 8, genero: 'Rock'},
  {musica: 9, genero: 'Sertanejo'},
  {musica: 10, genero: 'Eletronica'}
] AS dados

MATCH (m:Musica {id: dados.musica})
MATCH (g:Genero {nome: dados.genero})

MERGE (m)-[:PERTENCE_A]->(g);

// ==================================
// HISTORICO DE REPRODUCOES
// ==================================

UNWIND [
  {usuario: 1, musica: 1, reproducoes: 20, nota: 5},
  {usuario: 1, musica: 2, reproducoes: 15, nota: 4},
  {usuario: 1, musica: 3, reproducoes: 12, nota: 5},
  {usuario: 1, musica: 7, reproducoes: 10, nota: 4},

  {usuario: 2, musica: 1, reproducoes: 18, nota: 5},
  {usuario: 2, musica: 2, reproducoes: 14, nota: 4},
  {usuario: 2, musica: 3, reproducoes: 22, nota: 5},
  {usuario: 2, musica: 4, reproducoes: 17, nota: 5},
  {usuario: 2, musica: 8, reproducoes: 11, nota: 4},

  {usuario: 3, musica: 3, reproducoes: 16, nota: 5},
  {usuario: 3, musica: 4, reproducoes: 19, nota: 5},
  {usuario: 3, musica: 5, reproducoes: 13, nota: 4},
  {usuario: 3, musica: 6, reproducoes: 10, nota: 5},
  {usuario: 3, musica: 9, reproducoes: 8, nota: 4},
  {usuario: 3, musica: 10, reproducoes: 7, nota: 4}
] AS dados

MATCH (u:Usuario {id: dados.usuario})
MATCH (m:Musica {id: dados.musica})

MERGE (u)-[r:OUVIU]->(m)
SET r.reproducoes = dados.reproducoes,
    r.nota = dados.nota;
