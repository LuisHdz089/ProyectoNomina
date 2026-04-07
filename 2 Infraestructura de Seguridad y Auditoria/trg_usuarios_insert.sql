DELIMITER //

CREATE TRIGGER trg_usuarios_insert
AFTER INSERT ON cat_usuarios
FOR EACH ROW
BEGIN
    IF @id_usuario_activo IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SEGURIDAD: Sesion no iniciada';
    END IF;

    INSERT INTO log_auditoria (operacion, esquema_afectado, objeto_afectado, id_usuario_app, dato_nuevo)
    VALUES ('INSERT', DATABASE(), 'cat_usuarios', @id_usuario_activo, 
            JSON_OBJECT('id', NEW.id_usuario, 'user', NEW.username));
END //

DELIMITER ;
