DELIMITER //

DROP PROCEDURE IF EXISTS proyectoabd.sp_sincronizar_auditoria_ddl //

CREATE PROCEDURE proyectoabd.sp_sincronizar_auditoria_ddl()
BEGIN
INSERT INTO proyectoabd.log_auditoria (
    fecha_hora, 
    usuario_bd,
    query_ejecutada, -- Columna destino
    operacion,
    objeto_afectado
)
SELECT 
    fecha,
    terminal,
    CONVERT(comando_ejecutado USING utf8mb4), -- Fuente de la vista
    'DDL_DETECTED',
    'ESQUEMA'
FROM proyectoabd.v_rastreo_ddl;
END //

DELIMITER ;
