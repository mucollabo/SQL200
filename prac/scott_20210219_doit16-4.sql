set serveroutput on;

declare
    v_number    number := 13;
begin
    if mod(v_number, 2) = 1 then
        dbms_output.put_line('V_NUMBER는 홀수입니다!');
    end if;
end;
/

declare
    v_number    number := 14;
begin
    if mod(v_number, 2) = 1 then
        dbms_output.put_line('V_NUMBER는 홀수입니다!');
    end if;
end;
/

declare
    v_number    number := 14;
begin
    if mod(v_number, 2) = 1 then
        dbms_output.put_line('V_NUMBER는 홀수입니다!');
    else
        dbms_output.put_line('V_NUMBER는 짝수입니다!');
    end if;
end;
/

declare
    v_score number := 87;
begin
    if v_score >= 90 then
        dbms_output.put_line('A학점');
    ELSIF v_score >= 80 then
        dbms_output.put_line('B학점');
    ELSIF v_score >= 70 then
        dbms_output.put_line('C학점');
    ELSIF v_score >= 60 then
        dbms_output.put_line('D학점');
    ELSE
        dbms_output.put_line('F학점');
    end if;
end;
/

declare
    v_score number := 87;
begin
    case trunc(v_score/10)
        when 10 then dbms_output.put_line('A학점');
        when 9 then dbms_output.put_line('A학점');
        when 8 then dbms_output.put_line('B학점');
        when 7 then dbms_output.put_line('C학점');
        when 6 then dbms_output.put_line('D학점');
        ELSE dbms_output.put_line('F학점');
    end case;
end;
/

declare
    v_score number := 87;
begin
    case
        when v_score >= 90 then dbms_output.put_line('A학점');
        when v_score >= 80 then dbms_output.put_line('B학점');
        when v_score >= 70 then dbms_output.put_line('C학점');
        when v_score >= 60 then dbms_output.put_line('D학점');
        ELSE dbms_output.put_line('F학점');
    end case;
end;
/

declare
    v_num   number := 0;
begin
    loop
        dbms_output.put_line('현재 V_NUM : ' || v_num);
        v_num := v_num + 1;
        exit when v_num > 100;
    end loop;
end;
/

declare
    v_num   number := 0;
begin
    loop
        dbms_output.put_line('현재 V_NUM : ' || v_num);
        v_num := v_num + 1;
        if v_num > 100 then
            exit;
        end if;
    end loop;
end;
/

declare
    v_num number := 0;
begin
    while v_num < 4 loop
        dbms_output.put_line('현재 V_NUM : ' || v_num);
        v_num := v_num + 1;
    end loop;
end;
/

begin
    for i in 0..4 loop
        dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/

begin
    for i in reverse 0..10 loop
        dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/

begin
    for i in 0..10 loop
        if mod(i, 2) = 1 then
            dbms_output.put_line('현재의 i의 값 : ' || i);
        end if;
    end loop;
end;
/

declare
    v_deptno dept.deptno%type := 10;
begin
    case v_deptno
        when 10 then dbms_output.put_line('DNAME : ACCOUNTING');
        when 10 then dbms_output.put_line('DNAME : RESEARCH');
        when 10 then dbms_output.put_line('DNAME : SALES');
        when 10 then dbms_output.put_line('DNAME : OPERATIONS');
        else         dbms_output.put_line('DNAME : N/A');
    end case;
end;
/

commit;
