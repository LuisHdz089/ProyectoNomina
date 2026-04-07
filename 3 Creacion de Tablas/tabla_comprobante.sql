CREATE TABLE comprobante (
    c_comprobante          INT PRIMARY KEY,
    rfc_empleado           CHAR(13),
    fecha_pago             DATE NOT NULL,
    fecha_inicio_periodo   DATE NOT NULL,
    fecha_final_periodo    DATE NOT NULL,
    horas_trabajadas       SMALLINT NOT NULL,
    total_percepciones     DECIMAL(12,2) NOT NULL,
    total_deducciones      DECIMAL(12,2) NOT NULL,
    total_neto             DECIMAL(12,2) NOT NULL,
    tipo_nomina            SMALLINT NOT NULL,
    CONSTRAINT fk_comp_emp FOREIGN KEY (rfc_empleado) 
        REFERENCES empleado(rfc_empleado)
) ENGINE=InnoDB;
