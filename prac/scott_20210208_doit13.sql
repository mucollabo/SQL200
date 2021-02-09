select * from dba_users;

select * from dict;

select * from dictionary;

select table_name
    from user_tables;
    
select owner, table_name
    from all_tables;
    
select * from dba_tables;

select *
    from dba_users
    where username = 'SCOTT';
    
select *
    from user_indexes;
    
select *
    from user_ind_columns;
    
create INDEX idx_emp_sal
    on emp(sal);
    
select * from user_ind_columns;

drop index idx_emp_sal;

select * from user_ind_columns;

commit;

select empno, ename, job, deptno
    from emp
    where deptno = 20;
    
select * from dba_users;

create view vw_emp20
    as (select empno, ename, job, deptno
            from emp
            where deptno = 20);

select *
    from user_views;
    
select view_name, text_length, text
    from user_views;
    
select *
    from vw_emp20;
    
create view vw_emp30all
    as (select *
        from emp
        where deptno = 30);
        
select *
    from vw_emp30all;
    
drop view vw_emp20;

select * from user_views;

select rownum, e.*
    from emp e;
    
select rownum, e.*
    from emp e
    order by sal desc;
    
select rownum, e.*
    from (select *
            from emp e
        order by sal desc) e
    where rownum <= 3;
    
with e as (select * from emp order by sal desc)
select rownum, e.*
    from e
    where rownum <= 3;
    
create table dept_sequence
    as select *
        from dept
        where 1 <> 1;
        
select * from dept_sequence;

create sequence seq_dept_sequence
    increment by 10
    start with 10
    maxvalue 90
    minvalue 0
    nocycle
    cache 2;
    
select *
    from user_sequences;
    
insert into dept_sequence (deptno, dname, loc)
values (seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');

select * from dept_sequence order by deptno;

select seq_dept_sequence.currval
    from dual;
    
insert into dept_sequence (deptno, dname, loc)
values (seq_dept_sequence.nextval, 'DATABASE', 'SEOUL');

select * from dept_sequence order by deptno;

alter sequence seq_dept_sequence
    increment by 3
    maxvalue 99
    cycle;
    
select *
    from user_sequences;
    
drop sequence seq_dept_sequence;

select * from user_sequences;

create synonym e
    for emp;
    
select * from e;

drop synonym e;

drop view VW_EMP20;

select * from vw_emp20;

create table empidx
    as (select *
          from emp);
          
select * from empidx;

drop table empidx;

create index idx_empidx_empno
    on empidx(empno);
    
select * from user_indexes;

select *
    from user_indexes
    where index_name = 'IDX_EMPIDX_EMPNO';
    
create or replace view empidx_over15k
    as (select empno, ename, job, deptno, sal, nvl2(comm, 'O', 'X') as comm
        from empidx
        where sal > 1500);
        
select * from empidx_over15k;

select * from dept;

create table deptseq
    as (select * from dept);
    
select * from deptseq;

create sequence deptseq_sequence
    increment by 1
    start with 1
    maxvalue 99
    minvalue 1
    nocycle
    nocache;
    
insert into deptseq (deptno, dname, loc)
values (DEPTSEQ_SEQUENCE.nextval, 'MOBILE', 'ILSAN');

commit;


