.mode columns
.headers on
.nullvalue NULL

--Capacidade média dos pavilhões por Grupo

SELECT g.letra as GRUPO, ROUND(AVG(p.capacidade), 0) as MÉDIA
FROM Grupo g
JOIN Clube c ON g.nome_clube = c.nome_clube
JOIN Pavilhao p ON p.nome_clube = c.nome_clube
GROUP BY g.letra