drop table sample;

create table sample
( num  number(10),
 fruit   varchar2(10) );

insert into sample values (1, '사과');
insert into sample values (2, '바나나');
insert into sample values (3, '오렌지');
commit;

select * from sample;