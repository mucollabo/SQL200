create user orclstudy
identified by oracle;

grant create session, RESOURCE, create TABLE to orclstudy;

select * from all_users
  where username = 'ORCLSTUDY';
  
select * from DBA_USERS
  where username = 'ORCLSTUDY';
  
select * from dba_objects
  where owner = 'ORCLSTUDY';
  
alter user orclstudy
identified by orcl;

drop user orclstudy;

drop user orclstudy cascade;

alter user orclstudy
quota 2m on users;

revoke RESOURCE, CREATE TABLE from ORCLSTUDY;

commit;