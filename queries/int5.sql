.mode columns
.headers on
.nullvalue NULL

--Jogador com mais participações em eventos e estejam presentes em ambas as tabelas no ano de 2021

with substituicoes as (SELECT j.nr_licenca as licenca, j.nome_jogador as nome, COUNT(*) as subs
FROM Jogador j JOIN Substituicao s ON (j.nr_licenca = s.jogador_entrou OR j.nr_licenca = s.jogador_saiu)
JOIN Evento e ON s.id_evento = e.id_evento
JOIN Jogo j ON e.id_jogo = j.id_jogo
JOIN Campeonato ca ON j.ano = ca.ano
WHERE ca.ano = 2021
GROUP BY j.nr_licenca), 

ponts as (SELECT j.nr_licenca as licenca, j.nome_jogador as nome, COUNT(*) as points
FROM Jogador j JOIN Ponto p ON p.nr_licenca = j.nr_licenca
JOIN Evento e ON p.id_evento = e.id_evento
JOIN Jogo j ON e.id_jogo = j.id_jogo
JOIN Campeonato ca ON j.ano = ca.ano
JOIN Contrato c ON j.nr_licenca = c.nr_licenca
JOIN Clube cl ON c.nome_clube = cl.nome_clube
WHERE ca.ano = 2021
GROUP BY j.nr_licenca)

SELECT licenca as LICENÇA, nome as NOME, max(eventocount) as EVENTOS
FROM(SELECT sub.licenca as licenca, sub.nome as nome, (sub.subs + po.points) as eventocount
FROM substituicoes sub, ponts po
WHERE sub.licenca = po.licenca);