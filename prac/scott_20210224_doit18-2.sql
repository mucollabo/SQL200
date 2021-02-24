set SERVEROUTPUT on;

declare
    v_wrong number;
begin
    select dname into v_wrong
        from dept
       where deptno = 10;
end;
/

declare
    v_wrong number;
begin
    select dname into v_wrong
        from dept
       where deptno = 10;
exception
    when value_error then
        dbms_output.put_line('예외 처리 : 수치 또는 값 오류 발생');
end;
/

declare
    v_wrong number;
begin
    select dname into v_wrong
        from dept
       where deptno = 10;
       
    dbms_output.put_line('예외가 발생하면 다음 문장은 실행되지 않습니다');
exception
    when value_error then
        dbms_output.put_line('예외 처리 : 수치 또는 값 오류 발생');
end;
/

declare
    v_wrong number;
begin
    select dname into v_wrong
        from dept
       where deptno = 10;
       
    dbms_output.put_line('예외가 발생하면 다음 문장은 실행되지 않습니다');

exception
    when too_many_rows then
        dbms_output.put_line('예외 처리 : 요구보다 많은 행 추출 오류 발생');
    when value_error then
        dbms_output.put_line('예외 처리 : 수치 또는 값 오류 발생');
    when others then
        dbms_output.put_line('예외 처리 : 사전 정의 외 오류 발생');
end;
/

declare
    v_wrong number;
begin
    select dname into v_wrong
        from dept
       where deptno = 10;
       
    dbms_output.put_line('예외가 발생하면 다음 문장은 실행되지 않습니다');

exception
    when others then
        dbms_output.put_line('예외 처리 : 사전 정의 외 오류 발생');
        dbms_output.put_line('SQLCODE : ' || to_char(sqlcode));
        dbms_output.put_line('SQLERRM : ' || sqlerrm);
end;
/

-- Q1
-- 01

declare
    v_emp_row emp%rowtype;
    cursor c1 is
        select *
            from emp;
begin
    open c1;
    loop
        fetch c1 into v_emp_row;
        exit when c1%notfound;
        dbms_output.put_line('EMPNO : '     || v_emp_row.empno
                        || ', ENAME : '     || v_emp_row.ename
                        || ', JOB : '       || v_emp_row.job
                        || ', SAL : '       || v_emp_row.sal
                        || ', deptno : '    || v_emp_row.deptno
                        );
    end loop;
    close c1;
end;
/

-- 02

declare
    cursor c1 is
        select *
            from emp;
begin
    for c1_rec in c1 loop 
        dbms_output.put_line('EMPNO : '     || c1_rec.empno
                        || ', ENAME : '     || c1_rec.ename
                        || ', JOB : '       || c1_rec.job
                        || ', SAL : '       || c1_rec.sal
                        || ', deptno : '    || c1_rec.deptno
                        );
    end loop;
end;
/

-- Q2

declare
    v_wrong date;
begin
    select ename into v_wrong
        from emp
      where empno = 7369;
      
      dbms_output.put_line('예외가 발생하면 다음 문장은 실행되지 않습니다');
      
exception
    when others then
        dbms_output.put_line('오류가 발생하였습니다.' || to_char(sysdate, '[YYYY"년"MM"월"DD"일" HH24"시"mm"분"SS"초"]'));
        dbms_output.put_line('SQLCODE : ' || to_char(sqlcode));
        dbms_output.put_line('SQLERRM : ' || sqlerrm);
end;
/

DECLARE
   v_wrong DATE;
BEGIN
   SELECT ENAME INTO v_wrong
     FROM EMP
    WHERE EMPNO = 7369;

    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다');

EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('오류가 발생하였습니다.' 
                        || TO_CHAR(SYSDATE, '[YYYY"년"MM"월"DD"일" HH24"시"mm"분"SS"초"]'));
                
      DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
      DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/

