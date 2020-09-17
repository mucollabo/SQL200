-- ����_186 SQL�� �ӽŷ��� �����ϱ�8(RANDOM FOREST) 

SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT P_SATIS PROMPT 'ȸ�� �������� ��� �ǽó���? ����: 0~1 (��: 0.32) '
ACCEPT P_EVALU PROMPT '������ �ٹ� �򰡴� ��� �ǽó���? ����:0~1 (��: 0.8) '
ACCEPT P_PROJECT PROMPT '�����ߴ� ������Ʈ�� ������ ��� �ǽó���? (��: 3) '
ACCEPT P_AVG_MONTH_HOURS PROMPT '�� ��� �ٹ��ð��� ��� �ǽó���? (��: 160)'
ACCEPT P_TIME_SPEND_COMP PROMPT '�ٹ������ ��� �ǳ���? (��: 3) '
ACCEPT P_WORK_ACC PROMPT '�ٹ��ϴ� ���� ����Ų ��� �Ǽ���? (��: 2)'
ACCEPT P_PROMO_LAST_5Y PROMPT '���� 5�⵿�� ������ Ƚ����? (��: 2) '
PROMPT 'SALES/PRODUCT_MNG/ACCOUNTING/HR/IT/RANDD/TECHNICAL/MANAGEMENT/MARKETING/SUPPORT '
ACCEPT P_SALES PROMPT '���ϴ� �μ��� ����Դϱ�? '
ACCEPT P_SALARY PROMPT '������ ������? (��: LOW/MEDIUM/HIGH) '

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

DBMS_OUTPUT.PUT_LINE('�ӽŷ����� ������ ���: ����� �����Դϴ�. ����� Ȯ���� ' || ROUND(V_PROB,2) * 100 || '%�Դϴ�');

ELSE 

DBMS_OUTPUT.PUT_LINE('�ӽŷ����� ������ ���: ����� ������ �ƴմϴ�. ������� ���� Ȯ���� ' || ROUND(V_PROB,2) * 100 || '%�Դϴ�');

END IF;

END;
/
