DROP TABLE IF EXISTS detalle_nomina;

CREATE TABLE detalle_nomina (
    c_detalle_nomina    INT NOT NULL AUTO_INCREMENT,
    c_comprobante       INT NOT NULL,
    c_concepto          SMALLINT,
    monto_detalle       DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (c_detalle_nomina, c_comprobante)
) ENGINE=InnoDB
PARTITION BY RANGE (c_comprobante) (
    PARTITION p_bloque1 VALUES LESS THAN (5000),
    PARTITION p_bloque2 VALUES LESS THAN (10000),
    PARTITION p_bloque_max VALUES LESS THAN MAXVALUE
);