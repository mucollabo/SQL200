set serveroutput on
prompt  ������ ��ü�� ����մϴ�
begin 
  for  i  in  2 .. 9  loop
    for  j  in  1 .. 9  loop
      dbms_output.put_line (  i  || '  x  ' ||  j  || ' = ' ||  i * j ); 
    end loop;
  end loop;
end;
/
