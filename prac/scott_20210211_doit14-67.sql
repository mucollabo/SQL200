create table table_check(
    login_id    varchar2(20) constraint tblck_loginid_pk primary key,
    login_pwd   varchar2(20) constraint tblck_loginpw_ck check (length(login_pwd) > 3),
    tel         varchar2(20)
);

desc table_check;

insert into table_check
values ('TEST_ID', '123', '010-1234-5678');

insert into table_check
values ('TEST_ID', '1234', '010-1234-5678');

select * from table_check;

select owner, constraint_name, constraint_type, table_name
    from user_constraints
  where table_name like 'TABLE_CHECK';
  
create table table_default(
    login_id    varchar2(20) constraint tblck2_loginid_pk primary key,
    login_pwd   varchar2(20) default '1234',
    tel         varchar2(20)
);

desc table_default;

insert into table_default values ('TEST_ID', null, '010-1234-5678');

insert into table_default (login_id, tel) values ('TEST_ID2', '010-1234-5678');

select * from table_default;

create table dept_const (
    deptno      number(2) constraint deptconst_deptno_pk primary key,
    dname       varchar2(14) constraint deptconst_dname_unq unique,
    loc         varchar2(13) constraint deptconst_loc_nn not null
);

create table emp_const (
    empno       number(4) constraint empconst_empno_pk primary key,
    ename       varchar2(10) constraint empconst_ename_nn not null,
    job         varchar2(9),
    tel         varchar2(20) constraint empconst_tel_unq unique,
    hiredate    date,
    sal         number(7, 2) constraint empconst_sal_chk check (sal >= 1000 and sal <= 9999),
    comm        number(7, 2),
    deptno      number(2) constraint empconst_deptno_fk references dept_const (deptno)
);

select table_name, constraint_name, constraint_type
    from user_constraints
  where table_name in ('EMP_CONST', 'DEPT_CONST')
  order by constraint_name;