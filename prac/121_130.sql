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

--126

create table cancer
(암종     varchar2(50),
 질병코드   varchar2(20),
 환자수    number(10),
 성별     varchar2(20),
 조유병률   number(10, 2),
 생존율    number(10, 2));
 
select * from cancer;

commit;

--127

create table speech
(speech_text        varchar2(1000));

select count(*) from speech;

select REGEXP_SUBSTR('I never graduated from college', '[^ ]+', 1, 2) word 
     FROM DUAL;
     
select regexp_substr(lower(speech_text), '[^ ]+', 1, a) word
    from speech, (select level a
                    from dual
                    connect by level <= 52);
                    
select word, count(*)
    from (select regexp_substr(lower(speech_text), '[^ ]+', 1, a) word
            from speech, (select level a
                            from dual
                            connect by level <= 52)
            )
    where word is not null
    group by word
    order by count(*) desc;
    
--128

create table positive (p_text       varchar2(2000));
create table negative (n_text       varchar2(2000));

drop view vw_emp30all;

create view speech_view
as
select regexp_substr(lower(speech_text), '[^ ]+', 1, a) word
    from speech, (select level a
                    from dual
                    connect by level <= 52);
                    
select count(word) as 긍정단어
    from speech_view
    where lower(word) in (select lower(p_text) from positive);

select count(word) as 부정단어
    from speech_view
    where lower(word) in (select lower(n_text) from negative);
    
--129

create table crime_day
(crime_type         varchar2(50),
 sun_cnt            number(10),
 mon_cnt            number(10),
 tue_cnt            number(10),
 wed_cnt            number(10),
 thu_cnt            number(10),
 fri_cnt            number(10),
 sat_cnt            number(10),
 unknown_cnt        number(10));
 
create table crime_day_unpivot
as
select *
    from crime_day
    unpivot (cnt for day_cnt in (sun_cnt, mon_cnt, tue_cnt, wed_cnt, thu_cnt, fri_cnt, sat_cnt));
    
select * from crime_day_unpivot;

select * from crime_day;

select *
    from ( select day_cnt, cnt, rank() over (order by cnt desc) rnk
                from crime_day_unpivot
                where trim(crime_type) = '절도'
                )
    where rnk = 1;
    
--130

create table university_fee
(division           varchar2(20),
 type               varchar2(20),
 university         varchar2(60),
 loc                varchar2(40),
 admission_cnt      number(20),
 admission_fee      number(20),
 tution_fee         number(20));
 
alter table university_fee rename COLUMN tution_fee to tuition_fee;

desc university_fee;
 
select *
    from (select university, tuition_fee, rank() over (order by tuition_fee desc nulls last) 순위
                from university_fee)
    where 순위 = 1;
    
commit;

