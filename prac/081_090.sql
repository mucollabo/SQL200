-- SQL200

-- 081

insert into emp (empno, ename, sal, deptno)
            values(1122, 'JACK', 3000, 20);
            
commit;

update emp
    set sal = 4000
    where ename = 'SCOTT';
    
select *
    from emp
    where ename = 'SCOTT';

rollback;

-- 082

desc emp;

merge into emp e
using dept d
on (e.deptno = d.deptno)
when matched then
update set e.loc = d.loc
when not matched then
insert (e.empno, e.deptno, e.loc) values (1111, d.deptno, d.loc);

select * from emp;

-- 083

update emp
set sal = 3000
where ename = 'JONES';

commit;

-- 084

select ename, sal, deptno
    from emp
    where ename = 'JONES'
    for update;

commit;

select ename, sal, deptno
    from emp
    where ename = 'JONES';
    
-- 085

create table emp2
    as select *
        from emp
        where 1 <> 1;
        
select *
    from emp2;
    
insert into emp2 (empno, ename, sal, deptno)
    select empno, ename, sal, deptno
        from emp
        where deptno = 10;
        
-- 086

update emp
    set sal = (select sal
                from emp
                where ename = 'ALLEN')
    where job = 'SALESMAN';
    
select ename, deptno, sal
    from emp
    where job = 'SALESMAN';
    
update emp
    set (sal, comm) = (select sal, comm
                        from emp
                        where ename = 'ALLEN')
    where ename = 'SCOTT';
    
select ename, sal
    from emp;

rollback;

-- 087

delete from emp
    where sal > (select sal
                    from emp
                    where ename = 'SCOTT');
                    
select deptno, avg(sal)
    from emp
    group by deptno;
    
delete from emp m
    where sal > (select avg(sal)
                    from emp s
                    where s.deptno = m.deptno);
                    
-- 088

alter table dept
    add sumsal  number(10);

commit;

merge into dept d
using (select deptno, sum(sal) sumsal
          from emp
          group by deptno) v
on (d.deptno = v.deptno)
when matched then
update set d.sumsal = v.sumsal;

select deptno, dname, loc, sumsal
    from dept;
    
update dept d
    set sumsal = (select sum(sal)
                    from emp e
                    where e.deptno = d.deptno);
                    
-- 089

rollback;

select * from emp;

insert into emp
    select *
        from system.emp;

drop table emp;

commit;

create table emp
    as select * from system.emp;

commit;

create table emp_tp
    as select * from emp;
    
commit;

select * from emp_tp;

select rpad(' ', level*3) || ename as employee, level, sal, job, empno, mgr
    from emp_tp
    start with ename = 'KING'
    connect by prior empno = mgr;
    
-- 090

select rpad(' ', level*3) || ename as employee, level, sal, job
    from emp_tp
    start with ename = 'KING'
    connect by prior empno = mgr and ename != 'BLAKE';
    
commit;