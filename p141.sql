set serveroutput on
set verify off
accept   p_num   prompt  '���ڸ� �Է��ϼ��� ~  '
begin
if   mod(&p_num,2) = 0  then
        dbms_output.put_line('¦���Դϴ�.');
    else  
        dbms_output.put_line('Ȧ���Դϴ�.');
end if;
end;
/
