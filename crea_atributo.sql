--------------------------------------------------------
-- Archivo creado  - viernes-septiembre-14-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CREA_ATRIBUTO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LBD12_74894088"."CREA_ATRIBUTO" (nombre varchar2) return varchar2 is
  programa varchar2(32767);
begin
  programa := programa || chr(9) || chr(9) || '<atributo>' || chr(13);
  programa := programa || chr(9) || chr(9) || chr(9) || nombre || chr(13);
  programa := programa || chr(9) || chr(9) || '</atributo>' || chr(13);
  
  return programa;
end;

/
