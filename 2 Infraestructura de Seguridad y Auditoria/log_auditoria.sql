CREATE TABLE log_auditoria (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_bd VARCHAR(100) DEFAULT (CURRENT_USER()),
    id_usuario_app SMALLINT UNSIGNED, 
    ip_cliente VARCHAR(45) DEFAULT (SUBSTRING_INDEX(USER(), '@', -1)),
    id_sesion BIGINT UNSIGNED DEFAULT (CONNECTION_ID()),
    operacion VARCHAR(50),          -- 'INSERT', 'UPDATE', 'DELETE'
    esquema_afectado VARCHAR(100),   -- Nombre de la BD
    objeto_afectado VARCHAR(100),    -- Nombre de la Tabla
    query_ejecutada VARCHAR(2048),
    dato_anterior JSON,
    dato_nuevo JSON
) ENGINE=InnoDB;