select * FROM employees;
SELECT * FROM departments;
INSERT INTO departments 
VALUES(1, 'Public sector');
INSERT INTO departments 
VALUES(2, 'Private sector');
SELECT * FROM DEPARTMENTS;


INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (1,'Jane', 'Doe', 6000, 2, '456 Elm St', 'janedoe@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (2,'Bob', 'Smith', 5500, 1, '789 Maple St', 'bobsmith@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (3,'Mary', 'Johnson', 6500, 2, '101 Oak St', 'maryjohnson@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (4,'Tom', 'Williams', 7000, 2, '202 Pine St', 'tomwilliams@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (5,'Sara', 'Lee', 4500, 1, '303 Cedar St', 'saralee@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (6,'David', 'Brown', 8000, 2, '404 Birch St', 'davidbrown@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (7,'Karen', 'Davis', 7500, 1, '505 Walnut St', 'karendavis@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (8,'Mike', 'Wilson', 6000, 1, '606 Spruce St', 'mikewilson@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (9,'Jennifer', 'Taylor', 6500, 2, '707 Pineapple St', 'jennifertaylor@example.com');
INSERT INTO employees (employeeID ,name, surname, salary, departmentID, address, email)
VALUES (10,'Chris', 'Lee', 5500, 1, '808 Banana St', 'chrislee@example.com');
SELECT * FROM employees;


--Net Salary çıxaran sorğu
SELECT EMPLOYEEID, SALARY,W.VERGI ,SALARY- VERGI AS NET_SALARY , D.DEPARTMENTNAME FROM (
SELECT CASE departmentid
WHEN 2 THEN 
CASE
WHEN SALARY >8000 THEN SALARY*0.14 + (80+ (SALARY-8000)*0.5)+ (6+ (SALARY-200)*0.1)
WHEN SALARY > 200 THEN (6+ (SALARY-200)0.1) + (SALARY 0.02)/2 
WHEN SALARY < 200 THEN SALARY*0.03 + (SALARY* 0.02)/2 
END 
WHEN 1 THEN 
CASE
WHEN SALARY > 2500 THEN 
CASE 
WHEN SALARY < 8000 THEN 350 + (SALARY -2500)*0.25 + SALARY*0.02 + SALARY*0.03
WHEN SALARY > 8000 THEN 350 + (SALARY -2500)*0.25 + 160+ (SALARY-8000)*0.005 + SALARY*0.03
END
WHEN SALARY < 2500 THEN  SALARY*0.02 + SALARY*0.03 + (SALARY-200)*0.14

END 
END VERGI ,S.* FROM EMPLOYEES S) W, DEPARTMENTS D WHERE D.DEPARTMENTID = W.DEPARTMENTID ;
