-- SQL200
-- 091
select rpad(' ', level*3) || ename as employee, level, sal, JOB
    from EMP
    start with ename = 'KING'
    connect by prior empno = MGR
    order siblings by sal desc;

select rpad(' ', level*3) || ename as employee, level, sal, JOB
    from EMP
    start with ename = 'KING'
    connect by prior empno = MGR
    order by sal desc;

-- 092
select ename, sys_connect_by_path(ename, '/') as path
    from EMP
    start with ename = 'KING'
    connect by prior empno = mgr;

select ename, ltrim(sys_connect_by_path(ename, '/'), '/') as path
    from EMP
    start with ename = 'KING'
    connect by prior empno = mgr;

-- 093
create table emp01
(empno      number(10),
 ename      varchar2(10),
 sal        number(10, 2),
 hiredate   date);

-- 094
create global temporary table emp37
(empno         number(10),
 ename         varchar2(10),
 sal           number(10))
 on commit     delete rows;

insert into emp37 values(1111, 'scott', 3000);

insert into emp37 values(2222, 'smith', 4000);

select * from emp37;

delete from emp37
    where empno = 1111;

commit;

select * from emp37;

create global temporary table emp38
(empno         number(10),
 ename         varchar2(10),
 sal           number(10))
 on commit     preserve rows;

insert into emp38 values(1111, 'scott', 3000);

insert into emp38 values(2222, 'smith', 4000);

select * from emp38;

commit;

select * from emp38;

-- 095

create view emp_view
as
select empno, ename, sal, job, DEPTNO
    from EMP
    where job = 'SALESMAN';

select * from emp_view;

update emp_view set sal = 0 where ename = 'MARTIN';

select * from emp where job = 'SALESMAN';



