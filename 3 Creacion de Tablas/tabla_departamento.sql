CREATE TABLE departamento (
    c_departamento      SMALLINT PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL,
    rfc_empresa         CHAR(13),
    CONSTRAINT fk_dept_empresa FOREIGN KEY (rfc_empresa) 
        REFERENCES empresa(rfc_empresa) ON DELETE CASCADE
) ENGINE=InnoDB;
