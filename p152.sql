set serveroutput on
accept p_num  prompt  '���ڸ� �Է��ϼ��� ~ '

declare
v_num  number(10) := &p_num;

begin
   if  v_num >= 0  then
      dbms_output.put_line( v_num );
  else
     dbms_output.put_line( -1 * v_num );
  end if;
end;
/
