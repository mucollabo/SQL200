create or replace function get_loc
(p_deptno   in  dept.deptno%type)
return  dept.loc%type
is
    v_loc   dept.loc%type;
begin
    select loc into v_loc
        from dept
        where deptno = p_deptno;
    return v_loc;
end;
/
select ename, get_loc(deptno) as loc
    from emp
    where job = 'SALESMAN';
    
set serveroutput on
accept p_num prompt '숫자를 입력하세요 ~ '

declare
    v_num number(10) := &p_num;
    
begin
    if v_num >= 0 then
        dbms_output.put_line(v_num);
    else
        dbms_output.put_line(-1 * v_num);
    end if;
end;
/

set serveroutput on
set verify off
accept p_num1 prompt ' 밑변을 입력하세요 ~ '
accept p_num2 prompt ' 높이를 입력하세요 ~ '
accept p_num3 prompt ' 빗변을 입력하세요 ~ '

begin

    if power(&p_num1, 2) + power(&p_num2, 2) = power(&p_num3, 2)
    then
        dbms_output.put_line('직각삼각형입니다. ');
        
    else
        dbms_output.put_line('직각삼각형이 아닙니다. ');
    
    end if;
end;
/

set serveroutput on
set verify off
accept p_num1 prompt '밑수를 입력하세요 ~ '
accept p_num2 prompt '지수를 입력하세요 ~ '

declare
    v_result    number(10) := 1;
    v_num2      number(10) := &p_num1;
    v_count     number(10) := 0;
begin
    loop
        v_count := v_count + 1;
        v_result := v_result * v_num2;
        exit when v_count = &p_num2;
    end loop;
        dbms_output.put_line(v_result);
end;
/

set serveroutput on
set verify off
accept p_num1 prompt '밑수를 입력하세요 ~ '
accept p_num2 prompt '진수를 입력하세요 ~ '

declare
    v_num1      number(10) := &p_num1;
    v_num2      number(10) := &p_num2;
    v_count     number(10) := 0;
    v_result    number(10) := 1;
begin
    loop
        v_count := v_count + 1;
        v_result := v_result * v_num1;
        exit when v_result = v_num2;
    end loop;
        dbms_output.put_line(v_count);
end;
/

clear;


set serveroutput on
set verify off
declare
    v_name1     emp145.ename%type;
    v_name2     emp145.ename%type;
begin
    for i in 1 .. 3 loop
        for j in 1 .. 3 loop
            select ename into v_name1 from emp145 from emp145 where empno = i;
            select ename into v_name2 from emp145 from emp145 where empno = j;
            if i != j then
                dbms_output.put_line(v_name1 ||','|| v_name2);
            end if;
        end loop;
    end loop;
end;
/

