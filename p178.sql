set serveroutput on 
set verify off
accept p_money prompt '�ܵ� ��ü �ݾ��� �Է��ϼ��� ~'
accept p_coin prompt '�ܵ� ������ �Է��ϼ��� ~ ' 

declare
   v_money number(10) := &p_money ;
   type array_t is varray(3) of number(10); 
   v_array array_t := array_t(&p_coin); 
   v_num array_t := array_t( 0, 0, 0);

begin
   for i in 1 .. v_array.count loop 
      if v_money >= v_array(i) then
         v_num(i) := trunc(v_money/v_array(i));
         v_money := mod(v_money,v_array(i));
     end if;
         dbms_output.put( v_array(i)||'���� ���� :' || v_num(i)||'��, ');
   end loop;
   dbms_output.new_line;
end;
/
