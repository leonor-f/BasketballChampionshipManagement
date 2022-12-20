.mode columns
.headers on
.nullvalue NULL

SELECT nr_licenca as LICENÇA, pontos_marcados as PONTOS from Jogador limit 2;
INSERT INTO Ponto (id_ponto, quantidade, nr_licenca, id_evento) VALUES (6, 3, 272930, 38);
SELECT nr_licenca as LICENÇA, pontos_marcados as PONTOS from Jogador limit 2;