.mode columns
.headers on
.nullvalue NULL

--10 Jogadores com mais pontos no campeonato no ano de 2021

SELECT DISTINCT j.nr_licenca as LICENÇA, j.nome_jogador as NOME, j.pontos_marcados as PONTOS, cl.nome_clube as CLUBE, ca.ano as ANO
FROM Jogador j JOIN Contrato c ON j.nr_licenca = c.nr_licenca
JOIN Clube cl ON c.nome_clube = cl.nome_clube
JOIN Jogo j ON (cl.nome_clube = j.visitante OR cl.nome_clube = j.visitado)
JOIN Campeonato ca ON j.ano = ca.ano
WHERE ca.ano = 2021
ORDER BY pontos_marcados DESC, nome_jogador
LIMIT 10;