set SERVEROUTPUT on;

declare
    type rec_dept is record(
        deptno  number(2) not null := 99,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
    dept_rec rec_dept;
begin
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    dbms_output.put_line('deptno : ' || dept_rec.deptno);
    dbms_output.put_line('dname : ' || dept_rec.dname);
    dbms_output.put_line('loc : ' || dept_rec.loc);
end;
/

create table dept_record
as select * from dept;

select * from dept_record;

declare
    type rec_dept is record(
        deptno  number(2) not null := 99,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
    dept_rec rec_dept;
begin
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    
insert into dept_record
values dept_rec;
end;
/

select * from dept_record;

declare
    type rec_dept is record(
        deptno  number(2) not null := 99,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
    dept_rec rec_dept;
begin
    dept_rec.deptno := 50;
    dept_rec.dname := 'DB';
    dept_rec.loc := 'SEOUL';
    
update dept_record
set row = dept_rec
where deptno = 99;
end;
/

select * from dept_record;

declare
    type rec_dept is record(
        deptno  dept.deptno%type,
        dname   dept.dname%type,
        loc     dept.loc%type
    );
    type rec_emp is record(
        empno   emp.empno%type,
        ename   emp.ename%type,
        dinfo   rec_dept
    );
    emp_rec rec_emp;
begin
    select e.empno, e.ename, d.deptno, d.dname, d.loc
    
        into emp_rec.empno, emp_rec.ename, emp_rec.dinfo.deptno, emp_rec.dinfo.dname, emp_rec.dinfo.loc
        from emp e, dept d
    where e.deptno = d.deptno
    and e.empno = 7788;
    dbms_output.put_line('empno : ' || emp_rec.empno);
    dbms_output.put_line('ename : ' || emp_rec.ename);
    
    dbms_output.put_line('deptno : ' || emp_rec.dinfo.deptno);
    dbms_output.put_line('dname : ' || emp_rec.dinfo.dname);
    dbms_output.put_line('loc : ' || emp_rec.dinfo.loc);
end;
/

commit;

declare
    type itab_ex is table of varchar2(20)
index by pls_integer;

    text_arr itab_ex;
    
begin
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(4) := '4th data';
    
    dbms_output.put_line('text_arr(1) : ' || text_arr(1));
    dbms_output.put_line('text_arr(2) : ' || text_arr(2));
    dbms_output.put_line('text_arr(3) : ' || text_arr(3));
    dbms_output.put_line('text_arr(4) : ' || text_arr(4));
end;
/

declare
    type rec_dept is record(
        deptno dept.deptno%type,
        dname  dept.dname%type
    );
    
    type itab_dept is table of rec_dept
        index by pls_integer;
        
    dept_arr itab_dept;
    idx pls_integer := 0;
    
begin
    for i in (select deptno, dname from dept) loop
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        
        dbms_output.put_line(
            dept_arr(idx).deptno || ' : ' || dept_arr(idx).dname);
    end loop;
end;
/

declare
    type itab_dept is table of dept%rowtype
        index by pls_integer;
        
    dept_arr itab_dept;
    idx pls_integer := 0;
    
begin
    for i in(select * from dept) loop
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        dept_arr(idx).loc := i.loc;
        
        dbms_output.put_line(
        dept_arr(idx).deptno || ' : ' ||
        dept_arr(idx).dname || ' : ' ||
        dept_arr(idx).loc);
    end loop;
end;
/

declare
    type itab_ex is table of varchar2(20)
index by pls_integer;

    text_arr itab_ex;
    
begin
    text_arr(1) := '1st data';
    text_arr(2) := '2nd data';
    text_arr(3) := '3rd data';
    text_arr(50) := '50th data';
    
    dbms_output.put_line('text_arr.COUNT : ' || text_arr.COUNT);
    dbms_output.put_line('text_arr.FIRST : ' || text_arr.FIRST);
    dbms_output.put_line('text_arr.LAST : ' || text_arr.LAST);
    dbms_output.put_line('text_arr.PRIOR(50) : ' || text_arr.PRIOR(50));
    dbms_output.put_line('text_arr.NEXT(50) : ' || text_arr.NEXT(50));
    
end;
/

-- Practice

-- Q1

create table emp_record
    as select * from emp
        where 1<>1;
        
select * from emp_record;

declare
    type rec_emp is record(
    empno   emp.empno%type not null := 9999,
    ename   emp.ename%type,
    job     emp.job%type,
    mgr     emp.mgr%type,
    hiredate emp.hiredate%type,
    sal     emp.sal%type,
    comm    emp.comm%type,
    deptno  emp.deptno%type
    );
    emp_rec rec_emp;
    
begin
    emp_rec.empno   := 1111;
    emp_rec.ename   := 'TEST_USER';
    emp_rec.job     := 'TEST_JOB';
    emp_rec.mgr     := null;
    emp_rec.hiredate := to_date('2018/03/01', 'YYYY/MM/DD');
    emp_rec.sal     := 3000;
    emp_rec.comm    := null;
    emp_rec.deptno  := 40;
    
    insert into emp_record
    VALUES emp_rec;
end;
/

select * from emp_record;

declare
    type itab_emp is table of emp%rowtype
        index by PLS_INTEGER;
    emp_arr itab_emp;
    idx pls_integer := 0;
begin
    for i in (select * from emp) loop
        idx := idx + 1;
        emp_arr(idx).empno := i.empno;
        emp_arr(idx).ename := i.ename;
        emp_arr(idx).job := i.job;
        emp_arr(idx).mgr := i.mgr;
        emp_arr(idx).hiredate := i.hiredate;
        emp_arr(idx).sal := i.sal;
        emp_arr(idx).deptno := i.deptno;
        
        dbms_output.put_line(
            emp_arr(idx).empno      || ' : ' ||
            emp_arr(idx).ename      || ' : ' ||
            emp_arr(idx).job        || ' : ' ||
            emp_arr(idx).mgr        || ' : ' ||
            emp_arr(idx).hiredate   || ' : ' ||
            emp_arr(idx).sal        || ' : ' ||
            emp_arr(idx).deptno
            );
    end loop;
end;
/

commit;
    
