set serveroutput on
set verify off
accept p_num1 prompt '�ؼ��� �Է��ϼ��� ~ '
accept p_num2 prompt '������ �Է��ϼ��� ~ '

declare                                  
        v_num1   number(10) := &p_num1; 
        v_num2   number(10) := &p_num2;
        v_count   number(10) := 0;
        v_result   number(10) := 1; 
begin 
    loop 
        v_count := v_count + 1; 
        v_result := v_result * v_num1;
        exit when v_result = v_num2;
    end loop;
        dbms_output.put_line(v_count);
end;
/
