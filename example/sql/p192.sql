-- �� ����_192 SQL�� �ӽŷ��� �����ϱ�14(SUPPORT VECTOR MACHINE) 


SET SERVEROUTPUT ON
SET VERIFY OFF

ACCEPT P_ID PROMPT 'ȯ�� ��ȣ�� �Է��ϼ���~ (��: 845636 )'

DECLARE  
   V_PRED    VARCHAR2(20);
   V_PROB    NUMBER(10,2);

BEGIN

SELECT PREDICTION (WC_MODEL USING *),
       PREDICTION_PROBABILITY(WC_MODEL  USING * )  INTO V_PRED, V_PROB
FROM WISC_BC_DATA_TEST
WHERE ID = '&P_ID';

 IF V_PRED ='M' THEN 

   DBMS_OUTPUT.PUT_LINE('�ӽŷ����� ������ ���: ����� ȯ���Դϴ�. ������� Ȯ���� ' || ROUND(V_PROB,2) * 100 || '%�Դϴ�');

 ELSE 
    DBMS_OUTPUT.PUT_LINE('�ӽŷ����� ������ ���: ����� ȯ�ڰ� �ƴմϴ�. ����� ȯ�ڰ� �ƴ� Ȯ���� ' || ROUND(V_PROB,2) * 100 || '%�Դϴ�');

 END IF;

END;
/


