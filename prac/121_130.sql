--SQL200
--121

accept p_n1 prompt '첫 번째 숫자를 입력하세요.';
accept p_n2 prompt '두 번째 숫자를 입력하세요.';

with num_d as (select &p_n1 as num1, &p_n2 as num2
                    from dual)
select num1, num2, max(level) as "최대 공약수"
    from num_d
    where mod(num1, level) = 0
    and   mod(num2, level) = 0
    connect by level <= num2;
    
--122

accept p_n1 prompt '첫 번째 숫자를 입력하세요.';
accept p_n2 prompt '두 번째 숫자를 입력하세요.';

with num_d as (select &p_n1 as num1, &p_n2 as num2
                    from dual)
select num1, num2, (num1/max(level)) * (num2/max(level)) * max(level) as "최소 공배수"
    from num_d
    where mod(num1, level) = 0
      and mod(num2, level) = 0
    connect by level <= num2;
    
--123

accept num1 prompt '밑변의 길이를 입력하세요 ~ ';
accept num2 prompt '높이를 입력하세요 ~ ';
accept num3 prompt '빗변의 길이를 입려하세요 ~ ';

select case when (power(&num1, 2) + power(&num2, 2)) = power(&num3, 2)
                then '직각삼각형이 맞습니다.'
                else '직각삼각형이 아닙니다.'
                end as "피타고라스의 정리"
    from dual;
    
--124

select sum(case when (power(num1, 2) + power(num2, 2)) <= 1
                    then 1
                    else 0
                    end)/100000 * 4 as "원주율"
    from (
        select dbms_random.value(0, 1) as num1,
               dbms_random.value(0, 1) as num2
            from dual
        connect by level < 100000
        );
        
--125

with loop_table as (select level as num
                        from dual
                        connect by level <= 800000)
select result
    from (select num, power((1 + 1/num), num) as result
            from loop_table)
    where num = 800000;

commit;
