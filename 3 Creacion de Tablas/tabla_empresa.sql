CREATE TABLE empresa (
    rfc_empresa      CHAR(13) PRIMARY KEY,
    nombre_empresa   VARCHAR(100) NOT NULL,
    direccion_empresa VARCHAR(150)
) ENGINE=InnoDB;
