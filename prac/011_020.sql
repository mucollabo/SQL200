-- SQL200 011~020

-- 011

select ename, sal
    from emp
    where sal between 1000 and 3000;
    
select ename, sal
    from emp
    where sal >= 1000 and sal <= 3000;
    
select ename, sal
    from emp
    where sal not between 1000 and 3000;
    
select ename, sal
    from emp
    where (sal < 1000 or sal > 3000);
    
select ename, hiredate
    from emp
    where hiredate between '1982/01/01' and '1982/12/31';
    
-- 012

select ename, sal
    from emp
    where ename like 'S%';
    
select ename
    from emp
    where ename like '_M%';
    
select ename
    from emp
    where ename like '%T';
    
select ename
    from emp
    where ename like '%A%';
    
-- 013

select ename, comm
    from emp
    where comm is null;
    
-- 014

select ename, sal, job
    from emp
    where job in ('SALESMAN', 'ANALYST', 'MANAGER');
    
select ename, sal, job
    from emp
    where job = 'SALESMAN' or job = 'ANALYST' or job = 'MANAGER';
    
select ename, sal, job
    from emp
    where job not in ('SALESMAN', 'ANALYST', 'MANAGER');
    
select ename, sal, job
    from emp
    where job != 'SALESMAN' and job != 'ANALYST'and job != 'MANAGER';
    
-- 015

select ename, sal, job
    from emp
    where job = 'SALESMAN' and sal >= 1200;
    
select ename, sal, job
    from emp
    where job = 'ABCDEFG' and sal >= 1200;
    
-- 016

select upper(ename), lower(ename), initcap(ename)
    from emp;
    
select ename, sal
    from emp
    where lower(ename) = 'scott';
    
-- 017

select SUBSTR('SMITH',1,3)
    from dual;
    
-- 018

select ename, length(ename)
    from emp;
    
select length('가나다라마')
    from dual;
    
select lengthb('가나다라마')
    from dual;
    
-- 019

select instr('SMITH', 'M')
    from dual;
    
select instr('abcdefg@naver.com', '@')
    from dual;
    
select substr('abcdefg@naver.com', instr('abcedfg@naver.com', '@')+1)
    from dual;
    
select rtrim(substr('abcdefg@naver.com', instr('abcedfg@naver.com', '@')+1), '.com')
    from dual;
    
-- 020

select ename, replace(sal, 0, '*')
    from emp;
    
select ename, REGEXP_REPLACE (sal, '[0-3]', '*') as SALARY
    from emp;
    
create table test_ename
(ename      varchar2(10));

insert into test_ename values('김인호');
insert into test_ename values('안상수');
insert into test_ename values('최영희');
commit;

select replace(ename, substr(ename, 2, 1), '*') as "전광판_이름"
    from test_ename;

/*    
select substr(ename, 2, 1)
    from test_ename;
*/

commit;

