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


