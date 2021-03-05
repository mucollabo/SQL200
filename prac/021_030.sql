-- SQL200
-- 021

select ename, lpad(sal, 10, '*') as salary1, rpad(sal, 10, '*') as salary2
    from emp;
    
select ename, sal, lpad('◼', round(sal/100), '◼') as bar_chart
    from emp;
    
-- 022

select 'smith', ltrim('smith', 's'), rtrim('smith', 'h'), trim('s' from 'smiths')
    from dual;


insert into emp(empno, ename, sal, job, deptno)
    values(8291, 'JACK', 3000, 'SALESMAN', 30);
commit;

/*
update emp
    set ename = 'JACK '
    where ename = 'JACK';
*/

    
select empno, ename
    from emp
  where ename = 'JACK';


select ename, sal
    from emp
  where rtrim(ename) = 'JACK';
  
delete from emp
    where trim(ename) = 'JACK';
    
commit;

-- 023

select '876.567' as 숫자, round(876.567, 1)
    from dual;
    
-- 024

select '876.567' as 숫자, trunc(876.567, 1)
    from dual;
    
-- 025

select mod(10, 3)
    from dual;
    
select empno, mod(empno, 2)
    from emp;
    
select empno, ename
    from emp
    where mod(empno, 2) = 0;
    
select floor(10/3)
    from dual;
    
-- 026

select ename, MONTHS_BETWEEN(SYSDATE,hiredate)
    from emp;
    
select to_date('2019-06-01', 'RRRR-MM-DD') - to_date('2018-10-01', 'RRRR-MM-DD')
    from dual;
    
select round((to_date('2019-06-01', 'RRRR-MM-DD') - to_date('2018-10-01', 'RRRR-MM-DD')) / 7) as "총 주수"
    from dual;
    
-- 027

select add_months(to_date('2019-05-01', 'RRRR-MM-DD'), 100)
    from dual;
    
select to_date('2019-05-01', 'RRRR-MM-DD') + 100
    from dual;
    
select to_date('2019-05-01', 'RRRR-MM-DD') + interval '100' month
    from dual;
    
select to_date('2019-05-01', 'RRRR-MM-DD') + interval '1-3' year(1) to month
    from dual;
    
select to_date('2019-05-01', 'RRRR-MM-DD') + interval '3' year
    from dual;
    
select to_date('2019-05-01', 'RRRR-MM-DD') + to_yminterval('03-05') as 날짜
    from dual;
    
-- 028

select '2019/05/22' as 날짜, next_day('2019/05/22', '월요일')
    from dual;
    
select sysdate as 오늘날짜
    from dual;
    
select next_day(sysdate, '화요일') as "다음 날짜"
    from dual;
    
select next_day(add_months('2019/05/22', 100), '화요일') as "다음 날짜"
    from dual;
    
select next_day(add_months(sysdate, 100), '월요일') as "다음 날짜"
    from dual;
    
-- 029

select '2019/05/22' as 날짜, last_day('2019/05/22') as "마지막 날짜"
    from dual;
    
select last_day(sysdate) - sysdate as "남은 날짜"
    from dual;
    
select ename, hiredate, last_day(hiredate)
    from emp
    where ename = 'KING';
    
-- 030

select ename as 이름, to_char(hiredate, 'DAY') as 입사요일, to_char(sal, '999,999') as 월급
    from emp
    where ename = 'SCOTT';
    
select ename, hiredate, to_char(hiredate, 'RRRR') as 연도, to_char(hiredate, 'MM') as 달,
                        to_char(hiredate, 'DD') as 일, to_char(hiredate, 'DAY') as 요일
    from emp
    where ename = 'KING';
    
select ename, hiredate
    from emp
    where to_char(hiredate, 'RRRR') = '1981';
    
select ename as 이름, EXTRACT(YEAR FROM hiredate) as 연도,
                     EXTRACT(MONTH FROM hiredate) as 달,
                     EXTRACT(DAY FROM hiredate) as 요일
    from emp;
    
select ename as 이름, to_char(sal, '999,999') as 월급
    from emp;
    
select ename as 이름, to_char(sal*200, '999,999,999') as 월급
    from emp;
    
select ename as 이름, to_char(sal*200, 'L999,999,999') as 월급
    from emp;
    
commit;

