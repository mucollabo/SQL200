set serveroutput on
set verify off
accept p_ename prompt '��� �̸��� �Է��ϼ��� ~ '
declare  
     v_ename  emp.ename%type := upper('&p_ename');
     v_sal     emp.sal%type;  

 begin  
    select  sal  into  v_sal 
      from  emp
      where ename = v_ename;
     
    if   v_sal >= 3000  then 
         dbms_output.put_line('��ҵ��� �Դϴ�.');
    elsif   v_sal >= 2000  then 
        dbms_output.put_line('�߰� �ҵ��� �Դϴ�.');
    else  
        dbms_output.put_line('���ҵ��� �Դϴ�.');
     end  if;
end;
/
