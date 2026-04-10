CREATE OR REPLACE VIEW proyectoabd.vw_conceptos_percepciones AS
SELECT 
    c_concepto, 
    nombre_concepto, 
    tipo_concepto
FROM proyectoabd.concepto
WHERE tipo_concepto = 'Percepción';