set serveroutput on
set verify off
accept p_num prompt '�������� ������ ���ڵ��� ������ �Է��ϼ��� ~'
accept p_a prompt '�˻��� ���ڸ� �Է��ϼ��� ~ '

declare

type array_t is varray(1000) of number(30);
array_s  array_t := array_t();
v_cnt  number(10) := &p_num; 
v_a  number(10) := &p_a;
v_chk  number(10) := 0;

begin

array_s.extend(v_cnt);

for i in 1 .. v_cnt loop 
    array_s(i) := round( dbms_random.value(1, v_cnt)) ;
    dbms_output.put(array_s(i) ||',');
end loop;
    dbms_output.new_line;

for i in array_s.first..array_s.last loop

 if v_a=array_s(i) then
     v_chk := 1;
dbms_output.put(i||'��°���� ���� '||v_a||'�� �߰��߽��ϴ�.');
 end if;

end loop;

	dbms_output.new_line;

if v_chk=0 then
 dbms_output.put_line('���ڸ� �߰����� ���߽��ϴ�.');
end if;

end;
/
