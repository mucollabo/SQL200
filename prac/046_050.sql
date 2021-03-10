-- SQL200

-- 046

select empno, ename, sal,
            lag(sal, 1) over (order by sal asc) "전 행",
            lead(sal, 1) over (order by sal asc) "다음 행"
    from emp
    where job in ('ANALYST', 'MANAGER');
    
select empno, ename, hiredate,
            lag(hiredate, 1) over (order by hiredate asc) "전 행",
            lead(hiredate, 1) over (order by hiredate asc) "다음 행"
    from emp
    where job in ('ANALYST', 'MANAGER');
    
select deptno, empno, ename, hiredate,
            lag(hiredate, 1) over (partition by deptno order by hiredate asc) "전 행",
            lead(hiredate, 1) over (partition by deptno order by hiredate asc) "다음 행"
        from emp;
        
-- 047

select sum(decode(deptno, 10, sal)) as "10",
       sum(decode(deptno, 20, sal)) as "20",
       sum(decode(deptno, 30, sal)) as "30"
    from emp;
    
select deptno, decode(deptno, 10, sal) as "10"
    from emp;
    
select sum(decode(deptno, 10, sal)) as "10"
    from emp;
    
select sum(decode(job, 'ANALYST', sal)) as "ANALYST",
       sum(decode(job, 'CLERK', sal)) as "CLERK",
       sum(decode(job, 'MANAGER', sal)) as "MANAGER",
       sum(decode(job, 'SALESMAN', sal)) as "SALESMAN"
    from emp;
    
select deptno, sum(decode(job, 'ANALYST', sal)) as "ANALYST",
               sum(decode(job, 'CLERK', sal)) as "CLERK",
               sum(decode(job, 'MANAGER', sal)) as "MANAGER",
               sum(decode(job, 'SALESMAN', sal)) as "SALESMAN"
    from emp
    group by deptno;
    
-- 048

select *
    from (select deptno, sal from emp)
    pivot (sum(sal) for deptno in (10, 20, 30));
    
select *
    from (select job, sal from emp)
    pivot (sum(sal) for job in ('ANALYST', 'CLERK', 'MANAGER', 'SALESMAN'));
    
--049

drop table order2;

create table order2
( ename  varchar2(10),
  bicycle  number(10),
  camera   number(10),
  notebook  number(10) );
  
insert  into  order2  values('SMITH', 2,3,1);
insert  into  order2  values('ALLEN',1,2,3 );
insert  into  order2  values('KING',3,2,2 );

commit;



select *
    from order2
    unpivot (건수 for 아이템 in (bicycle, camera, notebook));
    
select *
    from order2
    unpivot (건수 for 아이템 in (bicycle as 'B', camera as 'C', notebook as 'N'));
    
update order2 
    set notebook = null
    where ename = 'SMITH';
    
select * from order2;

select *
    from order2
    unpivot include nulls (건수 for 아이템 in (bicycle as 'B', camera as 'C', notebook as 'N'));
    
-- 050

select empno, ename, sal, sum(sal) over (order by empno rows
                                         between unbounded preceding
                                         and current row) as 누적치
    from emp
    where job in ('ANALYST', 'MANAGER');
    
commit;

