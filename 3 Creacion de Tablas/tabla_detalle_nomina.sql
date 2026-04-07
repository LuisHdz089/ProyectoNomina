CREATE TABLE detalle_nomina (
    c_detalle_nomina    INT AUTO_INCREMENT PRIMARY KEY,
    c_comprobante       INT,
    c_concepto          SMALLINT,
    monto_detalle       DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_det_comp FOREIGN KEY (c_comprobante) 
        REFERENCES comprobante(c_comprobante),
    CONSTRAINT fk_det_conc FOREIGN KEY (c_concepto) 
        REFERENCES concepto(c_concepto)
) ENGINE=InnoDB;
