select * from dba_users;

create table emp_ddl(
    empno   number(4),
    ename   varchar2(10),
    job     varchar2(9),
    mgr     number(4),
    hiredate date,
    sal     number(7, 2),
    comm    number(7, 2),
    deptno  number(2)
);

desc emp_ddl;

create table dept_ddl
    as select * from dept;
    
desc dept_ddl;

select * from dept_ddl;

create table emp_ddl_30
    as select *
        from emp
      where deptno = 30;
      
select * from emp_ddl_30;

create table empdept_ddl
    as select e.empno, e.ename, e.job, e.mgr, e.hiredate,
              e.sal, e.comm, d.deptno, d.dname, d.loc
        from emp e, dept d
        where 1 <> 1;
        
select * from empdept_ddl;

create table emp_alter
    as select * from emp;
    
select * from emp_alter;

alter table emp_alter
    add hp varchar2(20);
    
select * from emp_alter;

alter table emp_alter
    rename column hp to tel;
    
select * from emp_alter;

alter table emp_alter
modify empno number(5);

desc emp_alter;

alter table emp_alter
drop column tel;

select * from emp_alter;

rename emp_alter to emp_rename;

desc emp_alter;

select *
    from emp_rename;
    
truncate table emp_rename;

select * from emp_rename;

drop table emp_rename;

desc emp_rename;

create table emp_hw (
    empno   number(4),
    ename   varchar2(10),
    job     varchar2(9),
    mgr     number(4),
    hiredate date,
    sal     number(7, 2),
    comm    number(7, 2),
    deptno  number(2)
);

alter table emp_hw
    add bigo    varchar2(20);
    
select * from emp_hw;

alter table emp_hw
modify bigo varchar(30);

desc emp_hw;

alter table emp_hw
    rename column bigo to remark;
    
desc emp_hw;

select * from emp_hw;

insert into emp_hw
select empno, ename, job, mgr, hiredate, sal, comm, deptno, null
    from emp;
    
select * from emp_hw;

drop table emp_hw;

desc emp_hw;

