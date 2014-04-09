--------------------------------------------------------
-- Archivo creado  - viernes-septiembre-14-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CREA_RESTRICCION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LBD12_74894088"."CREA_RESTRICCION" (tabla varchar2) return clob is

  programa clob;
  cursor c is select * from user_constraints where table_name = tabla;
  type DinCurTyp is ref cursor;
  cursor_dinamico DinCurTyp;
  nombre user_cons_columns.column_name%type;
  
begin
  programa := '';
  for t in c loop
    programa := programa || chr(13) || '<restricción nombre="' || t.constraint_name 
      || '" propietario="' || t.owner || '" tabla="' || tabla || '">' || chr(13);
    
    open cursor_dinamico for 'select column_name from user_cons_columns UCC
        where UCC.constraint_name = ''' || t.constraint_name ||'''';
      
    if t.constraint_type = 'P' then 
    
      programa := programa || chr(9) || '<clave_primaria>' || chr(13);
      
      loop
        fetch cursor_dinamico into nombre;
        exit when cursor_dinamico%NOTFOUND;
        
        programa := programa || crea_atributo(nombre);
      end loop;
      
      programa := programa || chr(9) || '</clave_primaria>' || chr(13);
      
    elsif t.constraint_type = 'U' then 
    
      programa := programa || chr(9) || '<unica>' || chr(13);
      
      loop
        fetch cursor_dinamico into nombre;
        exit when cursor_dinamico%NOTFOUND;
        
        programa := programa || crea_atributo(nombre);
      end loop;
        
      programa := programa || chr(9) || '</unica>' || chr(13);
      
    elsif t.constraint_type = 'R' then 
    
      programa := programa || chr(9) || '<clave_foranea' 
        || ' r_propietario="' || t.r_owner
        || '" r_nombre_restriccion="' || t.r_constraint_name || '">' || chr(13);

      loop
        fetch cursor_dinamico into nombre;
        exit when cursor_dinamico%NOTFOUND;
        
        programa := programa || crea_atributo(nombre);
        
      end loop;
        
      programa := programa || chr(9) || '</clave_foranea>' || chr(13);
      
    elsif t.constraint_type = 'C' then 
    
      programa := programa || chr(9) || '<comprobacion>' || chr(13);
      programa := programa || chr(9) || chr(9) || '<condicion>' || chr(13);
      programa := programa || chr(9) || chr(9) || chr(9) || t.search_condition || chr(13); 
      programa := programa || chr(9) || chr(9) || '</condicion>' || chr(13);
      programa := programa || chr(9) || '</comprobacion>' || chr(13);
      
    end if;
    
    close cursor_dinamico;
  
    programa := programa || '</restricción>';  
  end loop;
  
  return programa;
end;

/
