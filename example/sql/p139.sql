set serveroutput on 
accept p_num1 prompt   'ù��° ���ڸ� �Է��ϼ��� ~ '
accept p_num2 prompt   '�ι�° ���ڸ� �Է��ϼ��� ~ '

declare  
         v_sum  number(10);
 begin
         v_sum := &p_num1 + &p_num2 ;

         dbms_output.put_line('������: ' ||  v_sum );
 end;
/
