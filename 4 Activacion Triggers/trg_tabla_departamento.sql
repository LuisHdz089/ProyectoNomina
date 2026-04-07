DELIMITER //
CREATE TRIGGER tr_aud_depto_ai AFTER INSERT ON departamento FOR EACH ROW
BEGIN CALL sp_auditar_registro('INSERT', 'departamento', NULL, JSON_OBJECT('id', NEW.c_departamento, 'nom', NEW.nombre_departamento)); END //

CREATE TRIGGER tr_aud_depto_au AFTER UPDATE ON departamento FOR EACH ROW
BEGIN CALL sp_auditar_registro('UPDATE', 'departamento', JSON_OBJECT('nom', OLD.nombre_departamento), JSON_OBJECT('nom', NEW.nombre_departamento)); END //

CREATE TRIGGER tr_aud_depto_ad AFTER DELETE ON departamento FOR EACH ROW
BEGIN CALL sp_auditar_registro('DELETE', 'departamento', JSON_OBJECT('id', OLD.c_departamento), NULL); END //
DELIMITER ;
