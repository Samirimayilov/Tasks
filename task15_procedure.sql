--task 1 Loanın bütün datalarını çıxart
CREATE OR REPLACE PROCEDURE get_all_loan_data AS
BEGIN
  FOR i IN (SELECT *
            FROM loan)
  LOOP
    DBMS_OUTPUT.PUT_LINE(
    i.contract_id || ', ' || 
    i.act_date || ', ' || 
    i.first_name || ', ' || 
    i.last_name || ', ' || 
    i.amount || ', ' || 
    i.currency_id || ', ' ||
    i.interest_rate || ', ' ||
    i.filial_id || ', ' || 
    i.commission || ', ' || 
    i.email);
  END LOOP;
END;
/
EXEC get_all_loan_data ;
select *  from loan;
CREATE OR REPLACE PROCEDURE loan_for_amount AS
BEGIN
  FOR i IN (SELECT *
            FROM loan where amount between 7500 and 10000)
  LOOP
    DBMS_OUTPUT.PUT_LINE(
    i.contract_id || ', ' || 
    i.act_date || ', ' || 
    i.first_name || ', ' || 
    i.last_name || ', ' || 
    i.amount || ', ' || 
    i.currency_id || ', ' ||
    i.interest_rate || ', ' ||
    i.filial_id || ', ' || 
    i.commission || ', ' || 
    i.email);
  END LOOP;
END;
/
EXEC loan_for_amount ;

--task 2 loanda müəyyən aralıqda amountları olanların datalarını çıxart
CREATE OR REPLACE PROCEDURE loan_for_avg_amount AS
BEGIN
  FOR i IN (SELECT *
            FROM loan where amount > (select avg(amount) from loan))
  LOOP
    DBMS_OUTPUT.PUT_LINE(
    i.contract_id || ', ' || 
    i.act_date || ', ' || 
    i.first_name || ', ' || 
    i.last_name || ', ' || 
    i.amount || ', ' || 
    i.currency_id || ', ' ||
    i.interest_rate || ', ' ||
    i.filial_id || ', ' || 
    i.commission || ', ' || 
    i.email);
  END LOOP;
END;
/
EXEC loan_for_avg_amount ;

--task 3 daxil edilən Gross salaryni Net salaryə çevir
CREATE OR REPLACE PROCEDURE return_net_salary(gross_salary NUMBER) IS
Net_SALARY NUMBER:=0;
BEGIN
  SELECT GROSS_SALARY - VERGI AS NET_SALARY INTO NET_SALARY FROM ( SELECT CASE
  WHEN GROSS_SALARY>8000 THEN GROSS_SALARY*0.14 + (80+ (GROSS_SALARY-8000)*0.5)+ (6+ (GROSS_SALARY-200)*0.1)
  WHEN GROSS_SALARY > 200 THEN (6+ (GROSS_SALARY-200)*0.1) + (GROSS_SALARY*0.02)/2 
  WHEN GROSS_SALARY < 200 THEN GROSS_SALARY*0.03 + (GROSS_SALARY* 0.02)/2 
  END AS VERGI,S.* FROM DUAL s)  w;
DBMS_OUTPUT.PUT_LINE('NET SALARY :' || NET_SALARY);
END;
/
EXEC RETURN_NET_SALARY(7000);
EXEC RETURN_NET_SALARY(9700);

--Task 4 Daxil edilən fillial id üçün ortalama amountu çıxart
CREATE OR REPLACE PROCEDURE get_avg_amount_for_filial(filial_id IN NUMBER) IS
 AVG_amount NUMBER;
BEGIN
  SELECT ROUND(AVG(amount)) INTO avg_amount
  FROM loan 
  WHERE get_avg_amount_for_filial.filial_id = filial_id;
 DBMS_OUTPUT.PUT_LINE('The average salary for ' || get_avg_amount_for_filial.filial_id || ' is: ' || avg_amount);
END;
/
DECLARE
  avg_amount NUMBER;
BEGIN
  get_avg_amount_for_filial(2);
END;
/


SELECT AVG(AMOUNT) FROM LOAN WHERE FILIAL_ID =1;

CREATE OR REPLACE PROCEDURE BEST_WORKER 
AS 
BEGIN
  FOR i IN (SELECT *
            FROM loan where INTEREST_RATE > (select avg(INTEREST_RATE) from loan))
  LOOP
    DBMS_OUTPUT.PUT_LINE(
    i.contract_id || ', ' || 
    i.act_date || ', ' || 
    i.first_name || ', ' || 
    i.last_name || ', ' || 
    i.amount || ', ' || 
    i.currency_id || ', ' ||
    i.interest_rate || ', ' ||
    i.filial_id || ', ' || 
    i.commission || ', ' || 
    i.email);
  END LOOP;
END;
/
DECLARE
BEGIN
  BEST_WORKER;
END;
/

CREATE OR REPLACE PROCEDURE loan_for_amount(
MAX_AMOUNT NUMBER,MIN_AMOUNT NUMBER) AS
BEGIN
  FOR i IN (SELECT *
            FROM loan where amount between MIN_AMOUNT and MAX_AMOUNT)
  LOOP
    DBMS_OUTPUT.PUT_LINE(
    i.contract_id || ', ' || 
    i.act_date || ', ' || 
    i.first_name || ', ' || 
    i.last_name || ', ' || 
    i.amount || ', ' || 
    i.currency_id || ', ' ||
    i.interest_rate || ', ' ||
    i.filial_id || ', ' || 
    i.commission || ', ' || 
    i.email);
  END LOOP;
END;
/
EXEC loan_for_amount(10000,7000);
