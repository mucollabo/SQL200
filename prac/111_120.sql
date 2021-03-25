--SQL200
--111

with loop_table as (select level as num
                        from dual
                        connect by level <= 9)
    select '2' || ' X ' || num || ' = ' || 2 * num as "2단"
        from loop_table;

select level from dual connect by level <= 9;

--112

with loop_table as (select level + 1 as num
                        from dual
                        connect by level < 9),
        gugu_table as (select level as gugu
                            from dual
                            connect by level <= 9)
    select to_char(a.num) || ' X ' || to_char(b.gugu) || ' = ' || to_char(b.gugu * a.num) as gugudan
        from loop_table a, gugu_table b;

--113

with loop_table as (select level as num
                        from dual
                        connect by level <= 8)
    select lpad('★', num, '★') as star
        from loop_table;

select lpad('★', 10, '★') as star from dual;

--114

with loop_table as (select level as num
                        from dual
                        connect by level <= 8)
    select lpad(' ', 10 - num, ' ') || rpad('★', num, '★') as "Triangle"
        from loop_table;


undefine num1
undefine num2

with loop_table as (select level as num
                        from dual
                        connect by level <= &num1)
    select lpad(' ', &num2 - num, ' ') || lpad('★', num, '★') as "Triangle"
        from loop_table;



--115

undefine p_num
accept p_num prompt '숫자 입력 : '

select lpad(' ', &p_num - level, ' ') || rpad('★', level, '★') as star
    from dual
    connect by level < &p_num + 1
union all
select lpad(' ', level, ' ') || rpad('★', &p_num - level, '★') as star
    from dual
    connect by level < &p_num;

commit;

--116

undefine p_n1
undefine p_n2

accept p_n1 prompt '가로 숫자를 입력하세요~';
accept p_n2 prompt '세로 숫자를 입력하세요~';

with loop_table as (select level as num
                        from dual
                        connect by level <= &p_n2)
select lpad('★', &p_n1, '★') as star
    from loop_table;
    
undefine p_n
accept p_n prompt '숫자에 대한 값 입력:~';

select sum(level) as 합계
    from dual
    connect by level <= &p_n;
    
--118

undefine p_n
accept p_n prompt '숫자에 대한 값 입력:~';

select round(exp(sum(ln(level)))) 곱
    from dual
    connect by level <= 10;
    
--119

undefine p_n
accept p_n prompt '숫자에 대한 값 입력:~';

select listagg(level, ', ') within group(order by level) as even
    from dual
    where mod(level, 2) = 0
    connect by level <= &p_n;
    
--120

undefine p_n
accept p_n prompt '숫자에 대한 값 입력:~';

with loop_table as (select level as num
                        from dual
                        connect by level <= &p_n)
select l1.num as 소수
    from loop_table l1, loop_table l2
    where mod(l1.num, l2.num) = 0
    group by l1.num
    having count(l1.num) = 2;
    
with loop_table as (select level as num
                        from dual
                        connect by level <= 10)
select l1.num, count(l1.num)
    from loop_table l1, loop_table l2
    where mod(l1.num, l2.num) = 0
    group by l1.num
    order by l1.num;
    

