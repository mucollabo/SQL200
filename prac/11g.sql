select * from dept_temp2;

alter table dept
drop column sumsal;

commit;

create table dept_tcl
    as select *
        from dept;
        
select * from dept_tcl;

insert into dept_tcl values(50, 'DATABASE', 'SEOUL');
update dept_tcl set loc = 'BUSAN' where deptno = 40;
delete from dept_tcl where dname = 'RESEARCH';
rollback;

select * from dept_tcl;

insert into dept_tcl values(50, 'NETWORK', 'SEOUL');
update dept_tcl set loc = 'BUSAN' where deptno = 20;
delete from dept_tcl where deptno = 40;
select * from dept_tcl;

commit;

