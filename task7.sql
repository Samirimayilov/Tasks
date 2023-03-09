CREATE TABLE departments (
  departmentID INT PRIMARY KEY,
  departmentName NVARCHAR2(20) NOT NULL
);
CREATE TABLE employees (
  employeeID INT PRIMARY KEY,
  name NVARCHAR2(50) NOT NULL,
  surname NVARCHAR2(50) NOT NULL,
  salary NUMBER(10) NOT NULL,
  departmentID NUMBER(5),
  address NVARCHAR2(100),
  email NVARCHAR2(40) UNIQUE,
  FOREIGN KEY (departmentID) REFERENCES departments(departmentID)
);

INSERT INTO departments 
VALUES(1, 'Sales');
INSERT INTO departments 
VALUES(2, 'Marketing');
INSERT INTO departments 
VALUES(3, 'Human Resources');
SELECT * FROM DEPARTMENTS;

INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (1,'Jane', 'Doe', 6000, 2, '456 Elm St', 'janedoe@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (2,'Bob', 'Smith', 5500, 1, '789 Maple St', 'bobsmith@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (3,'Mary', 'Johnson', 6500, 3, '101 Oak St', 'maryjohnson@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (4,'Tom', 'Williams', 7000, 2, '202 Pine St', 'tomwilliams@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (5,'Sara', 'Lee', 4500, 1, '303 Cedar St', 'saralee@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (6,'David', 'Brown', 8000, 2, '404 Birch St', 'davidbrown@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (7,'Karen', 'Davis', 7500, 3, '505 Walnut St', 'karendavis@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (8,'Mike', 'Wilson', 6000, 1, '606 Spruce St', 'mikewilson@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (9,'Jennifer', 'Taylor', 6500, 2, '707 Pineapple St', 'jennifertaylor@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (10,'Chris', 'Lee', 5500, 3, '808 Banana St', 'chrislee@example.com');
SELECT * FROM employees;

 SELECT SALARY - VERGI AS NET_SALARY FROM ( SELECT CASE
WHEN SALARY>8000 THEN SALARY*0.14 + (80+ (SALARY-8000)*0.5)+ (6+ (SALARY-200)*0.1)
WHEN SALARY > 200 THEN (6+ (SALARY-200)*0.1) + (SALARY* 0.02)/2 
WHEN SALARY < 200 THEN SALARY*0.03 + (SALARY* 0.02)/2 
END AS VERGI,SALARY FROM EMPLOYEES) ;

--SOL TEREFDEKI BOSLUQLARI KESIR
SELECT LTRIM('    Taylor') FROM DUAL;
--SAG TEREFDEKI BOSLUQLARI KESIR
SELECT RTRIM('Lee       ') FROM DUAL;

--IF ELSE KIMI SERTLERI YOXLAYIR
SELECT CASE 
WHEN SALARY >=8000 THEN 'Varli'
WHEN SALARY >=5000 THEN 'Orta gelir'
WHEN SALARY < 5000 THEN 'Kasib'
end AS SALARY_FERQ FROM EMPLOYEES;

--SWITCH CASE KIMI ISLEYIR
SELECT DECODE(DEPARTMENTID,
2,'MARKETING',
1,'Sales',
3, 'HR'
) AS DEPARTAMEN_NAME, E.* FROM EMPLOYEES E;

--NULL DEYERLI XANAYA YAZI CIXARIR
UPDATE EMPLOYEES SET ADDRESS = NULL WHERE EMPLOYEEID = 4;
SELECT NVL(ADDRESS,'EVSIZ') as evsizler from employees;
--NULL DEYERLI VE NULL DEYERI OLMAYAN XANALARA YAZI CIXARIR
SELECT NVL2(ADDRESS,'EVLI-ESIKLI','EVSIZ') FROM EMPLOYEES;
--SERTI ODEYEN XANANI NULL EDIR
SELECT NULLIF(DEPARTMENTID,2) FROM EMPLOYEES;
--ILK NULL OLMAYAN DEYERI QAYTARIR
SELECT COALESCE(NULL,NULL,'NULL','NULL DEYIL') from dual;
