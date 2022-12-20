CREATE TRIGGER AddPonto
AFTER INSERT ON Ponto
FOR EACH ROW
BEGIN
    UPDATE Jogador SET pontos_marcados = pontos_marcados + new.quantidade WHERE nr_licenca = new.nr_licenca;
END;