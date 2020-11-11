create table working_time
( country   varchar2(30),
    Y_2014  number(10),
    Y_2015  number(10),
    Y_2016  number(10),
    Y_2017  number(10),
    Y_2018  number(10));

create view c_work_time
as
select *
    from working_time
    UNPIVOT (cnt for Y_YEAR in (Y_2014, Y_2015, Y_2016, Y_2017, Y_2018));

select country, cnt, rank() over (order by cnt desc) 순위
    from c_work_time
    where Y_YEAR = 'Y_2018';
    
create table cancer
(암종     VARCHAR2(50),
 질병코드  VARCHAR2(20),
 환자수    number(10),
 성별     varchar2(20),
 조유병률   number(10,2),
 생존률    number(10,2));
 
select distinct(암종), 성별, 환자수
    from cancer
    where 환자수 = (select max(환자수)
                    from cancer
                    where 성별 = '남자' and 암종 != '모든암')
UNION all
select distinct(암종), 성별, 환자수
    from cancer
    where 환자수 = (select max(환자수)
                    from cancer
                    where 성별 = '여자');
                    
set SERVEROUTPUT on
accept p_num1 prompt    '첫 번째 숫자를 입력하세요 ~ '
accept p_num2 prompt    '두 번째 숫자를 입력하세요 ~ '

DECLARE
        v_sum   number(10);
    begin
        v_sum := &p_num1 + &p_num2;
        
        dbms_output.put_line('총합은: ' || v_sum);
end;
/

set SERVEROUTPUT on
accept p_empno prompt '사원 번호를 입력하세요 ~ '
    declare
        v_sal   number(10);
    begin
        select sal into v_sal
            from emp
            where empno = &p_empno;
            
    dbms_output.put_line('행당 사원의 월급은 ' || v_sal);
    
end;
/