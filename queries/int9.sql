.mode columns
.headers on
.nullvalue NULL

--Percentagem de jogos que pertencem a cada fase na database atual

with phaseone as
(SELECT COUNT(*) as one FROM Jogo WHERE fase = '1'),

phasetwo as
(SELECT COUNT(*) as two FROM Jogo WHERE fase = '2'),

phasethree as 
(SELECT COUNT(*) as three FROM Jogo WHERE fase = 'Quartas' OR fase = 'Meias' OR fase = 'Final' or fase = 'Despromoção'),

totalcount as 
(SELECT COUNT(*) as total FROM Jogo)

SELECT ROUND((one*100.0/total),2) as '1ª fase', ROUND((two*100.0/total),2) as '2ª fase', ROUND((three*100.0/total),2) as 'Other'
FROM phaseone, phasetwo, phasethree, totalcount