CREATE TABLE sales (
    id NUMBER(10) PRIMARY KEY,
    sale_date DATE,
    product_name VARCHAR2(50),
    sale_amount NUMBER(10, 2)
)
PARTITION BY RANGE(sale_date)(
    PARTITION sales_q1 VALUES LESS THAN (TO_DATE('01-APR-2022', 'DD-MON-YYYY')),
    PARTITION sales_q2 VALUES LESS THAN (TO_DATE('01-JUL-2022', 'DD-MON-YYYY')),
    PARTITION sales_q3 VALUES LESS THAN (TO_DATE('01-OCT-2022', 'DD-MON-YYYY')),
    PARTITION sales_q4 VALUES LESS THAN (TO_DATE('01-JAN-2023', 'DD-MON-YYYY'))
);
CREATE TABLE employees (
  employee_id NUMBER(6) PRIMARY KEY,
  first_name VARCHAR2(20),
  last_name VARCHAR2(25),
  hire_date DATE,
  department_id NUMBER(4)
)
PARTITION BY LIST (department_id)
(
  PARTITION part_sales VALUES (10, 20),
  PARTITION part_hr VALUES (30),
  PARTITION part_it VALUES (40, 50, 60)
);

CREATE TABLE employees3 (
  employee_id  NUMBER(6),
  first_name   VARCHAR2(20),
  last_name    VARCHAR2(25),
  hire_date    DATE,
  salary       NUMBER(8,2)
)
PARTITION BY HASH(employee_id)
PARTITIONS 4;

CREATE TABLE my_table (
   id NUMBER,
   name VARCHAR2(50),
   date_created DATE
)
PARTITION BY RANGE(date_created)
SUBPARTITION BY HASH(id)
SUBPARTITIONS 8
(
   PARTITION p1 VALUES LESS THAN (TO_DATE('01-JAN-2022', 'DD-MON-YYYY')),
   PARTITION p2 VALUES LESS THAN (TO_DATE('01-JAN-2023', 'DD-MON-YYYY')),
   PARTITION p3 VALUES LESS THAN (MAXVALUE)
);

SELECT * FROM LOAN;
SELECT * FROM FILIAL;

CREATE TABLE loan_partition (
  contract_id   NUMBER        NOT NULL,
  first_name    VARCHAR2(50),
  last_name     VARCHAR2(50),
  amount        NUMBER,
  currency_id   VARCHAR2(3),
  interest_rate NUMBER,
  filial_id     NUMBER,
  commission    NUMBER,
  email         VARCHAR2(100))
PARTITION BY RANGE(amount)
SUBPARTITION BY LIST(currency_id)
(PARTITION p1 VALUES LESS THAN (1000) 
  ( SUBPARTITION p1_usd VALUES ('USD'),
    SUBPARTITION p1_eur VALUES ('EUR'),
    SUBPARTITION p1_other VALUES (DEFAULT)
  ),
  PARTITION p2 VALUES LESS THAN (10000)
  ( SUBPARTITION p2_usd VALUES ('USD'),
    SUBPARTITION p2_eur VALUES ('EUR'),
    SUBPARTITION p2_other VALUES (DEFAULT)
    ),
  PARTITION p3 VALUES LESS THAN (MAXVALUE)
  ( SUBPARTITION p3_usd VALUES ('USD'),
    SUBPARTITION p3_eur VALUES ('EUR'),
    SUBPARTITION p3_other VALUES (DEFAULT)));

INSERT INTO loan_partition (
contract_id, first_name, last_name, amount,
currency_id, interest_rate, filial_id, commission, email)
SELECT contract_id, first_name, last_name, amount, 
currency_id, interest_rate, filial_id, commission, email
FROM loan;

SELECT * FROM LOAN_PARTITION ORDER BY CONTRACT_ID;

ALTER TABLE LOAN MODIFY PARTITION BY LIST(FILIAL_ID)
(
    PARTITION P1 VALUES (1),
    PARTITION P2 VALUES (2),
    PARTITION P3 VALUES (3),
    PARTITION P4 VALUES (4)
);
SELECT * FROM LOAN;

select * from emp;

ALTER TABLE EMP 
MODIFY PARTITION BY LIST(DEPTNO)
(
    PARTITION P1 VALUES(10),
    PARTITION P2 VALUES(20),
    PARTITION P3 VALUES(30)
);
