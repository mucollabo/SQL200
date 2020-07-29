-- 예제_186 SQL로 머신러닝 구현하기8(RANDOM FOREST) 

SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT P_SATIS PROMPT '회사 만족도는 어떻게 되시나요? 범위: 0~1 (예: 0.32) '
ACCEPT P_EVALU PROMPT '마지막 근무 평가는 어떻게 되시나요? 범위:0~1 (예: 0.8) '
ACCEPT P_PROJECT PROMPT '진행했던 프로젝트의 갯수는 어떻게 되시나요? (예: 3) '
ACCEPT P_AVG_MONTH_HOURS PROMPT '월 평균 근무시간은 어떻게 되시나요? (예: 160)'
ACCEPT P_TIME_SPEND_COMP PROMPT '근무년수는 어떻게 되나요? (예: 3) '
ACCEPT P_WORK_ACC PROMPT '근무하는 동안 일으킨 사고 건수는? (예: 2)'
ACCEPT P_PROMO_LAST_5Y PROMPT '지난 5년동안 승진한 횟수는? (예: 2) '
PROMPT 'SALES/PRODUCT_MNG/ACCOUNTING/HR/IT/RANDD/TECHNICAL/MANAGEMENT/MARKETING/SUPPORT '
ACCEPT P_SALES PROMPT '일하는 부서는 어디입니까? '
ACCEPT P_SALARY PROMPT '월급의 수준은? (예: LOW/MEDIUM/HIGH) '

DECLARE  
   V_PRED    VARCHAR2(20);
   V_PROB    NUMBER(10,2);

BEGIN 
WITH TEST_DATA AS ( SELECT UPPER('&P_SATIS') SATISFACTION_LEVEL,
                       UPPER('&P_EVALU') LAST_EVALUATION, 
                       UPPER('&P_PROJECT') NUMBER_PROJECT, 
                       UPPER('&P_AVG_MONTH_HOURS') AVERAGE_MONTLY_HOURS,
                       UPPER('&P_TIME_SPEND_COMP') TIME_SPEND_COMPANY,
                       UPPER('&P_WORK_ACC') WORK_ACCIDENT,
                       UPPER('&P_PROMO_LAST_5Y') PROMOTION_LAST_5YEARS,
                       UPPER('&P_SALES') SALES,
                       UPPER('&P_SALARY') SALARY
                     FROM DUAL )
SELECT PREDICTION (DT_MODEL4 USING *),
       PREDICTION_PROBABILITY(DT_MODEL4  USING * )  INTO V_PRED, V_PROB
FROM TEST_DATA ;

IF  V_PRED = 1  THEN 

DBMS_OUTPUT.PUT_LINE('머신러닝이 예측한 결과: 퇴사할 직원입니다. 퇴사할 확률은 ' || ROUND(V_PROB,2) * 100 || '%입니다');

ELSE 

DBMS_OUTPUT.PUT_LINE('머신러닝이 예측한 결과: 퇴사할 직원이 아닙니다. 퇴사하지 않을 확률은 ' || ROUND(V_PROB,2) * 100 || '%입니다');

END IF;

END;
/
