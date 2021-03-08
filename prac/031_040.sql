-- SQL200
-- 031

select ename, hiredate
    from emp
    where hiredate = to_date('81/11/17', 'RR/MM/DD');
    
select *
    from nls_session_parameters
    where parameter = 'NLS_DATE_FORMAT';

select ename, hiredate
    from emp
    where hiredate = '81/11/17';
    
alter session set nls_date_format = 'DD/MM/RR';

select ename, hiredate
    from emp
    where hiredate = '17/11/81';
    
select ename, hiredate
    from emp
    where hiredate = to_date('81/11/17', 'RR/MM/DD');
    
alter session set nls_date_format = 'RR/MM/DD';

-- 032

select ename, sal
    from emp
    where sal = '3000';
    
create table emp32
(ename  varchar2(10),
 sal    varchar2(10));
 
 insert into emp32 values('SCOTT', '3000');
 insert into emp32 values('SMITH', '1200');
 
commit;

select ename, sal
    from emp32
    where sal = '3000';
    
select ename, sal
    from emp32
    where sal = 3000;
    
set autot on
select ename, sal
    from emp32
    where sal = 3000;
    
--033

select ename, comm, nvl(comm, 0)
    from emp;
    
select ename, sal, comm, sal+comm
    from emp
    where job in ('SALESMAN', 'ANALYST');
    
select ename, sal, comm, nvl(comm, 0), sal+nvl(comm, 0)
    from emp
    where job in ('SALESMAN', 'ANALYST');
    
select ename, sal, comm, nvl2(comm, sal+comm, sal)
    from emp
    where job in ('SALESMAN', 'ANALYST');
    
-- 034

select ename, deptno, decode(deptno, 10, 300, 20, 400, 0) as 보너스
    from emp;
    
select empno, mod(empno, 2), decode(mod(empno, 2), 0 , 'even', 1, 'odd') as bonus
    from emp;
    
select ename, job, decode(job, 'SALESMAN', 5000, 2000) as bonus
    from emp;
    
-- 035

select ename, job, sal, case when sal >= 3000 then 500
                             when sal >= 2000 then 300
                             when sal >= 1000 then 200
                             else 0 end as bonus
    from emp
    where job in ('SALESMAN', 'ANALYST');
    
select ename, job, comm, case when comm is null then 500
                              else 0 end as bonus
    from emp
    where job in ('SALESMAN', 'ANALYST');
    
select ename, job, case when job in ('SALESMAN', 'ANALYST') then 500
                        when job in ('CLERK', 'MANAGER') then 400
                        else 0 end as bonus
    from emp;
    
-- 036

select max(sal)
    from emp;
    
select max(sal)
    from emp
    where job = 'SALESMAN';
    
select job, max(sal)
    from emp
    where job = 'SALESMAN'
    group by job;
    
select deptno, max(sal)
    from emp
    group by deptno;
    
-- 037

select min(sal)
    from emp
    where job = 'SALESMAN';
    
select job, min(sal) as minsal
    from emp
    group by job
    order by minsal desc;
    
select min(sal)
    from emp
    where 1 = 2;
    
select nvl(min(sal), 0)
    from emp
    where 1 = 2;
    
select job, min(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    order by min(sal) desc;
    
-- 038

update emp SET comm = 0
    where ename = 'TURNER';

commit;

select avg(comm)
    from emp;
    
select round(avg(nvl(comm, 0)))
    from emp;
    
-- 039

select deptno, sum(sal)
    from emp
    group by deptno;
    
select job, sum(sal)
    from emp
    group by job
    order by sum(sal) desc;
    
select job, sum(sal)
    from emp
    group by job
    having sum(sal) >= 4000;
    
select job, sum(sal)
    from emp
    where job != 'SALESMAN'
    group by job
    having sum(sal) >= 4000;
    
-- 040

select count(empno)
    from emp;
    
select count(*)
    from emp;
    
select count(comm)
    from emp;
    
commit;


    
