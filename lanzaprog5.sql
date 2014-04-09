--------------------------------------------------------
-- Archivo creado  - viernes-septiembre-14-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure LANZAPROG5
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "LBD12_74894088"."LANZAPROG5" is
    v CLOB;
    BEGIN
      SELECT crea_esquema into v FROM DUAL;
      DBMS_OUTPUT.PUT_LINE(v);
    
    END;

/
