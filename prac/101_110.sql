-- SQL200
-- 101

flashback table emp to before drop;

select original_name, droptime
    from user_RECYCLEBIN;

flashback table emp to before drop rename to emp03;

select * from emp;

-- 102

select ename, sal, VERSIONS_STARTTIME, VERSIONS_ENDTIME, VERSIONS_OPERATION
    from EMP
    versions between timestamp
            to_timestamp('2021-03-23 08:44:17', 'RRRR-MM-DD HH24:MI:SS')
            and maxvalue
    where ename = 'KING'
    order by VERSIONS_STARTTIME;

select systimestamp from dual;

select ename, sal, DEPTNO
    from EMP
    where ename = 'KING';

update EMP
    set sal = 8000
    where ename = 'KING';

commit;

update emp
    set deptno = 20
    where ename = 'KING';

commit;

alter table emp enable row movement;

flashback table emp to timestamp (systimestamp - interval '5' minute);

select parameter, value from v$option where value = 'FALSE' order by 1; -- Oracle option confirm

select * from V$VERSION; -- Oracle version confirm

-- 103

select sysdate, systimestamp
    from dual;

select undo_sql
    from FLASHBACK_TRANSACTION_QUERY
    where table_owner = 'SCOTT' and table_name = 'EMP'
    and commit_scn between 9457390 and 9457397
    order by START_TIMESTAMP desc;

-- 104

create table dept2
(deptno     number(10) constraint dept2_deptno_pk primary key,
 dname      varchar2(14),
 loc        varchar2(10)
);

select * from dept2;

select a.constraint_name, a.constraint_type, b.column_name
    from USER_CONSTRAINTS a, USER_CONS_COLUMNS b
    where a.TABLE_NAME = 'DEPT2'
    and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME;

drop table dept2;

-- 105

create table dept3
(
    deptno      number(10),
    dname       varchar2(14) constraint dept3_dname_un unique,
    loc         varchar2(10)
);

select a.constraint_name, a.constraint_type, b.column_name
    from USER_CONSTRAINTS a, USER_CONS_COLUMNS b
    where a.TABLE_NAME = 'DEPT3'
    and a.CONSTRAINT_NAME = b.CONSTRAINT_NAME;

drop table dept3;

-- 106

create table dept5
(
    deptno      number(10),
    dname       varchar2(14),
    loc         varchar2(10) constraint dept5_loc_nn not null
);

drop table dept5;

-- 107

create table emp6
(
    empno       number(10),
    ename       varchar2(20),
    sal         number(10) constraint emp6_sal_ck
                check ( sal between 0 and 6000)
);

insert into emp6 values (7782, 'CLARK', 6000);

select * from emp6;

alter table emp6
    drop constraint EMP6_SAL_CK;

update emp6
    set sal = 9000
    where empno = 7782;

select * from emp6;

-- 108

create table dept7
(
    deptno      number(10) constraint dept_deptno_pk primary key,
    dname       varchar2(20),
    loc         varchar2(10)
);

create table emp7
(
    empno       number(10),
    ename       varchar2(20),
    sal         number(10),
    deptno      number(10) constraint emp7_deptno_fk references dept7(deptno)
);

alter table dept7
    drop constraint
        dept_deptno_pk;

alter table dept7
    drop constraint dept_deptno_pk cascade;

-- 109

with job_sumsal as (select job, sum(sal) as total
                        from EMP
                        group by job)
select job, total
    from job_sumsal
    where total > (select avg(total) from job_sumsal);

select * from system.emp;
select * from emp;

update emp
    set sal = 5000
    where ename = 'KING';

delete from emp
    where ename = 'JACK';

commit;

select job, sum(sal) as total
    from EMP
    group by job
    having sum(sal) > (select avg(sum(sal))
                       from emp
                        group by job);

-- 110

with job_sumsal as (select job, sum(sal) as total
                        from EMP
                        group by job),
     deptno_sumsal as (select deptno, sum(sal) as total
                        from emp
                        group by deptno
                        having sum(sal) > (select avg(total) + 3000 from job_sumsal))
select deptno, total
    from deptno_sumsal;

select ename, sal
    from system.emp
    where deptno = 20;

select ename, deptno
    from emp;

update emp
    set deptno = 10
    where ename = 'KING';

commit;

