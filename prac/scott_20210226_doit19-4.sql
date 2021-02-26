set serveroutput on;

-- chap 19-3

-- exercise 19-19

create or replace function func_aftertax(
    sal IN NUMBER
)
return NUMBER
is 
    tax NUMBER := 0.05;
begin
    return (round(sal - (sal * tax)));
end func_aftertax;
/


-- exercise 19-20

declare
    aftertax number;
begin
    aftertax := func_aftertax(3000);
    dbms_output.put_line('after-tax income : ' || aftertax);
end;
/

-- exercise 19-21

select func_aftertax(3000) as After_Tax
    from dual;

-- exercise 19-22
    
select empno, ename, sal, func_aftertax(sal) as aftertax
    from emp;
    
-- exercise 19-23

drop function func_aftertax;

-- chap 19-4

-- exercise 19-24

create or replace package pkg_example
is
    spec_no number := 10;
    function func_aftertax(sal number) return number;
    procedure pro_emp(in_empno in emp.empno%type);
    procedure pro_dept(in_deptno in dept.deptno%type);
end;
/

-- exercise 19-25

select text
    from user_source
  where type = 'PACKAGE'
    and name = 'PKG_EXAMPLE';
    
-- exercise 19-26

desc pkg_example;

-- exercise 19-27
create or replace package body pkg_example
is
    body_no number := 10;
    
    function func_aftertax(sal number) return number
        is
            tax number := 0.05;
        begin
            return (round(sal - (sal * tax)));
    end func_aftertax;
    
    procedure pro_emp(in_empno in emp.empno%type)
        is
            out_ename emp.ename%type;
            out_sal emp.sal%type;
        begin
            select ename, sal into out_ename, out_sal
                from emp
              where empno = in_empno;
              
            dbms_output.put_line('ename : ' || out_ename);
            dbms_output.put_line('sal : ' || out_sal);
    end pro_emp;
    
    procedure pro_dept(in_deptno in dept.deptno%type)
        is
            out_dname dept.dname%type;
            out_loc dept.loc%type;
        begin
            select dname, loc into out_dname, out_loc
                from dept
              where deptno = in_deptno;
              
            dbms_output.put_line('dname : ' || out_dname);
            dbms_output.put_line('loc : ' || out_loc);
    end pro_dept;
end;
/

-- exercise 19-28

CREATE OR REPLACE PACKAGE BODY pkg_overload
IS
   PROCEDURE pro_emp(in_empno IN EMP.EMPNO%TYPE)
      IS
         out_ename EMP.ENAME%TYPE;
         out_sal EMP.SAL%TYPE;
      BEGIN
         SELECT ENAME, SAL INTO out_ename, out_sal
           FROM EMP
          WHERE EMPNO = in_empno;

         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
      END pro_emp;

   PROCEDURE pro_emp(in_ename IN EMP.ENAME%TYPE)
      IS
         out_ename EMP.ENAME%TYPE;
         out_sal EMP.SAL%TYPE;
      BEGIN
         SELECT ENAME, SAL INTO out_ename, out_sal
           FROM EMP
          WHERE ENAME = in_ename;

         DBMS_OUTPUT.PUT_LINE('ENAME : ' || out_ename);
         DBMS_OUTPUT.PUT_LINE('SAL : ' || out_sal);
      END pro_emp;

END;
/


-- exercise 19-30

BEGIN
   DBMS_OUTPUT.PUT_LINE('--pkg_example.func_aftertax(3000)--');
   DBMS_OUTPUT.PUT_LINE('after-tax:' || pkg_example.func_aftertax(3000));

   DBMS_OUTPUT.PUT_LINE('--pkg_example.pro_emp(7788)--');
   pkg_example.pro_emp(7788);

   DBMS_OUTPUT.PUT_LINE('--pkg_example.pro_dept(10)--' );
   pkg_example.pro_dept(10);

   DBMS_OUTPUT.PUT_LINE('--pkg_overload.pro_emp(7788)--' );
   pkg_overload.pro_emp(7788);

   DBMS_OUTPUT.PUT_LINE('--pkg_overload.pro_emp(''SCOTT'')--' );
   pkg_overload.pro_emp('SCOTT');
END;
/

-- chap 19-5 triger

-- exercise 19-31

create table emp_trg
    as select * from emp;
    
-- exercise 19-32

create or replace trigger trg_emp_nodml_weekend
before
insert or update or delete on emp_trg
begin
    if to_char(sysdate, 'DY') in ('토', '일') then
        if inserting then
            raise_application_error(-20000, '주말 사원정보 추가 불가');
        elsif updating then
            raise_application_error(-20001, '주말 사원정보 수정 불가');
        elsif updating then
            raise_application_error(-20002, '주말 사원정보 삭제 불가');
        else
            raise_application_error(-20003, '주말 사원정보 변경 불가');
        end if;
    end if;
end;
/

-- exercise 19-33

update emp_trg set sal = 3500 where empno = 7788;

-- exercise 19-34

update emp_trg set sal = 3500 where empno = 7788;

-- exercise 19-35

create table emp_trg_log(
    tablename   varchar2(10),
    dml_type    varchar2(10),
    empno       number(4),
    user_name   varchar2(30),
    chage_date  date
    );
    
-- exercise 19-36

create or replace trigger trg_emp_log
after
insert or update or delete on emp_trg
for each row

begin

    if inserting then
        insert into emp_trg_log
        values ('EMP_TRG', 'INSERT', :new.empno,
                 SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
                 
    elsif updating then
        insert into emp_trg_log
        values ('EMP_TRG', 'UPDATE', :old.empno,
                 SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    elsif deleting then
        insert into emp_trg_log
        values ('EMP_TRG', 'DELETE', :old.empno,
                 SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    end if;
end;
/

-- exercise 19-37

insert into emp_trg
values(9999, 'TestEmp', 'CLERK', 7788, to_date('2018-03-03', 'YYYY-MM-DD'), 1200, null, 20);

-- exercise 19-38

commit;

-- exercise 19-39

select * from emp_trg;

-- exercise 19-40

select * from emp_trg_log;

-- exercise 19-41

update emp_trg
    set sal = 1300
  where mgr = 7788;
  
commit;

-- exe 19-42

select trigger_name, trigger_type, triggering_event, table_name, status
    from user_triggers;
    
-- prac Q1

-- 1

CREATE OR REPLACE PROCEDURE pro_dept_in
(
   inout_deptno IN OUT DEPT.DEPTNO%TYPE,
   out_dname OUT DEPT.DNAME%TYPE,
   out_loc OUT DEPT.LOC%TYPE
)
IS
BEGIN
   SELECT DEPTNO, DNAME, LOC INTO inout_deptno, out_dname, out_loc
     FROM DEPT
    WHERE DEPTNO = inout_deptno;
END pro_dept_in;
/

-- 2

declare
    v_deptno dept.deptno%type;
    v_dname  dept.dname%type;
    v_loc    dept.loc%type;
begin
    v_deptno := 10;
    pro_dept_in (v_deptno, v_dname, v_loc);
    dbms_output.put_line('부서 번호 : ' || v_deptno);
    dbms_output.put_line('부서 이름 : ' || v_dname);
    dbms_output.put_line('지역 : ' || v_loc);
end;
/

-- prac 2

create or replace function func_date_kor(
    in_date in date
    )
return varchar2
is
begin
    return (to_char(in_date, 'YYYY"년 "MM"월 "DD"일 "'));
end func_date_kor;
/

select ename, func_date_kor(hiredate) as hiredate
    from emp
  where empno = 7369;
    
-- prac 3

-- 1

create table dept_trg
    as select * from dept
      where 1 <> 1;

select * from dept_trg;

-- 2

create table dept_trg_log (
    tablename   varchar2(10),
    dml_type    varchar2(10),
    deptno      number(2),
    user_name   varchar2(30),
    change_date date
    );

-- 3

create or replace trigger trg_dept_log
after
insert or update or delete on dept_trg
for each row

begin

    if inserting then
        insert into dept_trg_log
        values ('DEPT_TRG', 'INSERT', :new.deptno,
                 SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
                 
    elsif updating then
        insert into dept_trg_log
        values ('DEPT_TRG', 'UPDATE', :old.deptno,
                 SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    elsif deleting then
        insert into dept_trg_log
        values ('DEPT_TRG', 'DELETE', :old.deptno,
                 SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    end if;
end;
/

commit;

