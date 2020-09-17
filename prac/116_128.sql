create table speech
( SPEECH_TEXT   VARCHAR2(1000));

select count(*) from speech;

select REGEXP_SUBSTR('I never graduated from college', '[^ ]+', 1, 2) word
 FROM DUAL;
 
select REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word 
 FROM speech,   (select level a
                    from dual
                    connect by level <= 52);
                    
select word, count(*)
    from ( select REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
             from speech,   ( select level a
                                 from dual
                                 connect by level <= 52)
          )
where word is not null
group by word
order by count(*) desc;

create table positive ( P_text  varchar2(2000));
create table negative ( N_text  varchar2(2000));

create view speech_view
as
select REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
    from speech,   ( select level a
                        from dual
                        connect by level <= 52);
                        
select count(word) as 긍정단어
    from speech_view
    where lower(word) in (select lower(p_text)
                            from positive);
                            
select count(word) as 부정단어
    from speech_view
    where lower(word) in (select lower(n_text)
                            from negative);