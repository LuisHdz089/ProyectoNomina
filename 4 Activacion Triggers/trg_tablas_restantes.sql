DELIMITER //
-- Concepto
CREATE TRIGGER tr_aud_concepto_ai AFTER INSERT ON concepto FOR EACH ROW
BEGIN CALL sp_auditar_registro('INSERT', 'concepto', NULL, JSON_OBJECT('id', NEW.c_concepto, 'nom', NEW.nombre_concepto)); END //

-- Comprobante
CREATE TRIGGER tr_aud_comprobante_ai AFTER INSERT ON comprobante FOR EACH ROW
BEGIN CALL sp_auditar_registro('INSERT', 'comprobante', NULL, JSON_OBJECT('id', NEW.c_comprobante, 'total', NEW.total_neto)); END //

-- Detalle Nomina
CREATE TRIGGER tr_aud_detalle_ai AFTER INSERT ON detalle_nomina FOR EACH ROW
BEGIN CALL sp_auditar_registro('INSERT', 'detalle_nomina', NULL, JSON_OBJECT('id', NEW.c_detalle_nomina, 'monto', NEW.monto_detalle)); END //
DELIMITER ;
