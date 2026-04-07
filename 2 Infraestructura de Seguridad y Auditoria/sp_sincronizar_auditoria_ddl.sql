DELIMITER //

CREATE PROCEDURE proyectoabd.sp_sincronizar_auditoria_ddl()
BEGIN
    -- Insertamos en tu tabla log_auditoria lo que encontramos en el log general
    INSERT INTO proyectoabd.log_auditoria (
        fecha_hora, 
        operacion, 
        objeto_afectado, 
        query_ejecutada, 
        usuario_bd
    )
    SELECT 
        fecha, 
        'DDL_DETECTED', 
        'ESQUEMA', 
        comando_ejecutado, 
        terminal
    FROM nomina.v_rastreo_ddl;

    -- OPCIONAL: Limpiar el log general para que no explote el disco
    -- SET GLOBAL general_log = 'OFF';
    -- TRUNCATE TABLE mysql.general_log;
    -- SET GLOBAL general_log = 'ON';
END //

DELIMITER ;
