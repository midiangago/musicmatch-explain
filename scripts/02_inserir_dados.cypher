
 // MusicMatch Explain
 // 02 - Cadastro dos dados iniciais
 // Dataset ficticio para demonstracao

// USUARIOS
UNWIND [
  {id: 1, nome: 'Ana', idade: 25},
  {id: 2, nome: 'Bruno', idade: 30},
  {id: 3, nome: 'Carla', idade: 28}
] AS dados
MERGE (u:Usuario {id: dados.id})
SET u.nome = dados.nome,
    u.idade = dados.idade;

// GENEROS MUSICAIS
UNWIND [
  'Rock', 'Pop', 'MPB',
  'Sertanejo', 'Eletronica'
] AS nome
MERGE (g:Genero {nome: nome});

// ARTISTAS
UNWIND [
  {id: 1, nome: 'Queen'},
  {id: 2, nome: 'Coldplay'},
  {id: 3, nome: 'Adele'},
  {id: 4, nome: 'Legiao Urbana'},
  {id: 5, nome: 'Marilia Mendonca'},
  {id: 6, nome: 'Alok'}
] AS dados
MERGE (a:Artista {id: dados.id})
SET a.nome = dados.nome;

// MUSICAS
UNWIND [
  {id: 1, titulo: 'Bohemian Rhapsody', ano: 1975},
  {id: 2, titulo: 'We Will Rock You', ano: 1977},
  {id: 3, titulo: 'Yellow', ano: 2000},
  {id: 4, titulo: 'Viva La Vida', ano: 2008},
  {id: 5, titulo: 'Hello', ano: 2015},
  {id: 6, titulo: 'Someone Like You', ano: 2011},
  {id: 7, titulo: 'Tempo Perdido', ano: 1986},
  {id: 8, titulo: 'Pais e Filhos', ano: 1989},
  {id: 9, titulo: 'Infiel', ano: 2016},
  {id: 10, titulo: 'Hear Me Now', ano: 2016}
] AS dados
MERGE (m:Musica {id: dados.id})
SET m.titulo = dados.titulo,
    m.ano = dados.ano;
