.mode columns
.headers on
.nullvalue NULL

--top 3 jogadores que estiveram presentes numa substituição mais vezes no campeonato do ano de 2021

SELECT j.nr_licenca as LICENÇA, j.nome_jogador as NOME, COUNT(*) as SUBSTITUIÇÕES, cl.nome_clube as CLUBE, ca.ano as ANO
FROM Jogador j JOIN Substituicao s ON (j.nr_licenca = s.jogador_entrou OR j.nr_licenca = s.jogador_saiu)
JOIN Evento e ON s.id_evento = e.id_evento
JOIN Jogo j ON e.id_jogo = j.id_jogo
JOIN Campeonato ca ON j.ano = ca.ano
JOIN Contrato c ON j.nr_licenca = c.nr_licenca
JOIN Clube cl ON c.nome_clube = cl.nome_clube
WHERE ca.ano = 2021
GROUP BY j.nr_licenca
ORDER BY COUNT(*) DESC, nome_jogador
LIMIT 3;