.mode columns
.headers on
.nullvalue NULL

--média, máximo e mínimo de pontos e salário de cada jogador do clube FC Porto

select Jogador.nr_licenca LICENCA, nome_jogador NOME, min(pontos_marcados) MIN_PONTOS, max(pontos_marcados) MAX_PONTOS, ROUND(avg(pontos_marcados),0) MEDIA_PONTOS, salario SALARIO
from Jogador, Contrato, Clube
where Jogador.nr_licenca = Contrato.nr_licenca and Contrato.nome_clube = Clube.nome_clube and Clube.nome_clube = "FC Porto"
group by 1,2;