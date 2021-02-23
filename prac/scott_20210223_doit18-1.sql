--chap 18

set SERVEROUTPUT ON;

declare
    v_dept_row dept%rowtype;
begin
    select deptno, dname, loc into v_dept_row
        from dept
      where deptno = 40;
    dbms_output.put_line('deptno : ' || v_dept_row.deptno);
    dbms_output.put_line('dname : ' || v_dept_row.dname);
    dbms_output.put_line('loc : ' || v_dept_row.loc);
end;
/

declare
-- 커서 데이터를 입력할 변수 선언
v_dept_row dept%rowtype;

-- 명시적 커서 선언(Declaration)
cursor c1 is
    select deptno, dname, loc
        from dept
      where deptno = 40;
      
begin
-- 커서 열기(Open)
open c1;

-- 커서로부터 읽어온 데이터 사용(Fetch)
fetch c1 into v_dept_row;
dbms_output.put_line('deptno : ' || v_dept_row.deptno);
dbms_output.put_line('dname : ' || v_dept_row.dname);
dbms_output.put_line('loc : ' || v_dept_row.loc);

close c1;

end;
/

declare
    v_dept_row dept%rowtype;

cursor c1 is
    select deptno, dname, loc
        from dept;

begin

open c1;

loop
    fetch c1 into v_dept_row;
    
    exit when c1%notfound;
    
dbms_output.put_line('deptno : ' || v_dept_row.deptno
                    || ', dname : ' || v_dept_row.dname
                    || ', loc : ' || v_dept_row.loc);
end loop;

close c1;

end;
/

declare
    cursor c1 is
    select deptno, dname, loc
        from dept;
        
begin
    for c1_rec in c1 loop
        dbms_output.put_line('deptno : ' || c1_rec.deptno
                            || ', dname : ' || c1_rec.dname
                            || ', loc : ' || c1_rec.loc);
    end loop;
    
end;
/

declare
    v_dept_row dept%rowtype;
    cursor c1 (p_deptno dept.deptno%type) is
        select deptno, dname, loc
            from dept
          where deptno = p_deptno;
begin
    open c1 (10);
        loop
            fetch c1 into v_dept_row;
            exit when c1%notfound;
            dbms_output.put_line('10번 부서 - deptno : ' || v_dept_row.deptno
                                        || ', dname : ' || v_dept_row.dname
                                        || ', loc : ' || v_dept_row.loc);
        end loop;
    close c1;
    
    open c1 (20);
        loop
            fetch c1 into v_dept_row;
            exit when c1%notfound;
            dbms_output.put_line('20번 부서 - deptno : ' || v_dept_row.deptno
                                        || ', dname : ' || v_dept_row.dname
                                        || ', loc : ' || v_dept_row.loc);
        end loop;
    close c1;
end;
/

declare
    v_deptno dept.deptno%type;
    cursor c1 (p_deptno dept.deptno%type) is
        select deptno, dname, loc
            from dept
          where deptno = p_deptno;
begin
    v_deptno := &input_deptno;
    for c1_rec in c1(v_deptno) loop
        dbms_output.put_line('deptno : ' || c1_rec.deptno
                        || ', dname : ' || c1_rec.dname
                        || ', loc : ' || c1_rec.loc);
    end loop;
end;
/

begin
    update dept set dname = 'DATABASE'
        where deptno = 50;
        
    dbms_output.put_line('갱신된 행의 수 : ' || sql%rowcount);
    
    if (sql%found) then
        dbms_output.put_line('갱신 대상 행 존재 여부 : true');
    else
        dbms_output.put_line('갱신 대상 행 존재 여부 : false');
    end if;
    
    if (sql%isopen) then
        dbms_output.put_line('커서의 open 여부 : true');
    else
        dbms_output.put_line('커서의 open 여부 : false');
    end if;
    
end;
/
commit;