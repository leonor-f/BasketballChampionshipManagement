.mode columns
.headers on
.nullvalue NULL

SELECT * FROM EstatisticasClube WHERE ano = 2022;
INSERT INTO EstatisticasClube(idEstatistica, nome_clube, ano, posicao, n_jogos, pontuacao, n_vitorias, n_derrotas, n_pontos_marcados, n_pontos_sofridos) VALUES (25,"Bom dia FC",2022,13,0,0,0,0,0,0);
SELECT * FROM EstatisticasClube WHERE ano = 2022;