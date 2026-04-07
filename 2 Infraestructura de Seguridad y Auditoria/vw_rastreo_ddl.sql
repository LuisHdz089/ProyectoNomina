CREATE OR REPLACE VIEW proyectoabd.v_rastreo_ddl AS
SELECT 
    event_time AS fecha,
    user_host AS terminal,
    argument AS comando_ejecutado
FROM mysql.general_log
WHERE (argument LIKE 'CREATE%' 
   OR argument LIKE 'ALTER%' 
   OR argument LIKE 'DROP%'
   OR argument LIKE 'TRUNCATE%')
   AND command_type = 'Query'
   AND argument NOT LIKE '%mysql.general_log%'; 
