drop table sample;

create table sample
( num  number(10),
 fruit   varchar2(10) );

insert into sample values (1, 'apple');
insert into sample values (2, 'banana');
insert into sample values (3, 'orange');
commit;

select * from sample;