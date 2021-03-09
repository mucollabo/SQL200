-- SQL200

-- 041

select ename, job, sal, rank() over (order by sal desc) as th
    from emp
    where job in ('ANALYST', 'MANAGER');
    
select ename, sal, job, rank() over (partition by job
                                     order by sal desc) as th
    from emp;
    
-- 042

select ename, job, sal, rank() over (order by sal desc) as rank,
                        dense_rank() over (order by sal desc) as dense_rank
    from emp
    where job in ('ANALYST', 'MANAGER');
    
select job, ename, sal, dense_rank() over (partition by job
                                           order by sal desc) as th
    from emp
    where hiredate between to_date('1981/01/01', 'RRRR/MM/DD')
                       and to_date('1981/12/31', 'RRRR/MM/DD');
                       
select dense_rank(2975) within group (order by sal desc) as th
    from emp;
    
select dense_rank('81/11/17') within group (order by hiredate asc) as th
    from emp;
    
-- 43

select ename, job, sal, ntile(4) over (order by sal desc) 등급
    from emp
    where job in ('ANALYST', 'MANAGER', 'CLERK');
    
select ename, comm
    from emp
    where deptno = 30
    order by comm desc nulls last;
    
-- 044

select ename, sal, rank() over (order by sal desc) as rank,
                   dense_rank() over (order by sal desc) as dense_rank,
                   cume_dist() over (order by sal desc) as cum_dist
    from emp;
    
select job, ename, sal, rank() over (order by sal desc) as rank,
                   cume_dist() over (partition by job
                                     order by sal desc) as cum_dist
    from emp;
    
-- 045

select deptno, listagg(ename, ',') within group (order by ename) as employee
    from emp
    group by deptno;
    
select job, listagg(ename, '/') within group (order by ename asc) as employee
    from emp
    group by job;
    
select job, listagg(ename || '(' || sal || ')', ',') within group (order by ename asc) as employee
    from emp
    group by job;
    
commit;

