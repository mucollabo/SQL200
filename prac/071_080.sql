-- SQL200

-- 071

select ename, sal
    from emp
    where sal > (select sal
                    from emp
                    where ename = 'JONES');
                    
select ename, sal
    from emp
    where sal = (select sal
                    from emp
                    where ename = 'SCOTT')
                    
    and ename != 'SCOTT';
    
-- 072

select ename, sal
    from emp
    where sal in (select sal
                    from emp
                    where job = 'SALESMAN');
                    
-- 073

select ename, sal, job
    from emp
    where empno not in (select mgr
                            from emp
                            where mgr is not null);
                            
select ename, sal, job
    from emp
    where empno not in (7839, 7698, 7902, 7566, 7788, 7782);
    
-- 074

select *
    from dept d
    where exists (select *
                    from emp e
                    where e.deptno = d.deptno);
                    
select *
    from dept d
    where not exists (select *
                        from emp e
                        where e.deptno = d.deptno);
                        
--075

select job, sum(sal)
    from emp
    group by job
    having sum(sal) > (select sum(sal)
                        from emp
                        where job = 'SALESMAN');
                        
-- 076

select v.ename, v.sal, v.순위
    from (select ename, sal, rank() over (order by sal desc) 순위
            from emp) v;
            
-- 077

select ename, sal, (select max(sal) from emp where job = 'SALESMAN') as 최대월급, 
                   (select min(sal) from emp where job = 'SALESMAN') as 최소월급
    from emp
    where job = 'SALESMAN';
    
-- 078

insert into emp (empno, ename, sal, hiredate, job)
            values(2812, 'JACK', 3500, to_date('2019/06/05', 'RRRR/MM/DD'), 'ANALYST');
            
commit;

-- 079

update emp
    set sal = 3200
    where ename = 'SCOTT';
    
update emp
    set sal = 5000, comm = 200
    where ename = 'SCOTT';
    
update emp
    set sal = (select sal from emp where ename = 'KING')
    where ename = 'SCOTT';
    
-- 080

delete from emp
    where ename = 'SCOTT';
    
select *
    from emp;
    
truncate table emp;

rollback;

drop table emp;

commit;

create table emp
    as select * from system.emp;
    
commit;

