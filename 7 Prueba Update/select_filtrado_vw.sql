SELECT 
    fecha_hora, 
    id_usuario_app, 
    ip_cliente,         -- <--- Aquí está la IP capturada
    objeto_afectado, 
    dato_anterior, 
    dato_nuevo 
FROM vista_bitacora 
WHERE operacion = 'UPDATE' 
  AND objeto_afectado = 'empleado'
ORDER BY fecha_hora DESC 
LIMIT 1;