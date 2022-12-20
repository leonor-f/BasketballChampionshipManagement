.mode columns
.headers on
.nullvalue NULL

--pontos marcados e sofridos por grupo no campeonato do ano de 2021

SELECT g.letra as GRUPO, SUM(n_pontos_marcados) as 'PONTOS MARCADOS', SUM(e.n_pontos_sofridos) as 'PONTOS SOFRIDOS', ca.ano as ANO
FROM Grupo g 
JOIN Clube c ON g.nome_clube = c.nome_clube
JOIN EstatisticasClube e ON c.nome_clube = e.nome_clube
JOIN Campeonato ca ON e.ano = ca.ano
WHERE ca.ano = 2021
GROUP BY g.letra
ORDER BY g.letra;