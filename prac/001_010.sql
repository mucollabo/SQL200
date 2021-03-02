select empno, ename, sal
    from emp;
    
select *
    from emp;
    
select dept.*, deptno from dept;

select empno as "사원 번호", ename as "사원 이름", sal as "Salary"
    from emp;
    
select ename, sal*(12+3000)
    from emp;
    
select ename, sal*(12+3000) as 월급
    from emp
    order by 월급 desc;
    
select ename || sal
    from emp;
    
select ename || '의 월급은' || sal || '입니다 ' as "월급정보"
    from emp;
    
select ename || '의 직업은 ' || job || '입니다 ' as "직업정보"
    from emp;
    
select distinct job
    from emp;
    
select unique job
    from emp;
    
select ename, sal
    from emp
    order by sal asc;
    
select ename, sal as 월급
    from emp
    order by 월급 asc;
    
select ename, deptno, sal
    from emp
    order by deptno asc, sal desc;
    
select ename, deptno, sal
    from emp
    order by 2 asc, 3 desc;
    
-- 007

select ename, sal, job
    from emp
    where sal = 3000;
    
select ename as 이름, sal as 월급
    from emp
    where sal >= 3000;
    
select ename as 이름, sal as 월급
    from emp
    where 월급 >= 3000;
    
-- 008

select ename, sal, job, hiredate, deptno
    from emp
    where ename = 'SCOTT';
    
select ename, hiredate
    from emp
    where hiredate = '81/11/17';

select *
    from nls_session_parameters
    where parameter = 'NLS_DATE_FORMAT';
    
select *
    from nls_session_parameters;
    
alter session set nls_date_format = 'YY/MM/DD';

-- 009

select ename, sal*12 as 연봉
    from emp
    where sal*12 >= 36000;
    
select ename, sal, comm, sal + comm
    from emp
    where deptno = 10;
    
select sal + comm
    from emp
    where ename = 'KING';
    
select sal + nvl(comm, 0)
    from emp
    where ename = 'KING';
    
-- 010

select ename, sal, job, deptno
    from emp
    where sal <= 1200;

