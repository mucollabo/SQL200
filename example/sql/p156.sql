drop table sample;

create table sample
( num  number(10),
 fruit   varchar2(10) );

insert into sample values (1, '���');
insert into sample values (2, '�ٳ���');
insert into sample values (3, '������');
commit;

select * from sample;