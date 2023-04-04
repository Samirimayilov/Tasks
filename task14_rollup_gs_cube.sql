CREATE TABLE sales (
  region VARCHAR(50),
  product VARCHAR(50),
  sales_amount NUMBER(10,2)
);

CREATE TABLE expenses (
  region VARCHAR(50),
  expense_type VARCHAR(50),
  expense_amount NUMBER(10,2)
);
INSERT INTO sales (region, product, sales_amount)
VALUES ('North', 'Widget A', 100);

INSERT INTO sales (region, product, sales_amount)
VALUES ('North', 'Widget B', 150);

INSERT INTO sales (region, product, sales_amount)
VALUES ('South', 'Widget A', 200);

INSERT INTO sales (region, product, sales_amount)
VALUES ('South', 'Widget B', 250);

INSERT INTO sales (region, product, sales_amount)
VALUES ('East', 'Widget A', 300);

INSERT INTO sales (region, product, sales_amount)
VALUES ('East', 'Widget B', 350);

INSERT INTO sales (region, product, sales_amount)
VALUES ('West', 'Widget A', 400);

INSERT INTO sales (region, product, sales_amount)
VALUES ('West', 'Widget B', 450);
INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('North', 'Advertising', 50);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('North', 'Shipping', 75);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('South', 'Advertising', 100);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('South', 'Shipping', 125);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('East', 'Advertising', 150);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('East', 'Shipping', 175);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('West', 'Advertising', 200);

INSERT INTO expenses (region, expense_type, expense_amount)
VALUES ('West', 'Shipping', 225);

--Rollup
SELECT e.region, s.product, e.expense_type, SUM(s.sales_amount) , SUM(e.expense_amount)
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY ROLLUP(e.region, s.product, e.expense_type);

SELECT E.REGION,S.PRODUCT ,SUM(S.SALES_AMOUNT) 
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY ROLLUP(e.region, s.product);

SELECT E.REGION,S.PRODUCT ,SUM(S.SALES_AMOUNT) 
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY ROLLUP(e.region, s.product)
HAVING E.REGION ='West';

SELECT EMPNO, ENAME , MGR 
FROM EMP
GROUP BY ROLLUP(EMPNO,ENAME ,MGR);

SELECT EMPNO, ENAME , MGR 
FROM EMP
GROUP BY ROLLUP(EMPNO,ENAME ,MGR)
HAVING ENAME = 'FORD';

CREATE OR REPLACE VIEW 
MGR_TAB AS ( 
SELECT * FROM EMP 
WHERE EMPNO IN (SELECT MGR FROM EMP));
SELECT * FROM MGR_TAB;

SELECT E.ENAME , M.ENAME 
FROM EMP E JOIN MGR_TAB M ON E.MGR = M.EMPNO;

SELECT E.ENAME , M.ENAME 
FROM EMP E JOIN MGR_TAB M ON E.MGR = M.EMPNO
GROUP BY ROLLUP (E.ENAME,M.ENAME);

SELECT E.ENAME , M.ENAME 
FROM EMP E JOIN MGR_TAB M ON E.MGR = M.EMPNO
GROUP BY  E.ENAME,ROLLUP(M.ENAME);

SELECT E.REGION,S.PRODUCT , E.EXPENSE_TYPE
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY ROLLUP(e.region, s.product, E.EXPENSE_TYPE);

SELECT E.REGION,S.PRODUCT , E.EXPENSE_TYPE
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY ROLLUP(e.region, s.product, E.EXPENSE_TYPE)
HAVING E.EXPENSE_TYPE = 'Shipping';

SELECT 
  region, 
  product, 
  SUM(sales_amount) AS total_sales_amount
FROM sales 
GROUP BY ROLLUP(region, product)
HAVING GROUPING_ID(region, product) IN (0, 3);

SELECT * FROM sales s
JOIN expenses e ON s.region = e.region;
--------
--Grouping set
SELECT 
  product,
  region,
  SUM(sales_amount) AS total_sales_amount
FROM sales
GROUP BY GROUPING SETS (product, region);

SELECT EMPNO ,ENAME , JOB ,SAL 
FROM EMP 
GROUP BY GROUPING SETS (EMPNO ,ENAME) ,(JOB,SAL);

SELECT EMPNO ,ENAME , JOB ,SAL 
FROM EMP 
GROUP BY EMPNO , GROUPING SETS (ENAME,JOB ) ,(JOB,SAL);


SELECT EMPNO ,ENAME , JOB ,SAL 
FROM EMP 
GROUP BY EMPNO , GROUPING SETS (ENAME,JOB ) ,(JOB,SAL)
HAVING SAL> 2000;


SELECT EMPNO ,ENAME , JOB ,SAL 
FROM EMP 
GROUP BY EMPNO , GROUPING SETS (ENAME,JOB ) ,(JOB,SAL)
HAVING ENAME LIKE '%A%';

SELECT REGION,PRODUCT , SALES_AMOUNT 
FROM SALES
GROUP BY GROUPING SETS (REGION,PRODUCT),(PRODUCT , SALES_AMOUNT);

SELECT E.REGION,S.PRODUCT ,EXPENSE_TYPE
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY GROUPING SETS(e.region, s.product), (S.PRODUCT,E.EXPENSE_TYPE);

SELECT EMPNO ,ENAME , JOB ,SAL ,GROUPING_ID(EMPNO,ENAME) GROUPING
FROM EMP 
GROUP BY GROUPING SETS (EMPNO ,ENAME) ,(JOB,SAL);

SELECT * FROM EXPENSES;

CREATE OR REPLACE SYNONYM EXP FOR EXPENSES;

SELECT EXPENSE_ID ,REGION ,EXPENSE_TYPE,EXPENSE_DATE
FROM EXP
GROUP BY EXPENSE_ID, GROUPING SETS (REGION,EXPENSE_TYPE),(EXPENSE_DATE);

---Cube
SELECT e.region, s.product, e.expense_type, 
SUM(s.sales_amount) , SUM(e.expense_amount)
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY CUBE(e.region, s.product, e.expense_type);

SELECT E.REGION,S.PRODUCT ,SUM(S.SALES_AMOUNT) 
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY CUBE(e.region, s.product);

SELECT E.REGION,S.PRODUCT ,SUM(S.SALES_AMOUNT) 
FROM sales s
JOIN expenses e ON s.region = e.region
GROUP BY CUBE(e.region, s.product)
HAVING E.REGION ='West';


SELECT EMPNO, MGR 
FROM EMP
GROUP BY CUBE(EMPNO,MGR) ;

SELECT E.ENAME , M.ENAME 
FROM EMP E JOIN MGR_TAB M ON E.MGR = M.EMPNO
GROUP BY CUBE ( E.ENAME,M.ENAME);


SELECT REGION,PRODUCT 
FROM sales 
GROUP BY CUBE(region, product);


