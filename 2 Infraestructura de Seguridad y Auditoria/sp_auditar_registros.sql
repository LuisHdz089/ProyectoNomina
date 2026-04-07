DELIMITER //

CREATE PROCEDURE sp_auditar_registro(
    IN p_operacion VARCHAR(10),
    IN p_tabla VARCHAR(100),
    IN p_anterior JSON,
    IN p_nuevo JSON
)
BEGIN
    -- Validar que exista un usuario activo en la sesión
    IF @id_usuario_activo IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'SEGURIDAD: Debe iniciar sesión con sp_login_nomina';
    END IF;

    -- Insertar el registro de auditoría
    INSERT INTO log_auditoria (
        operacion,
        esquema_afectado,
        objeto_afectado,
        id_usuario_app,
        dato_anterior,
        dato_nuevo
    )
    VALUES (
        p_operacion,
        DATABASE(),
        p_tabla,
        @id_usuario_activo,
        p_anterior,
        p_nuevo
    );
END //

DELIMITER ;
