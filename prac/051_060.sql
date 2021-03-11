-- SQL200

-- 051

select job, empno, ename, sal, ratio_to_report(sal) over () as ratio
    from emp
    where deptno = 20;
    
select job, empno, ename, sal, ratio_to_report(sal) over () as ratio,
                               sal/sum(sal) over () as comp_ratio
    from emp
    where deptno = 20;
    
-- 052

select job, sum(sal)
    from emp
    group by rollup(job);
    
select deptno, job, sum(sal)
    from emp
    group by rollup(deptno, job);
    
-- 053

select job, sum(sal)
    from emp
    group by cube(job);
    
select deptno, job, sum(sal)
    from emp
    group by cube(deptno, job);
    
-- 054

select deptno, job, sum(sal)
    from emp
    group by grouping sets((deptno), (job), ());
    
-- 055

select empno, ename, sal,
        rank() over (order by sal desc) as rank,
        dense_rank() over (order by sal desc) as dense_rank,
        row_number() over (order by sal desc) as num
    from emp
    where deptno = 20;
    
select empno, ename, sal, row_number() over () as num
    from emp
    where deptno = 20;
    
select deptno, ename, sal, row_number() over (partition by deptno
                                             order by sal desc) as num
    from emp
    where deptno in (10, 20);
    
-- 056

select rownum, empno, ename, job, sal
    from emp
    where rownum <= 5;
    
-- 057

select empno, ename, job, sal
    from emp
    order by sal desc 
    FETCH FIRST 4 ROWS ONLY;
    
select empno, ename, job, sal
    from emp
    order by sal desc
    FETCH FIRST 20 PERCENT ROWS ONLY;
    
select empno, ename, job, sal
    from emp
    order by sal desc
    FETCH FIRST 2 ROWS WITH TIES;
    
select empno, ename, job, sal
    from emp
    order by sal desc
    OFFSET 9 ROWS;
    
select empno, ename, job, sal
    from emp
    order by sal desc
    OFFSET 9 ROWS
    FETCH FIRST 2 ROWS ONLY;
    
-- 058

select ename, loc
    from emp, dept
    where emp.deptno = dept.deptno;
    
select ename, loc
    from emp, dept;
    
select ename, loc
    from emp, dept
    where emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
select ename, loc, job, emp.deptno
    from emp, dept
    where emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
select emp.ename, dept.loc, emp.job
    from emp, dept
    where emp.deptno = dept.deptno and emp.job = 'ANALYST';
    
select e.ename, d.loc, e.job
    from emp e, dept d
    where e.deptno = d.deptno and e.job = 'ANALYST';
    
-- 059

select * from salgrade;

desc salgrade;

select e.ename, e.sal, s.grade
    from emp e, salgrade s
    where e.sal between s.losal and s.hisal;
    
-- 060

select e.ename, d.loc
    from emp e, dept d
    where e.deptno (+) = d.deptno;
    
select * from dept;

commit;