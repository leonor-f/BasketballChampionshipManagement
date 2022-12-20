.mode columns
.headers on
.nullvalue NULL

--todos os jogos no ano de 2021 onde não estiveram presentes jogadores brasileiros

select id_jogo ID_JOGO, jornada JORNADA, data_jogo DATA, resultado RESULTADO, fase FASE
from Jogo, Clube, Contrato, Campeonato, Jogador
where Jogo.ano = Campeonato.ano and Campeonato.ano = 2021
and (Jogo.visitante = Clube.nome_clube or Jogo.visitado = Clube.nome_clube)
and Clube.nome_clube = Contrato.nome_clube
and Contrato.nr_licenca = Jogador.nr_licenca and Jogador.nacionalidade <> "BRASIL";