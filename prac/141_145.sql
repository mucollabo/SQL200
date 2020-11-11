set SERVEROUTPUT ON
SET verify off
accept  p_num   prompt '숫자를 입력하세요~ '
BEGIN
    if mod(&p_num, 2) = 0 then
        dbms_output.put_line('짝수입니다.');
    else
        dbms_output.put_line('홀수입니다.');
    end if;
end;
/

