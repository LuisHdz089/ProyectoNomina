DELIMITER //
CREATE PROCEDURE sp_login_nomina(IN p_user VARCHAR(50), IN p_pass VARCHAR(64))
BEGIN
    DECLARE v_id SMALLINT;
    SELECT id_usuario INTO v_id 
    FROM cat_usuarios 
    WHERE username = p_user AND password_hash = p_pass;
    IF v_id IS NOT NULL THEN
        SET @id_usuario_activo = v_id;
        SELECT 'Sesion iniciada' AS mensaje;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acceso denegado';
    END IF;
END //
DELIMITER ;
