set serveroutput on
set verify off
accept p_num1 prompt ' �غ��� �Է��Ͻÿ� ~ '
accept p_num2 prompt ' ���̸� �Է��Ͻÿ� ~ '
accept p_num3 prompt ' ������ �Է��Ͻÿ� ~ ' 

begin 

   if power(&p_num1,2) + power(&p_num2,2) = power(&p_num3,2) 
   then
         dbms_output.put_line('���� �ﰢ���Դϴ�. ');

  else 
         dbms_output.put_line('���� �ﰢ���� �ƴմϴ�');

  end if; 
end;
/
