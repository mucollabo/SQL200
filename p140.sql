set serveroutput  on
accept p_empno  prompt  '�����ȣ�� �Է��ϼ��� ~ '
  declare
          v_sal  number(10) ;
  begin 
         select sal into v_sal
           from emp
           where empno = &p_empno;

   dbms_output.put_line('�ش� ����� ������ ' || v_sal);
  
end;
/     
