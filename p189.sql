set serveroutput on
set verify off

accept p_cement prompt '시멘트의 총량을 입력하세요? 단위:kg (범위: 0~540) '
accept p_salg prompt '슬래그 시멘트의 총량을 입력하세요? 단위:kg (범위: 0~360) '
accept p_ash prompt '회분의 총량을 입력하세요? 단위:kg (예: 0~195) '
accept p_water prompt '물의 총량을 입력하세요? 단위:kg (예: 0~137) '
accept p_superplastic prompt '고성능 감수제의 총량을 입력하세요? 단위:kg (범위: 0~32) '
accept p_coarseagg prompt '굵은 자갈의 총량을 입력하세요? 단위:kg (예: 0~1125)'
accept p_fineagg prompt '잔 자갈의 총량을 입력하세요? 단위:kg (예: 0~594) '
accept p_age prompt '숙성 기간을 입력하세요? 단위: day (예: 0~ 365) '

declare  
   v_pred    varchar2(20);

begin 
with test_data as ( select  '&p_cement' CEMENT,
                                   '&p_salg' SLAG, 
                                   '&p_ash' ASH, 
                                   '&p_water' WATER,
                                   '&p_superplastic' SUPERPLASTIC,
                                   '&p_coarseagg' COARSEAGG,
                                   '&p_fineagg' FINEAGG,
                                   '&p_age' AGE 
                            from dual)
SELECT PREDICTION (MD_GLM_MODEL   USING *) into v_pred
  FROM test_data ;

 dbms_output.put_line('머신러닝이 예측한 콘크리트 강도는 ' || round(v_pred,2) || '입니다. 테스트 데이터의 최대 강도는 82.6 입니다');

end;
/
