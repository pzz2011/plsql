--------------------------------------------------------
-- Archivo creado  - viernes-septiembre-14-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CREA_TABLA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LBD12_74894088"."CREA_TABLA" (tabla varchar2) return clob is
   programa clob;
   cursor c is select * from user_tab_columns where table_name = tabla;
begin
  programa := chr(13) || '<tabla nombre="' || tabla || '">';
  for t in c loop
    programa := programa || chr(13) || chr(9) ||
      '<atributo nombre="' || t.column_name || '" tipo="' || t.data_type || 
      '" obligatorio="';
      if t.nullable = 'Y' then programa := programa || 'false';
      elsif t.nullable = 'N' then programa := programa || 'true';
      end if;
      
      programa := programa || '"/>';
  end loop;
  
  programa := programa || chr(13) || '</tabla>';
  
  return programa;
end;

/
