DELIMITER //
CREATE TRIGGER tr_aud_empresa_ai AFTER INSERT ON empresa FOR EACH ROW
BEGIN CALL sp_auditar_registro('INSERT', 'empresa', NULL, JSON_OBJECT('rfc', NEW.rfc_empresa, 'nom', NEW.nombre_empresa)); END //

CREATE TRIGGER tr_aud_empresa_au AFTER UPDATE ON empresa FOR EACH ROW
BEGIN CALL sp_auditar_registro('UPDATE', 'empresa', JSON_OBJECT('rfc', OLD.rfc_empresa), JSON_OBJECT('rfc', NEW.rfc_empresa)); END //

CREATE TRIGGER tr_aud_empresa_ad AFTER DELETE ON empresa FOR EACH ROW
BEGIN CALL sp_auditar_registro('DELETE', 'empresa', JSON_OBJECT('rfc', OLD.rfc_empresa), NULL); END //
DELIMITER ;
