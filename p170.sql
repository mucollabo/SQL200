set serveroutput on
set verify off
accept p_num1 prompt '�غ��� ���̸� �Է��ϼ��� :  ' 
accept p_num2 prompt '���̸� �Է��ϼ��� :  '
accept p_num3 prompt '������ ���̸� �Է��ϼ��� :  '

declare 
	v_num1 number(10) :=&p_num1;
	v_num2 number(10) :=&p_num2;
	v_num3 number(10) :=&p_num3;

begin 
   if (v_num1)**2 + (v_num2)**2=(v_num3)**2 then
	dbms_output.put_line('���� �ﰢ���� �½��ϴ�');
   else 
	dbms_output.put_line('���� �ﰢ���� �ƴմϴ�');
   end if ;
end;
/
