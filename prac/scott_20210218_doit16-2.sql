set serveroutput on;

begin
    dbms_output.put_line('Hello, PL/SQL!');
end;
/

declare
v_empno number(4) := 7788;
v_ename varchar2(10);
begin
v_ename := 'SCOTT';
-- dbms_output.put_line('V_EMPNO : ' || V_EMPNO);
dbms_output.put_line('V_ENAME : ' || V_ENAME);
end;
/

declare
v_empno number(4) := 7788;
v_ename varchar2(10);
begin
v_ename := 'SCOTT';
/*
dbms_output.put_line('V_EMPNO : ' || V_EMPNO);
dbms_output.put_line('V_ENAME : ' || V_ENAME);
*/
end;
/

declare
    v_empno number(4) := 7788;
    v_ename varchar2(10);
begin
    v_ename := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || V_EMPNO);
    dbms_output.put_line('V_ENAME : ' || V_ENAME);
end;
/

declare
    v_tax constant  number(1) := 3;
begin
    dbms_output.put_line('V_TEX : ' || v_tax);
end;
/

declare
    v_deptno    number(2) DEFAULT 10;
begin
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
end;
/

declare
    v_deptno number(2) not null := 10;
begin
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
end;
/

declare
    v_deptno number(2) not null default 10;
begin
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
end;
/

declare
    v_deptno dept.deptno%type := 50;
begin
    dbms_output.put_line('V_DEPTNO : ' || v_deptno);
end;
/

declare
    v_dept_row dept%rowtype;
begin
    select deptno, dname, loc into v_dept_row
        from dept
      where deptno = 40;
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
end;
/

commit;

