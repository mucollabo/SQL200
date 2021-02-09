create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel         varchar2(20)
    );
    
desc table_notnull;

insert into table_notnull (login_id, login_pwd, tel)
values ('TEST_ID_01', NULL, '010-1234-5678');

insert into table_notnull (login_id, login_pwd)
values ('TEST_ID_01', '1234');

select * from table_notnull;

update table_notnull
    set login_pwd = null
    where login_id = 'TEST_ID_01';
    
select owner, constraint_name, constraint_type, table_name
    from user_constraints;
    
create table table_notnull2(
    login_id    varchar2(20) constraint tblnn2_lgnid_nn not null,
    login_pwd   varchar2(20) constraint tblnn2_lgnpw_nn not null,
    tel         varchar2(20)
    );
    
select owner, constraint_name, constraint_type, table_name
    from user_constraints;
    
alter table table_notnull
modify(tel not null);

select * from table_notnull
    where tel is null;
    
update table_notnull
    set tel = '010-1234-5678'
  where login_id = 'TEST_ID_01';
  
select * from table_notnull;

alter table table_notnull2
modify(tel constraint tblnn_tel_nn not null);

select owner, constraint_name, constraint_type, table_name
    from user_constraints;
    
desc table_notnull2;

alter table table_notnull2
rename constraint tblnn_tel_nn to tblnn2_tel_nn;

alter table table_notnull2
drop constraint tblnn2_tel_nn;

desc table_notnull2;

alter table table_notnull2
modify(tel not null);
