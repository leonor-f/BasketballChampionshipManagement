CREATE TRIGGER teamCapacityCheck
BEFORE INSERT ON EstatisticasClube
FOR EACH ROW
WHEN ((SELECT COUNT(*) FROM EstatisticasClube WHERE ano = 2022) >= 12)
BEGIN
	Select Raise( ABORT, 'Cannot add a team because the championship is already full');
END;