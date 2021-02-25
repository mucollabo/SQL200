set serveroutput on;

create or replace procedure pro_noparam
is
    v_empno number(4) := 7788;
    v_ename varchar2(10);
begin
    v_ename := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || v_empno);
    dbms_output.put_line('V_ENAME : ' || v_ename);
end;
/

execute pro_noparam;

begin
    pro_noparam;
end;
/

select *
    from user_source
  where name = 'PRO_NOPARAM';
  
select text
    from user_source
  where name = 'PRO_NOPARAM';
  
-- 실습 19-6

drop procedure pro_noparam;


-- 실습 19-7

create or replace procedure pro_param_in
(
    param1 in number,
    param2  number,
    param3  number := 3,
    param4  number default 4
)
is

begin
    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);
end;
/

-- 실습 19-8

execute pro_param_in(1, 2, 9, 8);

-- 실습 19-9

execute pro_param_in(1, 2);

-- 실습 19-10

execute pro_param_in(1);

-- 실습 19-11

execute pro_param_in(param1 => 10, param2 => 20);

-- 실습 19-12

create or replace procedure pro_param_out
(
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)
is

begin
    select ename, sal into out_ename, out_sal
        from emp
       where empno = in_empno;
end pro_param_out;
/

-- 실습 19-13

declare
    v_ename emp.ename%type;
    v_sal emp.sal%type;
begin
    pro_param_out(7788, v_ename, v_sal);
    dbms_output.put_line('ename : ' || v_ename);
    dbms_output.put_line('sal : ' || v_sal);
end;
/

-- 실습 19-14

create or replace procedure pro_param_inout
(
    inout_no in out number
)
is

begin
    inout_no := inout_no * 2;
end pro_param_inout;
/

-- 실습 19-15

declare
    no number;
begin
    no := 5;
    pro_param_inout(no);
    dbms_output.put_line('no : ' || no);
end;
/

-- 실습 19-16

create or replace procedure pro_err
is
    err_no number;
begin
    err_no = 100;
    dbms_output.put_line('err_no : ' || err_no);
end pro_err;
/

show errors;

show err procedure pro_err;

-- 실습 19-18

select *
    from user_errors
  where name = 'PRO_ERR';
  
