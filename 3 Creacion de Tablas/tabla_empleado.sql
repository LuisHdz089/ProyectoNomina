CREATE TABLE empleado (
    rfc_empleado        CHAR(13) PRIMARY KEY,
    curp_empleado       CHAR(18) NOT NULL,
    num_seguridad_social CHAR(11) NOT NULL,
    nombre_empleado      VARCHAR(100) NOT NULL,
    clave_bancaria      CHAR(18) NOT NULL,
    fecha_ingreso       DATE NOT NULL,
    salario_base        DECIMAL(12,2) NOT NULL,
    c_departamento      SMALLINT,
    CONSTRAINT fk_emp_dept FOREIGN KEY (c_departamento) 
        REFERENCES departamento(c_departamento)
) ENGINE=InnoDB;
