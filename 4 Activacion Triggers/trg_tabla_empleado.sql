DELIMITER //
CREATE TRIGGER tr_aud_empleado_ai AFTER INSERT ON empleado FOR EACH ROW
BEGIN CALL sp_auditar_registro('INSERT', 'empleado', NULL, JSON_OBJECT('rfc', NEW.rfc_empleado, 'nom', NEW.nombre_empleado)); END //

CREATE TRIGGER tr_aud_empleado_au AFTER UPDATE ON empleado FOR EACH ROW
BEGIN CALL sp_auditar_registro('UPDATE', 'empleado', JSON_OBJECT('salario', OLD.salario_base), JSON_OBJECT('salario', NEW.salario_base)); END //

CREATE TRIGGER tr_aud_empleado_ad AFTER DELETE ON empleado FOR EACH ROW
BEGIN CALL sp_auditar_registro('DELETE', 'empleado', JSON_OBJECT('rfc', OLD.rfc_empleado), NULL); END //
DELIMITER ;
