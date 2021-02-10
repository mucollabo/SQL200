create table table_unique(
    login_id    varchar2(20) unique,
    login_pwd   varchar2(20) not null,
    tel         varchar2(20)
);

desc table_unique;

select owner, constraint_name, constraint_type, table_name
    from user_constraints
  where table_name like 'TABLE_UNIQUE%';
  
insert into table_unique(login_id, login_pwd, tel)
values('TEST_ID_01', 'PWd01', '010-1234-5678');

select * from table_unique;

insert into table_unique(login_id, login_pwd, tel)
values(NULL, 'PWd01', '010-2345-6789');

update table_unique
    set login_id='TEST_ID_01'
  where login_id is null;
  
create table table_unique2(
    login_id    varchar2(20) constraint tblunq2_lgnid_unq unique,
    login_pwd   varchar2(20) constraint tblunq2_lgnpw_nn not null,
    tel         varchar2(20)
);

alter table table_unique
modify(tel unique);

update table_unique
    set tel = null;
select * from table_unique;

alter table table_unique2
modify(tel constraint tblunq_tel_unq unique);

alter table table_unique2
rename constraint tblunq_tel_unq to tblunq2_tel_unq;

alter table table_unique2
drop constraint tblunq2_tel_unq;

commit;

