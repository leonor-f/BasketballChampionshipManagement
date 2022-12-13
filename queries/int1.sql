.mode columns
.headers on
.nullvalue NULL

--Jogadores que pertencem ao clube cuja pavilhão tem a letra e no nome

SELECT j.nr_licenca as LICENÇA, j.nome_jogador as JOGADOR, c.nome_clube as CLUBE, p.id_pavilhao as PAVILHÃO
FROM Jogador j
JOIN Contrato con ON j.nr_licenca = con.nr_licenca 
JOIN Clube c ON c.nome_clube = con.nome_clube
JOIN Pavilhao p ON p.nome_clube = c.nome_clube
WHERE p.id_pavilhao like '%e%'