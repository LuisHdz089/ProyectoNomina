CREATE ROLE 'rol_admin_nomina', 'rol_consultor'; -- [cite: 68]
GRANT ALL PRIVILEGES ON proyectoabd.* TO 'rol_admin_nomina'; -- [cite: 70]
GRANT SELECT ON proyectoabd.vista_bitacora TO 'rol_consultor';