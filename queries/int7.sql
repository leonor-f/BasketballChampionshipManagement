.mode columns
.headers on
.nullvalue NULL

--média, máximo e mínimo de pontos dos jogadores cujo nome do treinador começa por "J"

select treinador TREINADOR, min(pontos_marcados) MIN_PONTOS, max(pontos_marcados) MAX_PONTOS, ROUND(avg(pontos_marcados),0) MEDIA_PONTOS
from Jogador, Contrato, Clube
where Jogador.nr_licenca = Contrato.nr_licenca and Contrato.nome_clube = Clube.nome_clube and Clube.treinador like "J%"
group by 1;