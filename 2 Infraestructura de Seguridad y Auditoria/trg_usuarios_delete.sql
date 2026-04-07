DELIMITER //

CREATE TRIGGER trg_usuarios_delete
AFTER DELETE ON cat_usuarios
FOR EACH ROW
BEGIN
    IF @id_usuario_activo IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SEGURIDAD: Sesion no iniciada';
    END IF;

    INSERT INTO log_auditoria (operacion, esquema_afectado, objeto_afectado, id_usuario_app, dato_anterior)
    VALUES ('DELETE', DATABASE(), 'cat_usuarios', @id_usuario_activo, 
            JSON_OBJECT('id', OLD.id_usuario, 'user', OLD.username));
END //

DELIMITER ;