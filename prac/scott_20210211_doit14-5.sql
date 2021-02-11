create table table_pk(
    login_id    varchar2(20) primary key,
    login_pwd   varchar2(20) not null,
    tel         varchar(20)
);

desc table_pk;

select owner, constraint_name, constraint_type, table_name
    from user_constraints
  where table_name like 'TABLE_PK%';
  
select index_name, table_owner, table_name
    from user_indexes
  where table_name like 'TABLE_PK%';
  
create table table_pk2(
    login_id    varchar2(20) constraint tblpk2_lgnid_pk primary key,
    login_pwd   varchar2(20) constraint tblpk2_lgnpw_nn not null,
    tel         varchar2(20)
);

desc table_pk2;

insert into table_pk(login_id, login_pwd, tel)
values('TEST_ID_01', 'PWD01', '010-1234-5678');

select * from table_pk;

insert into table_pk(login_id, login_pwd, tel)
values('TEST_ID_01', 'PWD01', '010-2345-6789');

insert into table_pk(login_id, login_pwd, tel)
values(null, 'PWD02', '010-2345-6789');

insert into table_pk(login_id, login_pwd, tel)
values('PWD02', '010-2345-6789');

select owner, constraint_name, constraint_type, table_name, r_owner, r_constraint_name
    from user_constraints
  where table_name in ('EMP', 'DEPT');
  
create table dept_fk(
    deptno  number(2) constraint deptfk_deptno_pk primary key,
    dname   varchar2(14),
    loc     varchar2(13)
);

desc dept_fk;

create table emp_fk(
    empno   number(4) constraint empfk_empno_pk primary key,
    ename   varchar2(10),
    job     varchar2(9),
    mgr     number(4),
    hiredate    date,
    sal     number(7, 2),
    comm    number(7, 2),
    deptno  number(2) constraint empfk_deptno_fk references dept_fk (deptno)
);

desc emp_fk;

select * from emp_fk;

insert into emp_fk
values(9999, 'TEST_NMAKE', 'TEST_JOB', null, to_date('2001/01/01', 'YYYY/MM/DD'), 3000, null, 10);

insert into dept_fk
values(10, 'TEST_DNAME', 'TEST_LOC');

select * from dept_fk;

insert into emp_fk
values(9999, 'TEST_NMAKE', 'TEST_JOB', null, to_date('2001/01/01', 'YYYY/MM/DD'), 3000, null, 10);

select * from emp_fk;

delete from dept_fk
where deptno = 10;

commit;

