set serveroutput on
set verify off
accept p_num1 prompt '�ؼ��� �Է��Ͻÿ� ~'
accept p_num2 prompt '������ �Է��Ͻÿ� ~'

declare                            
  v_result  number(10) := 1;
  v_num2  number(10) := &p_num1;
  v_count  number(10) := 0; 
begin
     loop
         v_count := v_count + 1; 
         v_result := v_result * v_num2 ;
         exit when v_count = &p_num2;
     end loop;
         dbms_output.put_line(v_result);
end;
/
