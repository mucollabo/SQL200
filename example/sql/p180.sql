-- ����_180 SQL�� �ӽŷ��� �����ϱ�2(NAIVEBAYES) 

SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT P_CHILLS PROMPT '������ �ֽ��ϱ�(Y/N) ? '
ACCEPT P_RUNNY_NOSE PROMPT '�๰�� �ֽ��ϱ�(Y/N) ? '
ACCEPT P_HEAD_ACHE PROMPT '������ �ֽ��ϱ�(STRONG/MILD/NO) ? '
ACCEPT P_FEVER PROMPT '���� �ֽ��ϱ�(Y/N) ? ' 

DECLARE  
   V_PRED    VARCHAR2(20);
   V_PROB    NUMBER(10,2);

BEGIN 
WITH TEST_DATA AS (SELECT UPPER('&P_CHILLS') CHILLS ,
UPPER('&P_RUNNY_NOSE') RUNNY_NOSE, 
                           UPPER('&P_HEAD_ACHE') HEADACHE, 
UPPER('&P_FEVER') FEVER
                         FROM DUAL )
SELECT PREDICTION (MD_CLASSIFICATION_MODEL USING *),
       PREDICTION_PROBABILITY(MD_CLASSIFICATION_MODEL USING * )  INTO V_PRED, V_PROB
FROM TEST_DATA;

 IF V_PRED ='Y' THEN 

   DBMS_OUTPUT.PUT_LINE('�ӽŷ����� ������ ���: �����Դϴ�. 
������ Ȯ���� ' || ROUND(V_PROB,2) * 100 || '%�Դϴ�');

 ELSE 
DBMS_OUTPUT.PUT_LINE('�ӽŷ����� ������ ���: ������ �ƴմϴ�.
������ �ƴ� Ȯ���� ' || ROUND(V_PROB,2) * 100 || '%�Դϴ�');

 END IF;

END;
/
