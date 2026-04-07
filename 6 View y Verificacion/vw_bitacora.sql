CREATE OR REPLACE VIEW vista_bitacora AS
SELECT 
    id,               -- Folio único del log
    fecha_hora,       -- Timestamp del evento
    usuario_bd,       -- Quién entró a MySQL (ej: root@localhost)
    id_usuario_app,   -- Quién entró a tu Aplicación (vía @id_usuario_activo)
    ip_cliente,       -- La IP real que capturamos con SUBSTRING_INDEX
    operacion,        -- INSERT, UPDATE o DELETE
    objeto_afectado,  -- Nombre de la tabla (ej: 'empleado')
    dato_anterior,    -- JSON con los datos viejos
    dato_nuevo        -- JSON con los datos nuevos
FROM log_auditoria 
ORDER BY fecha_hora DESC;