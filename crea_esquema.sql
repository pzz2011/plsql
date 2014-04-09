--------------------------------------------------------
-- Archivo creado  - viernes-septiembre-14-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CREA_ESQUEMA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LBD12_74894088"."CREA_ESQUEMA" return clob is
  programa clob;
  cursor c is select * from user_tables;
begin
  programa := '<?xml version="1.0" encoding="UTF-8"?>' || chr(13) || 
    '<baseDeDatos xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="EsquemaBaseDeDatos.xsd">' || chr(13);
  for t in c loop
    programa := programa || crea_tabla(t.table_name) || chr(13);
  end loop;
  
  for t in c loop
    programa := programa || crea_restriccion(t.table_name) || chr(13);
  end loop;
  
  programa := programa || '</baseDeDatos>';

  return programa;
end;

/
