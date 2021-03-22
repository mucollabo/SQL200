--SQL200
--096

create view emp_view2
as
select deptno, round(avg(sal)) 평균월급
    from EMP
    group by deptno;

select * from emp_view2;

update emp_view2
    set 평균월급 = 3000
    where deptno = 30;

select e.ename, e.sal, e.deptno, v.평균월급
    from emp e, (select deptno, round(avg(sal)) 평균월급
                    from EMP
                    group by deptno ) v
    where e.deptno = v.deptno and e.sal > v.평균월급;

select e.ename, e.sal, e.deptno, v.평균월급
    from emp e, emp_view2 v
    where e.deptno = v.deptno and e.sal > v.평균월급;

--097

create index emp_sal
    on emp(sal);

--098

create sequence seq1
start with 1
increment by 1
maxvalue 100
nocycle;

select max(empno)
    from emp;

insert into emp(empno, ename, sal, job, DEPTNO)
    values(7935, 'JACK', 3400, 'ANALYST', 20);

drop table emp2;

commit;

create table emp02
(empno      number(10),
 ename      varchar2(10),
 sal        number(10));

insert into emp02 values(seq1.nextval, 'JACK', 3500);
insert into emp02 values(seq1.nextval, 'JAMES', 4500);

select * from emp02;

--099

select *
    from emp
    as of timestamp (systimestamp - interval '5' minute)
    where ename = 'KING';

select ename, sal
    from emp
    where ename = 'KING';

update emp
    set sal = 0
    where ename = 'KING';

commit;

select *
    from emp
    as of timestamp (systimestamp - interval '5' minute)
    where ename = 'KING';

select ename, sal
    from emp
    as of timestamp '21/03/22 13:30:00'
    where ename = 'KING';


select systimestamp from dual;

select name, value
    from V$PARAMETER
    where name = 'undo_retention';

alter table emp enable row movement;

flashback table emp to timestamp (systimestamp - interval '5' minute );

select row_movement
    from USER_TABLES
    where table_name = 'EMP';

select * from emp
    where ename = 'KING';

flashback table emp to timestamp
to_timestamp('21/03/22 22:40:00', 'RR/MM/DD H24:MI:SS');

update emp
    set sal = 5000
    where ename = 'KING';

commit;
