insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values (9999, '홍길동', 'PRESIDENT', null, '2001/01/01', 5000, 1000, 10);
        
select * from emp_temp;

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, null, 20);
        
select * from emp_temp;

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values (2111, '이순신', 'MANAGER', 9999, to_date('07/01/2001', 'DD/MM/YYYY'), 4000, null, 20);

select * from emp_temp;

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
        values (3111, '심청이', 'MANAGER', 9999, sysdate, 4000, null, 30);
        
select * from emp_temp;        

insert into emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
      from emp e, salgrade s
     where e.sal between s.losal and s.hisal
       and s.grade = 1;
       
select * from emp_temp;

commit;