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

/*
undefine num1
undefine num2

with loop_table as (select level as num
                        from dual
                        connect by level <= &num1)
    select lpad(' ', &num2 - num, ' ') || lpad('★', num, '★') as "Triangle"
        from loop_table;

 */

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

