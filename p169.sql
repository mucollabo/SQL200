set serveroutput on 
accept p_a prompt '������ ���ڸ� �Է��ϼ��� ~'
accept p_b prompt '������ ���ڸ� �Է��ϼ��� ~'

begin 
   for  i  in  1 .. &p_b loop
      dbms_output.put_line( lpad('��',&p_a,'��') );
   end loop;
end;
/
