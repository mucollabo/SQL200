-- SQL200

-- 061

select e.ename as 사원, e.job as 직업, m.ename as 관리자, m.job as 직업
    from emp e, emp m
    where e.mgr = m.empno and e.job = 'SALESMAN';
    
select e.ename, m.ename
    from emp e, emp m
    where e.mgr = m.empno;
    
-- 062

select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e join dept d
    on (e.deptno = d.deptno)
    where e.job = 'SALESMAN';
    
-- 063

select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e join dept d
    using(deptno)
    where e.job = 'SALESMAN';
    
-- 064

select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e natural join dept d
    where e.job = 'SALESMAN';
    
select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e natural join dept d
    where e.job = 'SALESMAN' and deptno = 30;
    
-- 065

select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e right outer join dept d
    on (e.deptno = d.deptno);
    
select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e left outer join dept d
    on (e.deptno = d.deptno);
    
-- 066

select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e full outer join dept d
    on (e.deptno = d.deptno);
    
select *
    from emp
    where ename = 'JACK';
    
-- insert into emp (ename, job, sal, deptno) values ('JACK', 'ANALYST', 3000, null);

select e.ename as 이름, e.job as 직업, e.sal as 월급, d.loc as 부서위치
    from emp e left outer join dept d
    on (e.deptno = d.deptno)
 union
 select e.ename, e.job, e.sal, d.loc
    from emp e right outer join dept d
    on (e.deptno = d.deptno);
    
-- 067

select deptno, sum(sal)
    from emp
    group by deptno
union all
select to_number(null) as deptno, sum(sal)
    from emp;
    
create table a (col1    number(10));
insert into a values(1);
insert into a values(2);
insert into a values(3);
insert into a values(4);
insert into a values(5);

create table b (col1    number(10));
insert into b values(3);
insert into b values(4);
insert into b values(5);
insert into b values(6);
insert into b values(7);

commit;

select col1 from a
union all
select col1 from b;

-- 068

select deptno, sum(sal)
    from emp
    group by deptno
union
select null as deptno, sum(sal)
    from emp;
    
create table c (col1    number(10));
insert into c values(1);
insert into c values(2);
insert into c values(3);
insert into c values(4);
insert into c values(5);

create table d (col1    number(10));
insert into d values(3);
insert into d values(4);
insert into d values(5);
insert into d values(6);
insert into d values(7);

commit;

select col1 from c
union
select col1 from d;

-- 069

select ename, sal, job, deptno
    from emp
    where deptno in (10, 20)
intersect
select ename, sal, job, deptno
    from emp
    where deptno in (20, 30);
    
create table e (col1    number(10));
insert into e values(1);
insert into e values(2);
insert into e values(3);
insert into e values(4);
insert into e values(5);

create table f (col1    number(10));
insert into f values(3);
insert into f values(4);
insert into f values(5);
insert into f values(6);
insert into f values(7);

select col1 from e
intersect
select col1 from f;

-- 070

select ename, sal, job, deptno
    from emp
    where deptno in (10, 20)
minus
select ename, sal, job, deptno
    from emp
    where deptno in (20, 30);
    
create table g (col1    number(10));
insert into g values(1);
insert into g values(2);
insert into g values(3);
insert into g values(4);
insert into g values(5);

create table h (col1    number(10));
insert into h values(3);
insert into h values(4);
insert into h values(5);
insert into h values(6);
insert into h values(7);

commit;

select col1 from g
minus
select col1 from h;

commit;
