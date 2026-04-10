DROP TABLE IF EXISTS log_auditoria;

CREATE TABLE log_auditoria (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_bd VARCHAR(100) DEFAULT (CURRENT_USER()),
    id_usuario_app SMALLINT UNSIGNED, 
    ip_cliente VARCHAR(45) DEFAULT (SUBSTRING_INDEX(USER(), '@', -1)),
    id_sesion BIGINT UNSIGNED DEFAULT (CONNECTION_ID()),
    operacion VARCHAR(50),          
    esquema_afectado VARCHAR(100),   
    objeto_afectado VARCHAR(100),    
    query_ejecutada VARCHAR(2048),
    dato_anterior JSON,
    dato_nuevo JSON,
    PRIMARY KEY (id, fecha_hora) -- Obligatorio para particionar 
) ENGINE=InnoDB
PARTITION BY RANGE (YEAR(fecha_hora)) (
    PARTITION p_2025 VALUES LESS THAN (2026),
    PARTITION p_2026 VALUES LESS THAN (2027),
    PARTITION p_futuro VALUES LESS THAN MAXVALUE
);